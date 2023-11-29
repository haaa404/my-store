import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_store/widgets/small_text.dart';

TextStyle appBarStyle = GoogleFonts.playfairDisplay(
  fontSize: 27,
  fontWeight: FontWeight.w700,
  color: Colors.black,
  letterSpacing: .2,
);

//Rating bar row
Widget getRatingBar(String rating,double size){
  return  Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      SmallText(text: rating, weight: FontWeight.w800, size: size, letterSpacing: 0,),

      getRating(rating, size),
    ],
  );
}

Widget getRating(rating, size){
  return RatingBar.builder(
    initialRating: double.parse(rating),
    minRating: 1,
    itemSize: size,
    direction: Axis.horizontal,
    allowHalfRating: true,
    itemCount: 5,
    itemBuilder: (context, _) => const Icon(
      Icons.star,
      color: Colors.amber,
    ),
    ignoreGestures: true,
    onRatingUpdate: (_){},
  );
}
