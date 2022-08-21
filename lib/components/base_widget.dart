import 'package:app/config/app_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../util/colors.dart';
import 'app_theme_widget.dart';

abstract class BaseWidget<T extends GetxController> extends StatelessWidget {

  BaseWidget({Key? key}) : super(key: key);

  final Set<T> _value = <T>{};
  final AppColors colors = AppColors();
  final AppConfig config = AppConfig();
  final AppTheme appTheme = AppTheme();

  final text = AppTheme().text;

  final double width = Get.width;
  final double height = Get.height;

  Widget space(double value, {bool width = false}){
    return SizedBox(
      height: !width ? Get.height * value : 0,
      width: width ? Get.width * value : 0,
    );
  }

  T get controller {
    if (_value.isEmpty) _value.add(Get.find<T>());
    return _value.first;
  }

  @override
  Widget build(BuildContext context);
}
