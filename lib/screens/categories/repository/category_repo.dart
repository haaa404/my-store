import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class CategoriesRepo {
  Future<List<dynamic>> getCategories() async {

    List<dynamic> list = [];

    const String url = 'https://dummyjson.com/products/categories';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {

        list = jsonDecode(response.body) as List<dynamic>;
      }

      return list;

    } catch (error, stack) {

      debugPrint('Stack : ..... ${stack.toString()}');

      return list;

    }
  } //fun
} //class
