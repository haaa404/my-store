import 'package:flutter/material.dart';
import 'package:my_store/utilis.dart';
import 'package:my_store/widgets/small_text.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    super.key,
    required this.price,
    required this.name,
    required this.imageUrl,
    required this.category,
    required this.company,
    required this.rating,
  });

  final String imageUrl, name, price, rating, company, category;

  Widget getNamePriceRow(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        SmallText(text: name, size: 13, letterSpacing: 0,height: 0, weight: FontWeight.bold,),

        SmallText(text: '\$$price', size: 13,letterSpacing: 0,height: 0, weight: FontWeight.bold,),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: SizedBox(
        height: size.height * .38,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Align(
                  alignment: Alignment.topCenter,
                  child: Center(
                    child: Image.network(imageUrl, fit: BoxFit.fill,
                      height: size.height * .25,
                      width: size.width * .8,
                    ),
                  ),
                ),

                const SizedBox(height: 13,),

                //Row -> name , price
                getNamePriceRow(),

                const SizedBox(height: 2,),

                //Row -> rating number, rating bar
               getRatingBar(rating, 10.0),

                const SizedBox(height: 6,),

                SmallText(text: 'By $company', color: Colors.grey, size: 11,),

                const SizedBox(height: 7,),

                SmallText(text: 'In $category', size: 12, weight: FontWeight.bold,),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
