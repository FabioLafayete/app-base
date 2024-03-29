import 'package:app/components/custom_button.dart';
import 'package:app/components/visual_display.dart';
import 'package:app/modules/login/controller/login_controller.dart';
import 'package:app/modules/login/widgets/welcome_widget.dart';
import 'package:app/route/pages_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import '../../../components/base_widget.dart';

class LoginPage extends BaseWidget<LoginController> {

  LoginPage({Key? key}) : super(key: key);

  static const router = '${PagesNames.login}/';

  @override
  Widget build(BuildContext context) {
    return WelcomeWidget(
        signInOnPress: () => _login(context)
    );
  }

  void _login(BuildContext context){
    VisualDisplay.bottomSheet(
        Observer(builder: (_) => Column(
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
              controller: controller.controllerEmail,
              labelText: 'E-mail',
              fillColor: Colors.white,
              colorBorder: Colors.white,
              colorCursor: colors.secondary,
              colorBorderFocus: colors.secondary.withOpacity(0.7),
              colorLabel: colors.textSecondary,
              colorLabelFocus: colors.textSecondary,
              textInputType: TextInputType.emailAddress,
              readOnly: controller.showCode,
              errorText: controller.errorEmail,
              onEditingComplete: (){
                if(controller.enableButton){
                  controller.onPress();
                } else {
                  controller.setErrorEmail('Digite um e-mail válido');
                }
              },
              validator: (txt) {
                if(controller.errorEmail != null){
                  return controller.errorEmail;
                }
                if(txt != null){
                  if(!GetUtils.isEmail(txt)){
                    return 'Digite um e-mail válido';
                  }
                }
                return null;
              },
              suffix: controller.showCode ?
              GestureDetector(
                  onTap: controller.changeEmail,
                  child: text(
                      'trocar e-mail', color: colors.primary,
                      fontWeight: FontWeight.w600
                  )
              ) : null,
              onChanged: (email) {
                controller.setEmail(email);
                if(GetUtils.isEmail(email)){
                  controller.setErrorEmail(null);
                }
              },

            ),
            space(0.03),
            if(controller.showCode)
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
                    if(controller.errorCode != null)
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: text(
                          'Código informado inválido',
                          color: colors.error,
                        ),
                      ),
                    if(controller.showCode)
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: CustomButton(
                            title: 'Enviar novo código',
                            colorTitle: colors.primary,
                            cleanButton: true,
                            loading: controller.isLoadingSendCode,
                            loadingColor: colors.primary,
                            onPress: controller.resendCode
                        ),
                      )
                  ],
                ),
              ),
            const Spacer(),
            Observer(builder: (_) => CustomButton(
              title: controller.showCode ? 'VALIDAR CÓDIGO' : 'AVANÇAR',
              colorTitle: colors.background,
              colorButton: colors.primary,
              iconRight: controller.showCode ? false :  true,
              loading: controller.isLoading,
              onPress: controller.enableButton ?
                  () => controller.onPress() : null,
            )),
            space(0.02)
          ],
        )),
        dismissible: false,
        context: context,
        onClose: (){
          controller.cleanLogin();
        }
    );
  }

  Observer pinCodeInput() {
    return Observer(builder: (_) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        VisualDisplay.textFieldPin(
            onChanged: controller.setCode1,
            focusNode: controller.codePart1FocusNode,
            controller: controller.controllerCode1,
            listenText: controller.code1,
            errorText: controller.errorCode
        ),
        VisualDisplay.textFieldPin(
            onChanged: controller.setCode2,
            focusNode: controller.codePart2FocusNode,
            controller: controller.controllerCode2,
            listenText: controller.code2,
            errorText: controller.errorCode
        ),
        VisualDisplay.textFieldPin(
            onChanged: controller.setCode3,
            focusNode: controller.codePart3FocusNode,
            controller: controller.controllerCode3,
            listenText: controller.code3,
            errorText: controller.errorCode
        ),
        VisualDisplay.textFieldPin(
            onChanged: controller.setCode4,
            focusNode: controller.codePart4FocusNode,
            controller: controller.controllerCode4,
            listenText: controller.code4,
            errorText: controller.errorCode
        ),
        VisualDisplay.textFieldPin(
            onChanged: controller.setCode5,
            focusNode: controller.codePart5FocusNode,
            controller: controller.controllerCode5,
            listenText: controller.code5,
            errorText: controller.errorCode
        ),
      ],
    ));
  }

}
