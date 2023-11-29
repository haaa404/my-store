import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SmallText extends StatelessWidget {
  final String text;
  final double size;
  final FontWeight weight;
  final Color color;
  final double letterSpacing;
  final double height;
  final TextAlign textAlign;
  final TextOverflow overFlow;

  const SmallText(
      {super.key,
        required this.text,
        this.size = 14,
        this.weight = FontWeight.normal,
        this.color = Colors.black,
        this.letterSpacing = .7,
        this.height = 1.2,
        this.textAlign = TextAlign.center,
        this.overFlow = TextOverflow.visible,
      });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overFlow,
      textAlign: textAlign,
      style: GoogleFonts.lato(
        fontSize: size,
        fontWeight: weight,
        color: color,
        height: height,
        letterSpacing: letterSpacing,

      ),
    );
  }
}
