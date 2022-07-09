import 'package:app/components/visual_display.dart';
import 'package:app/modules/login/widgets/welcome_widget.dart';
import 'package:flutter/material.dart';
import '../../components/base_widget.dart';
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
    VisualDisplay.bottomSheet(
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            text(
                'Entrar na minha conta',
                color: colors.text,
                fontSize: 20,
                fontWeight: FontWeight.w600
            ),
            space(0.05),
            VisualDisplay.textField(
              labelText: 'E-mail',
              fillColor: Colors.white,
              colorBorder: Colors.white,
              colorBorderFocus: colors.primary,
              colorLabel: colors.textSecondary,
              colorLabelFocus: colors.primary
            )
          ],
        )

    );
  }

}
