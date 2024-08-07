import 'package:flutter/material.dart';

class AppTheme {

  Widget text (String text, {
    int? maxLines,
    TextAlign? textAlign,
    TextOverflow? textOverflow,
    Color? color,
    double? fontSize,
    double? letterSpacing,
    FontWeight? fontWeight,
    double? height,
    TextDecoration? decoration
  }){
    return Text(
      text,
      maxLines: maxLines,
      overflow: textOverflow,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        height: height,
        decoration: decoration,
        fontFamily: 'Inter'
      ),
    );
  }
}