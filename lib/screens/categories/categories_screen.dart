import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:my_store/screens/categories/controller/categories_controller.dart';
import 'package:my_store/screens/categories/widgets/category_widget.dart';
import 'package:my_store/utilis.dart';
import 'package:my_store/widgets/small_text.dart';
import 'package:my_store/widgets/text_field_widget.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final _controller = TextEditingController();
  late Future<List<dynamic>> _categoryList;
  List<dynamic>? _searchCategories = [];
  List<dynamic>? _response = [] ;


  @override
  void initState() {
    super.initState();

    _categoryList = getCategory();

    _controller.addListener(() {
      if(_controller.text == ''){
        setState(() {});
      }
    });
  }

  Future<List<dynamic>> getCategory() async{
    return await CategoriesController().getCategories();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }


  onSubmit() {

    final text = _controller.text;
    if (text.isNotEmpty && _searchCategories!.isNotEmpty) {
      _response = [];
      for (dynamic category in _searchCategories!) {
        if (text.toLowerCase().substring(0, 2) ==
            category.toLowerCase().substring(0, 2)) {
          _response!.add(category);
        } //if
      } //for
    } //outer if

    setState(() {});
  } //fun


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Categories', style: appBarStyle,),
          centerTitle: true,
        ),
        body: Column(
          children: [
            //search bar
            TextFieldWidget(onSubmit: onSubmit, controller: _controller, hint: 'Apple'),

            const SizedBox(height: 17),

            //categories
            _controller.text.isEmpty || _response!.isEmpty ?
           FutureBuilder<List<dynamic>>(
               future: _categoryList,
               builder: (context, snapshot){

                 if(snapshot.connectionState == ConnectionState.done)
                 {

                   if(snapshot.hasData)
                   {
                     _searchCategories = snapshot.data!;
                     return CategoryWidget(category: snapshot.data!);
                   }
                   else if(snapshot.hasError)
                   {
                     return const Center(
                       child: SmallText(text: 'Some error has occured.',color: Colors.grey),
                     );
                   }
                   else{
                     return const Center(
                       child: SpinKitWave(color: Colors.greenAccent,),
                     );
                   }
                 }

                 return const Center(
                   child: SpinKitWave(color: Colors.greenAccent,),
                 );

               },
           ) :

          CategoryWidget(category: _response!),

          ],
        ),
      ),
    );
  }
}
