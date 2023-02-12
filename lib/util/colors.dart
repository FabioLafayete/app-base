import 'package:flutter/material.dart';

class AppColors {

  final ColorsSchema _light = ColorsSchema(
    text: Colors.black,
    textSecondary: Colors.black54,
    text2: Colors.white,
    textSecondary2: Colors.grey,
    primary: Colors.pink.shade400,
    secondary: Colors.pink.shade700,
    background: Colors.white,
    error: const Color(0xFFC21D4F),
  );

  final ColorsSchema _dark = ColorsSchema(
    text: Colors.black,
    textSecondary: Colors.black54,
    text2: Colors.white,
    textSecondary2: Colors.grey,
    primary: Colors.pink.shade400,
    secondary: Colors.pink.shade700,
    background: Colors.white,
    error: const Color(0xFFC21D4F),
  );


  Color get text => _light.text;
  Color get textSecondary => _light.textSecondary;
  Color get text2 => _light.text2;
  Color get textSecondary2 => _light.textSecondary2;
  Color get primary => _light.primary;
  Color get secondary => _light.secondary;
  Color get background => _light.background;
  Color get error => _light.error;

}

class ColorsSchema {

  final Color background;
  final Color primary;
  final Color secondary;
  final Color text;
  final Color textSecondary;
  final Color text2;
  final Color textSecondary2;
  final Color error;

  ColorsSchema({
    required this.primary,
    required this.textSecondary,
    required this.text,
    required this.text2,
    required this.textSecondary2,
    required this.secondary,
    required this.background,
    required this.error,
  });

}