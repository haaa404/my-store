import 'package:flutter/material.dart';
import 'package:my_store/routes.dart';
import 'package:my_store/widgets/small_text.dart';

import '../../../utilis.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
    required this.category,
  });

  final List<dynamic> category;

  //Category selected
   fun(context, String category) {
     Navigator.pushNamed(context, AppRoutes.productScreen, arguments: {
       'arg': category,
     });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: GridView.builder(
            itemCount: category.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () => fun(context, category[index].toString()),
                child: Container(
                  margin: const EdgeInsets.all(15),
                  // height: 20,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhze-QNnca2liBrhRj4CjswGZSkqbhvSDJsQ&usqp=CAU'),
                      )),
                  child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20, left: 10),
                        child: SmallText(
                          text: category[index].toString(),
                          color: Colors.white,
                          letterSpacing: 0,
                          weight: FontWeight.bold,
                        ),
                      )),
                ),
              );
            }),
      ),
    );
  }
}
