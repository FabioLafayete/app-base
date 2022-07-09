import 'package:app/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Themes extends GetxController{

  bool isDarkMode = false;

  void toggleDarkMode() {
    isDarkMode = !isDarkMode;
    if (isDarkMode) {
      Get.changeTheme(darkTheme);
      Get.isDarkMode;
    } else {
      Get.changeTheme(lightTheme);
    }
    update();
  }

  final lightTheme = ThemeData.light().copyWith(
    primaryColor: AppColors().light.primary,
    primaryColorLight: AppColors().light.secondary,
    backgroundColor: AppColors().light.background,
    errorColor: AppColors().light.error,
    textTheme: TextTheme(
      bodyText1: TextStyle(color: AppColors().light.text),
      bodyText2: TextStyle(color: AppColors().light.textSecondary),
    )
  );

  final darkTheme = ThemeData.light().copyWith(
      primaryColor: AppColors().dark.primary,
      primaryColorLight: AppColors().dark.secondary,
      backgroundColor: AppColors().dark.background,
      errorColor: AppColors().dark.error,
      textTheme: TextTheme(
        bodyText1: TextStyle(color: AppColors().dark.text),
        bodyText2: TextStyle(color: AppColors().dark.textSecondary),
      )
  );

}