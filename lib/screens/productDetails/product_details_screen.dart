import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/screens/favourites/controller/favourite_controller.dart';
import 'package:my_store/screens/products/model/product_model.dart';
import 'package:my_store/utilis.dart';
import 'package:my_store/widgets/small_text.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({
    super.key,
    required this.model,
  });

  final Products model;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final FavouriteController _favouriteController = Get.put(FavouriteController());

  onClick(){
      if(_favouriteController.favourites.contains(widget.model)) {
        _favouriteController.removeFromFavourites(widget.model);}
      else{
        _favouriteController.addToFavourite(widget.model);
      }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Product Details',
          style: appBarStyle,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Center(
            child: SizedBox(
                height: MediaQuery.sizeOf(context).height * .25,
                width: MediaQuery.sizeOf(context).width * 1,
                child: Image.network(
                  widget.model.thumbnail.toString(),
                  fit: BoxFit.fill,
                )),
          ),
          const SizedBox(
            height: 13,
          ),
          getRowIcon(),
          getRow(title: 'Name', value: widget.model.title.toString()),
          getRow(title: 'Price', value: widget.model.price.toString()),
          getRow(title: 'Category', value: widget.model.category.toString()),
          getRow(title: 'Brand', value: widget.model.brand.toString()),
          getRow(title: 'Rating', value: widget.model.rating.toString(), size: 11.0),
          getRow(title: 'Stock', value: widget.model.stock.toString()),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 17, vertical: 5),
            child: SmallText(
              text: 'Description',
              weight: FontWeight.w900,
              size: 15,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 5),
            child: SizedBox(
                width: MediaQuery.sizeOf(context).width * .8,
                child: SmallText(
                  text: widget.model.description.toString(),
                  weight: FontWeight.bold,
                  textAlign: TextAlign.start,
                )),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 17, vertical: 5),
            child: SmallText(
              text: 'Product Gallery: ',
              weight: FontWeight.w900,
              size: 15,
            ),
          ),

          getImages(),

        ],
      ),
    );
  }

  Widget getRowIcon() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SmallText(
            text: 'Product Details: ',
            weight: FontWeight.w900,
            size: 19,
          ),
          Obx(() =>
        IconButton(
            onPressed: onClick,
            icon:  _favouriteController.favourites.contains(widget.model) ?
            const Icon(Icons.favorite, size: 30,
              color: Colors.red,
            )
           : const Icon(Icons.favorite_outline, size: 30,
            color: Colors.black,
              ),),
          ),
        ],
      ),
    );
  }

  getRow({required title, required value, size}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SmallText(
            text: '$title:',
            weight: FontWeight.w900,
            size: 15,
          ),
          const SizedBox(
            width: 8,
          ),
          title == 'Rating'
              ? getRatingBar(value, size)
              : SmallText(
                  text: value,
                  weight: FontWeight.bold,
                ),
        ],
      ),
    );
  }

  Widget getImages(){
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.custom(
          scrollDirection: Axis.vertical,
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverWovenGridDelegate.count(
            crossAxisCount: 2,
            mainAxisSpacing: 1,
            crossAxisSpacing: 1,
            pattern: const [
              WovenGridTile(1),
              WovenGridTile(
                5 / 7,
                crossAxisRatio: 0.9,
                alignment: AlignmentDirectional.centerEnd,
              ),
            ],
          ),
          childrenDelegate: SliverChildBuilderDelegate(
            childCount: widget.model.images!.length,
                (context, index) => Image.network(widget.model.images![index], fit: BoxFit.cover,),
          ),
        ),
      ),
    );
  }
}
