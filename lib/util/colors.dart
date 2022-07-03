import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppColors {

  final ColorsSchema _light = ColorsSchema(
      text: Colors.black,
      textSecondary: Colors.black38,
      primary: const Color.fromRGBO(246, 83, 32, 1),
      background: Colors.white,
  );

  final ColorsSchema _dark = ColorsSchema(
      text: Colors.white,
      textSecondary: Colors.white60,
      primary: const Color.fromRGBO(246, 83, 32, 1),
      background: const Color.fromRGBO(25, 25, 57, 1),
  );

  ColorsSchema get light => _light;
  ColorsSchema get dark => _dark;

  Color get text => Get.context!.theme.textTheme.bodyText1!.color!;
  Color get textSecondary => Get.context!.theme.textTheme.bodyText2!.color!;
  Color get primary => Get.context!.theme.primaryColor;
  Color get background => Get.context!.theme.backgroundColor;

}

class ColorsSchema {

  final Color background;
  final Color primary;
  final Color text;
  final Color textSecondary;

  ColorsSchema({
    required this.textSecondary,
    required this.text,
    required this.primary,
    required this.background
  });

}