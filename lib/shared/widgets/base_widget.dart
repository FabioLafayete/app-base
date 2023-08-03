import 'package:app/config/app_config.dart';
import 'package:app/route/my_router.dart';
import 'package:app/shared/model/user/user_model.dart';
import 'package:app/shared/modules/user/controller/user_controller.dart';
import 'package:app/shared/widgets/app_theme_widget.dart';
import 'package:app/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';

abstract class BaseWidget<T extends Store> extends StatelessWidget {

  BaseWidget({Key? key}) : super(key: key);

  final Set<T> _value = <T>{};
  final MyRouter router = MyRouter();
  final AppColors colors = AppColors();
  final AppConfig config = AppConfig();
  final AppTheme appTheme = AppTheme();
  UserModel get user => Modular.get<UserController>().user;

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
    if (_value.isEmpty) _value.add(Modular.get<T>());
    return _value.first;
  }

  @override
  Widget build(BuildContext context);
}