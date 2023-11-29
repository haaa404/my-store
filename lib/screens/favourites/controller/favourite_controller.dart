import 'package:get/get.dart';

import '../../products/model/product_model.dart';

class FavouriteController extends GetxController{
  RxList<Products> _favourites = <Products>[].obs;

  get favourites => _favourites;

  addToFavourite(Products product){
    _favourites.add(product);
  }

  removeFromFavourites(Products product){
    _favourites.remove(product);
  }


}