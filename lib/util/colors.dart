import 'package:flutter/material.dart';

class AppColors {
//primary: const Color(0xFF04f6ea),
  final ColorsSchema _light = ColorsSchema(
    text: Colors.black,
    textSecondary: Colors.black54,
    text2: Colors.white,
    textSecondary2: Colors.grey,
    // primary: Colors.pink.shade400,
    // secondary: Colors.pink.shade700,
    // primary: Colors.purple.shade400,
    // secondary: Colors.purple.shade700,

    // primary: const Color(0xFF6357DD),
    // primary: const Color(0xFF43127a),
    // primary: const Color(0xFF441f89),
    // primary: const Color(0xFF4c9ffe),
    // primary: const Color(0xFF26285a),
    primary: const Color(0xFF39117a),

    secondary: Colors.purple.shade700,
    // secondary: Color(0xFFe34cfa),
    // secondary: Color(0xFFddacfe),
    // secondary: Color(0xFF4b0280),

    // secondary: Color(0xFFfe39dd),
    // secondary: Color(0xFFf752c0),

    background: const Color.fromRGBO(246, 246, 246, 1.0),
    // background: const Color.fromRGBO(150, 150, 150, 1.0),
    // background: Colors.white,
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