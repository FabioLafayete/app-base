import 'package:app/components/custom_button.dart';
import 'package:app/components/visual_display.dart';
import 'package:app/modules/login/widgets/welcome_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        Obx(() =>  Column(
         children: [
           text(
               'Entrar na minha conta',
               color: colors.text,
               fontSize: 20,
               fontWeight: FontWeight.w600,
               textAlign: TextAlign.start
           ),
           space(0.05),
           VisualDisplay.textField(
               controller: viewModel.controllerEmail,
               labelText: 'E-mail',
               fillColor: Colors.white,
               colorBorder: Colors.white,
               colorCursor: colors.secondary,
               colorBorderFocus: colors.secondary.withOpacity(0.7),
               colorLabel: colors.textSecondary,
               colorLabelFocus: colors.secondary.withOpacity(0.7),
               textInputType: TextInputType.emailAddress,
               onChanged: (email) => viewModel.setEmail(email)
           ),
           space(0.03),
           if(viewModel.showCode)
             Container(
               margin: EdgeInsets.symmetric(horizontal: width * 0.01).copyWith(
                 bottom: height * 0.03,
               ),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   text(
                       'Informe o código enviado no seu e-mail...',
                       color: colors.textSecondary
                   ),
                   space(0.02),
                   pinCodeInput(),
                 ],
               ),
             ),
           const Spacer(),
           CustomButton(
             title: 'AVANÇAR',
             colorTitle: colors.background,
             colorButton: colors.primary,
             iconRight: true,
             loading: viewModel.isLoading,
             onPress: viewModel.enableButton() ? (){
               viewModel.sendCode();
             } : null,
           ),
           space(0.03)
         ],
       )),
        dismissible: false,
        onClose: (){
          viewModel.bottomSheet.setHeightBottomSheet(0.5);
          viewModel.cleanLogin();
        }
    );
  }

  Obx pinCodeInput() {
    return Obx(() => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        VisualDisplay.textFieldPin(
            onChanged: viewModel.setCode1,
            focusNode: viewModel.codePart1FocusNode,
            controller: viewModel.controllerCode1,
            listenText: viewModel.code1
        ),
        VisualDisplay.textFieldPin(
            onChanged: viewModel.setCode2,
            focusNode: viewModel.codePart2FocusNode,
            controller: viewModel.controllerCode2,
            listenText: viewModel.code2
        ),
        VisualDisplay.textFieldPin(
            onChanged: viewModel.setCode3,
            focusNode: viewModel.codePart3FocusNode,
            controller: viewModel.controllerCode3,
            listenText: viewModel.code3
        ),
        VisualDisplay.textFieldPin(
            onChanged: viewModel.setCode4,
            focusNode: viewModel.codePart4FocusNode,
            controller: viewModel.controllerCode4,
            listenText: viewModel.code4
        ),
        VisualDisplay.textFieldPin(
            onChanged: viewModel.setCode5,
            focusNode: viewModel.codePart5FocusNode,
            controller: viewModel.controllerCode5,
            listenText: viewModel.code5
        ),
      ],
    ));
  }

}
