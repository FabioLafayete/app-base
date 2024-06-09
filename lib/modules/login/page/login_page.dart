import 'package:app/modules/login/controller/login_controller.dart';
import 'package:app/modules/login/widgets/welcome_widget.dart';
import 'package:app/shared/widgets/base_widget.dart';
import 'package:app/shared/widgets/my_button.dart';
import 'package:app/shared/widgets/visual_display.dart';
import 'package:easy_mask/easy_mask.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class LoginPage extends BaseState<LoginController> {
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WelcomeWidget(
      signInOnPress: (signUp) => _login(
        context,
        isSingUp: signUp,
      ),
    );
  }

  void _login(BuildContext context, {bool isSingUp = false}) {
    dynamic tr = local.tr['login']['bottomSheet'];
    VisualDisplay.bottomSheet(
        Observer(
            builder: (_) => Column(
                  children: [
                    text(isSingUp ? tr['titleSignUp'] : tr['title'],
                        color: colors.text,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.start),
                    space(0.03),
                    VisualDisplay.textField(
                      controller: controller.controllerEmail,
                      labelText: tr['emailHint'],
                      fillColor: Colors.white,
                      colorBorder: Colors.white,
                      colorCursor: colors.secondary,
                      colorBorderFocus: colors.secondary.withOpacity(0.7),
                      colorLabel: colors.textSecondary,
                      colorLabelFocus: colors.textSecondary,
                      textInputType: TextInputType.emailAddress,
                      readOnly: controller.showCode,
                      errorText: controller.errorEmail,
                      onEditingComplete: () {
                        if (controller.enableButton) {
                          controller.onPress(context);
                        } else {
                          controller.setErrorEmail(tr['emailError']);
                        }
                      },
                      validator: (txt) {
                        if (controller.errorEmail != null) {
                          return controller.errorEmail;
                        }
                        if (txt != null) {
                          if (!EmailValidator.validate(txt)) {
                            return tr['emailError'];
                          }
                        }
                        return null;
                      },
                      suffix: controller.showCode
                          ? GestureDetector(
                              onTap: () => controller.changeEmail(context),
                              child: text(tr['emailChange'],
                                  color: colors.primary,
                                  fontWeight: FontWeight.w600))
                          : null,
                      onChanged: (email) {
                        controller.setEmail(email);
                        if (EmailValidator.validate(email)) {
                          controller.setErrorEmail(null);
                        }
                      },
                    ),
                    if (controller.showPassword) ...[
                      space(0.02),
                      VisualDisplay.textField(
                        controller: controller.controllerPassword,
                        labelText: tr['passwordHint'],
                        obscure: controller.obscureText,
                        fillColor: Colors.white,
                        colorBorder: Colors.white,
                        colorCursor: colors.secondary,
                        colorBorderFocus: colors.secondary.withOpacity(0.7),
                        colorLabel: colors.textSecondary,
                        colorLabelFocus: colors.textSecondary,
                        textInputType: TextInputType.emailAddress,
                        readOnly: controller.showCode,
                        maxLines: 1,
                        onChanged: controller.setPassword,
                        suffix: IconButton(
                          padding: const EdgeInsets.only(bottom: 12),
                          onPressed: () {
                            controller.setObscureText(!controller.obscureText);
                          },
                          icon: !controller.obscureText
                              ? const Icon(Icons.visibility_outlined)
                              : const Icon(Icons.visibility_off_outlined),
                        ),
                        onEditingComplete: () {
                          if (controller.enableButton) {
                            controller.onPress(context);
                          }
                        },
                        validator: (txt) {
                          if (txt != null) {
                            if (txt.isEmpty) {
                              return tr['passwordError'];
                            }
                          }
                          return null;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: MyButton(
                          title: tr['forgetPassword'],
                          colorTitle: colors.primary,
                          cleanButton: true,
                          loading: controller.isLoadingSendCode,
                          loadingColor: colors.primary,
                          onPress: () {
                            controller.setForceSendCode(true);
                            controller.resendCode(context);
                          },
                        ),
                      )
                    ],
                    space(0.03),
                    if (controller.showCode)
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: width * 0.01)
                            .copyWith(
                          bottom: height * 0.03,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            text(tr['codeSendEmail'],
                                color: colors.textSecondary),
                            space(0.02),
                            pinCodeInput(context),
                            if (controller.showCode)
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: MyButton(
                                  title:
                                      '${tr['sendNewToken']}${controller.timerCount <= 1 ? '' : ' - ${controller.timerCount}'}',
                                  colorTitle: controller.timerCount == 0
                                      ? colors.primary
                                      : colors.primary.withOpacity(0.3),
                                  cleanButton: true,
                                  loading: controller.isLoadingSendCode,
                                  loadingColor: colors.primary,
                                  onPress: controller.timerCount <= 1
                                      ? () => controller.resendCode(context)
                                      : null,
                                ),
                              )
                          ],
                        ),
                      ),
                    Observer(
                        builder: (_) => Padding(
                              padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).padding.bottom + 20,
                              ),
                              child: MyButton(
                                title: controller.showCode
                                    ? tr['buttonCheckToken']
                                    : tr['buttonNext'],
                                colorTitle: colors.background,
                                // colorButton: colors.primary,
                                colorButton: colors.primary,
                                iconRight: controller.showCode ? false : true,
                                loading: controller.isLoading,
                                onPress: controller.enableButton
                                    ? () => controller.onPress(context)
                                    : null,
                              ),
                            )),
                  ],
                )),
        dismissible: false,
        hasHeight: false,
        context: context, onClose: () {
      controller.cleanLogin(context);
    });
  }

  Widget pinCodeInput(BuildContext context) {
    dynamic tr = local.tr['login']['bottomSheet'];
    return VisualDisplay.textField(
      controller: controller.controllerCode,
      labelText: tr['tokenHint'],
      fillColor: Colors.white,
      colorBorder: Colors.white,
      colorCursor: colors.secondary,
      errorText: controller.errorCode,
      colorBorderFocus: colors.secondary.withOpacity(0.7),
      colorLabel: colors.textSecondary,
      colorLabelFocus: colors.textSecondary,
      textAlign: TextAlign.start,
      textInputType: TextInputType.number,
      fontWeight: FontWeight.w700,
      onChanged: (value) => controller.setToken(value, context),
      maxLines: 1,
      contentPadding: const EdgeInsets.all(20).copyWith(left: 20),
      letterSpacing: width * 0.12,
      inputMask: [
        TextInputMask(mask: ['99999']),
      ],
      onEditingComplete: () {
        if (controller.enableButton) {
          controller.onPress(context);
        }
      },
      validator: (txt) {
        if (txt != null) {
          if (txt.isEmpty) {
            return tr['errorToken'];
          }
        }
        return null;
      },
    );
  }
}
