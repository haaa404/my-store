import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/routes.dart';
import 'package:my_store/screens/favourites/controller/favourite_controller.dart';
import 'package:my_store/screens/products/model/product_model.dart';
import 'package:my_store/utilis.dart';
import 'package:my_store/widgets/small_text.dart';

class FavouriteWidget extends StatefulWidget {
  const FavouriteWidget({
    super.key,
    required this.product,
    required this.favController,
  });

  final Products product;
  final FavouriteController favController;

  @override
  State<FavouriteWidget> createState() => _FavouriteWidgetState();
}

class _FavouriteWidgetState extends State<FavouriteWidget> {
  onClick(){
    widget.favController.removeFromFavourites(widget.product);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, AppRoutes.productDetails, arguments: {'arg': widget.product}),
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * .1,
        child: Card(
          child: Row(
            children: [

              const SizedBox(width: 20,),

                 CircleAvatar(
                  backgroundImage: NetworkImage(widget.product.thumbnail.toString()),
                  backgroundColor: Colors.grey,
                  radius: 30,
                ),

                 const SizedBox(width: 20,),

                 Padding(
                   padding: const EdgeInsets.only(top: 13),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: MediaQuery.sizeOf(context).width * .45,
                          child: SmallText(text: widget.product.title.toString(), overFlow: TextOverflow.ellipsis, textAlign: TextAlign.start, weight: FontWeight.w900,size: 14,)),

                      const SizedBox(height: 4,),

                      SmallText(text: '\$${widget.product.price}', weight: FontWeight.w900, size: 11,),

                      const SizedBox(height: 4,),

                      getRatingBar(widget.product.rating.toString(), 12.0),
                    ],
                ),
                 ),


               const Spacer(),

               IconButton(
                  onPressed: onClick,
                  icon: const Icon(Icons.favorite, color: Colors.red,)),


              const SizedBox(width: 15,),

            ],
          ),
        ),
      ),
    );
  }
}
