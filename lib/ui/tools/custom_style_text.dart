import 'package:catalogo_juegos/ui/tools/tools.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomStyleText {
  static TextStyle titleTextCard =const TextStyle(
    color: Colors.white,
    fontSize: 25,
    decoration: TextDecoration.underline,
    decorationColor: Colors.white,
  );

  static TextStyle nameText =const TextStyle(
    color: Colors.white,
    fontSize: 19,
  );

  static TextStyle nameTextDescrip = const TextStyle(
    color: Color(0xFF949d9e),
    fontSize: 18,
  );

  static TextStyle h1 = GoogleFonts.roboto(
    fontSize: 30,
    color: Colors.white,
    fontWeight: FontWeight.w500,
  );
  static TextStyle h2 = GoogleFonts.roboto(
    fontSize: 20,
    color: Colors.white,
    fontWeight: FontWeight.w500,
  );
  static TextStyle subTitleCard = GoogleFonts.roboto(
    fontSize: 15,
    color: CustomColors.colorSubtilte,
    fontWeight: FontWeight.w400,
  );
  static TextStyle subTile1 = GoogleFonts.roboto(
    fontSize: 20,
    color: CustomColors.colorSubtilte,
    fontWeight: FontWeight.w400,
  );

  static TextStyle cardInfoTexth1 = GoogleFonts.roboto(
    fontSize: 20,
    color:const Color(0xFF949d9e),
    fontWeight: FontWeight.w500,
  );
  static TextStyle cardInfoText = GoogleFonts.roboto(
    fontSize: 20,
    color: Colors.white,
    fontWeight: FontWeight.w500,
  );
}
