import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/screens/favourites/controller/favourite_controller.dart';
import 'package:my_store/screens/favourites/widget/favourite_widget.dart';
import 'package:my_store/utilis.dart';

import '../../widgets/text_field_widget.dart';
import '../products/model/product_model.dart';


class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({super.key});

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  final _controller = TextEditingController();
  final FavouriteController _favouriteController = Get.put(FavouriteController());
  List<Products> _response = [];

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      if(_controller.text == ''){
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }


  onClick(){
    if(_favouriteController.favourites.isNotEmpty){
      _response = [];
      for (Products product in _favouriteController.favourites) {
        if (_controller.text.toLowerCase().substring(0,2) == product.title!.toLowerCase().substring(0,2)) {
          _response.add(product);
        }
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Favourites', style: appBarStyle,),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                //Search Bar
                TextFieldWidget(onSubmit: onClick, controller: _controller, hint: 'Iphone'),

                const SizedBox(height: 30,),

                //Favourite Card
                _controller.text.isEmpty || _response.isEmpty ?
               Obx(
                 () =>  ListView.builder(
                   scrollDirection: Axis.vertical,
                   physics: const NeverScrollableScrollPhysics(),
                   shrinkWrap: true,
                   itemCount: _favouriteController.favourites.length,
                     itemBuilder: (context, index){
                     final Products data = _favouriteController.favourites[index];
                       return FavouriteWidget(product: data, favController: _favouriteController);
                     }
                 ),
               ) :
                Obx(
                      () =>  ListView.builder(
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: _response.length,
                      itemBuilder: (context, index){
                        final Products data = _response[index];
                        return FavouriteWidget(product: data, favController: _favouriteController);
                      }
                  ),
                ),



              ],
            ),
          ),
        ),
      ),
    );
  }
}
