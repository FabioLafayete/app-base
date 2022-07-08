import 'package:app/components/base_page.dart';
import 'package:app/modules/login/widgets/welcome_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../components/base_widget.dart';
import '../../components/bottom_sheet.dart';
import 'login_view_model.dart';

class LoginPage extends BaseWidget<LoginViewModel> {

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WelcomeWidget(
      signInOnPress: _login
    );
  }

  void _login(){
    CustomBottomSheet.show(
        Container(
          color: colors.background,
          child: Center(
            child: text('teste'),
          ),
        ),

    );
  }

}
