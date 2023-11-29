import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_store/screens/products/model/product_model.dart';

class ProductRepo {


  Future<ProductModel?> getProducts() async {

    const  String url = 'https://dummyjson.com/products?limit=100';

    ProductModel? model;

    try
    {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {

        Map<String, dynamic> body = jsonDecode(response.body);
        model =  ProductModel.fromJson(body);
      }

      return model;

    }
      catch (error, stack)
      {

        debugPrint('Error: ${error.toString()}');
        debugPrint('Stack: ${stack.toString()}');

        return model;

      }

    }//fun


}//class