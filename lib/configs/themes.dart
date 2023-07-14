import 'package:edu_flash/configs/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final appTheme = ThemeData(

  primaryColor: kGreen,

  textTheme: TextTheme(
    bodyText2: TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontFamily: GoogleFonts.notoSans().fontFamily,
    ),
    headline1: TextStyle(
      color: Colors.white,
      fontSize: 58,
      fontFamily: GoogleFonts.notoSans().fontFamily,
      fontWeight: FontWeight.bold,
    ),
  ),
  appBarTheme: AppBarTheme(
    elevation: 0,
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontFamily: GoogleFonts.notoSans().fontFamily,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    color: kGreen,
  ),
  scaffoldBackgroundColor: kBlue,

);