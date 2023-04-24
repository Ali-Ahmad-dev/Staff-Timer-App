 
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timefolio/styles/ColorSelect.dart';

class TextStyles {
  final headingText = GoogleFonts.ubuntu(
    textStyle: TextStyle(
      color: ColorSelect.primaryClr,
      fontSize: 28,
    ),
  );
  final bodyTextWhite = GoogleFonts.ubuntu(
    textStyle: const TextStyle(
      color: ColorSelect.whiteClr,
      fontSize: 18,
    ),
  );
  final bodyTextUnderline = GoogleFonts.ubuntu(
    textStyle: const TextStyle(
      color: ColorSelect.primaryClr,
      decoration: TextDecoration.underline,
      fontSize: 14,
    ),
  );
  final bodyText = GoogleFonts.ubuntu(
    textStyle: const TextStyle(
      color: ColorSelect.primaryClr,
      fontSize: 15,
    ),
  );
  final bodyTextBold = GoogleFonts.ubuntu(
    textStyle: const TextStyle(
      color: ColorSelect.primaryClr,
      fontSize: 18,
    ),
  );
  final smallText = GoogleFonts.ubuntu(
    textStyle: const TextStyle(
      color: ColorSelect.primaryClr,
      fontSize: 12,
      fontWeight: FontWeight.bold,
    ),
  );
}
