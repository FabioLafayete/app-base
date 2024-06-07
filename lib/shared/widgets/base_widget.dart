import 'package:app/config/app_config.dart';
import 'package:app/config/app_local.dart';
import 'package:app/route/my_router.dart';
import 'package:app/shared/model/user/user_model.dart';
import 'package:app/shared/modules/user/controller/user_controller.dart';
import 'package:app/shared/widgets/app_theme_widget.dart';
import 'package:app/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class BaseState<T extends Object> extends StatelessWidget {

  BaseState({Key? key}) : super(key: key);

  final Set<T> _value = <T>{};

  final MyRouter router = MyRouter();
  final AppColors colors = AppColors();
  final AppConfig config = AppConfig();
  final AppLocal local = AppLocal();
  final AppTheme appTheme = AppTheme();

  UserModel get user => Modular.get<UserController>().user;

  final text = AppTheme().text;

  double get width => MediaQueryData.fromView(WidgetsBinding.instance.window).size.width;
  double get height => MediaQueryData.fromView(WidgetsBinding.instance.window).size.height;

  Widget space(double value, {bool width = false}){
    return SizedBox(
      height: !width ? this.height * value : 0,
      width: width ? this.width * value : 0,
    );
  }

  T get controller {
    if (_value.isEmpty) _value.add(Modular.get<T>());
    return _value.first;
  }
}
