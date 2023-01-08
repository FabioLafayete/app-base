import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppColors {

  final ColorsSchema _light = ColorsSchema(
    text: Colors.white,
    textSecondary: Colors.white60,
    primary: Colors.pink.shade400,
    secondary: Colors.pink.shade700,
    background: const Color.fromRGBO(245, 245, 245, 1),
    error: const Color(0xFFC21D4F),
  );

  final ColorsSchema _dark = ColorsSchema(
      text: Colors.black,
      textSecondary: Colors.black54,
      primary: Colors.pink.shade400,
      secondary: Colors.pink.shade700,
      background: const Color.fromRGBO(245, 245, 245, 1),
      error: const Color(0xFFC21D4F),
  );



  ColorsSchema get light => _light;
  ColorsSchema get dark => _dark;

  Color get text => Get.context!.theme.textTheme.bodyText1!.color!;
  Color get textSecondary => Get.context!.theme.textTheme.bodyText2!.color!;
  Color get primary => Get.context!.theme.primaryColor;
  Color get secondary => Get.context!.theme.primaryColorLight;
  Color get background => Get.context!.theme.backgroundColor;
  Color get error => Get.context!.theme.errorColor;

}

class ColorsSchema {

  final Color background;
  final Color primary;
  final Color secondary;
  final Color text;
  final Color textSecondary;
  final Color error;

  ColorsSchema({
    required this.textSecondary,
    required this.text,
    required this.primary,
    required this.secondary,
    required this.background,
    required this.error,
  });

}