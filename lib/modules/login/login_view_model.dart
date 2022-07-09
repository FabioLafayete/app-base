import 'package:app/modules/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/base_view_model.dart';

class LoginViewModel extends BaseViewModel<LoginController> {


  final Rx<String> _email = Rx('');

  final Rx<String> _code1 = Rx('');
  final Rx<String> _code2 = Rx('');
  final Rx<String> _code3 = Rx('');
  final Rx<String> _code4 = Rx('');
  final Rx<String> _code5 = Rx('');

  String get email => _email.value;
  String get code1 => _code1.value;
  String get code2 => _code2.value;
  String get code3 => _code3.value;
  String get code4 => _code4.value;
  String get code5 => _code5.value;

  setEmail(String value) => _email.value = value;

  void setCode1(String value) {
    _code1.value = value;
    if (value.isNotEmpty) codePart2FocusNode.requestFocus();
  }

  void setCode2(String value) {
    _code2.value = value;
    if (value.isNotEmpty) {
      codePart3FocusNode.requestFocus();
    } else {
      codePart1FocusNode.requestFocus();
    }
  }

  void setCode3(String value) {
    _code3.value = value;
    if (value.isNotEmpty) {
      codePart4FocusNode.nextFocus();
    } else {
      codePart2FocusNode.requestFocus();
    }
  }

  void setCode4(String value) {
    _code4.value = value;
    if (value.isNotEmpty) {
      codePart5FocusNode.nextFocus();
    } else {
      codePart3FocusNode.requestFocus();
    }
  }

  void setCode5(String value) {
    _code5.value = value;
    if (value.isNotEmpty) {
      codePart5FocusNode.nextFocus();
    } else {
      codePart4FocusNode.requestFocus();
    }
  }



  final FocusNode codePart1FocusNode = FocusNode();
  final FocusNode codePart2FocusNode = FocusNode();
  final FocusNode codePart3FocusNode = FocusNode();
  final FocusNode codePart4FocusNode = FocusNode();
  final FocusNode codePart5FocusNode = FocusNode();

  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerCode1 = TextEditingController();
  TextEditingController controllerCode2 = TextEditingController();
  TextEditingController controllerCode3 = TextEditingController();
  TextEditingController controllerCode4 = TextEditingController();
  TextEditingController controllerCode5 = TextEditingController();


  void cleanLogin(){
    setEmail('');
    setCode1('');
    setCode2('');
    setCode3('');
    setCode4('');
    setCode5('');
    controllerCode1.clear();
    controllerCode2.clear();
    controllerCode3.clear();
    controllerCode4.clear();
    controllerCode5.clear();
    controllerEmail.clear();
    Get.focusScope?.unfocus();
  }

}