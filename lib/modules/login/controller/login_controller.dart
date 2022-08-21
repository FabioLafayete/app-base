import 'package:app/util/util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/bottom_sheet/botto_sheet_view_model.dart';

class LoginController extends GetxController {


  final RxString _email = RxString('');
  final Rxn<String> _errorEmail = Rxn<String>();
  final Rxn<String> _errorCode = Rxn<String>();
  final RxBool _isLoading = RxBool(false);
  final RxBool _isLoadingSendCode = RxBool(false);

  final RxBool _showCode = RxBool(false);
  bool get isLoading => _isLoading.value;
  bool get isLoadingSendCode => _isLoadingSendCode.value;
  final Rx<String> _code1 = Rx('');
  final Rx<String> _code2 = Rx('');
  final Rx<String> _code3 = Rx('');
  final Rx<String> _code4 = Rx('');
  final Rx<String> _code5 = Rx('');

  final bottomSheet = Get.find<BottomSheetViewModel>();

  String get email => _email.value;
  String? get errorEmail => _errorEmail.value;
  String? get errorCode => _errorCode.value;
  bool get showCode => _showCode.value;
  bool isEmail(String email) => Util.isEmail(email);

  String get code1 => _code1.value;
  String get code2 => _code2.value;
  String get code3 => _code3.value;
  String get code4 => _code4.value;
  String get code5 => _code5.value;

  setIsLoading(bool value) => _isLoading.value = value;
  setIsLoadingSendCode(bool value) => _isLoadingSendCode.value = value;
  setEmail(String value) => _email.value = value;
  setErrorEmail(String? value) => _errorEmail.value = value;
  setErrorCode(String? value) => _errorCode.value = value;
  setShowCode(bool value) => _showCode.value = value;

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
      Get.focusScope?.unfocus();
      callLogin();
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


  Future<void> onPress({bool isCodeValidate = false}) async {
    try{
      setIsLoading(true);
      await Future.delayed(const Duration(seconds: 1));
      if(isCodeValidate){
        bottomSheet.setHeightBottomSheet(0.56);
        await Future.delayed(const Duration(milliseconds: 300));
        setErrorCode('');
        cleanCode();
        Get.focusScope?.unfocus();
      } else {
        bottomSheet.setHeightBottomSheet(0.53);
        await Future.delayed(const Duration(milliseconds: 300));
        setShowCode(true);
        Get.focusScope?.unfocus();
      }
    } finally{
      setIsLoading(false);
    }
  }

  Future<void> resendCode() async {
    try{
      setIsLoadingSendCode(true);
      Get.focusScope?.unfocus();
      await Future.delayed(const Duration(seconds: 1));
      cleanCode();
      setErrorCode(null);
      bottomSheet.setHeightBottomSheet(0.53);
    } finally{
      setIsLoadingSendCode(false);
    }
  }

  Future<void> changeEmail() async {
    Get.focusScope?.unfocus();
    setShowCode(false);
    cleanCode();
    bottomSheet.setHeightBottomSheet(0.35);
    setErrorEmail(null);
    setErrorCode(null);
  }

  bool enableButton({bool isCodeValidate = false}) {
    if(isCodeValidate){
      if(code1.isNotEmpty &&
          code2.isNotEmpty &&
          code3.isNotEmpty &&
          code4.isNotEmpty &&
          code5.isNotEmpty) {
        return true;
      }
    } else {
      if(email.isNotEmpty) if(isEmail(email)) return true;
    }
    return false;
  }

  cleanCode(){
    controllerCode1.clear();
    controllerCode2.clear();
    controllerCode3.clear();
    controllerCode4.clear();
    controllerCode5.clear();
    _code1.value = '';
    _code2.value = '';
    _code3.value = '';
    _code4.value = '';
    _code5.value = '';
  }

  callLogin(){
    if(code1.isNotEmpty &&
        code2.isNotEmpty &&
        code3.isNotEmpty &&
        code4.isNotEmpty &&
        code5.isNotEmpty) {
      onPress(isCodeValidate: true);
    }
  }

  @override
  void onInit() {
    super.onInit();
    bottomSheet.setHeightBottomSheet(0.35);
  }


  void cleanLogin(){
    setEmail('');
    cleanCode();
    controllerEmail.clear();
    Get.focusScope?.unfocus();
    setShowCode(false);
    bottomSheet.setHeightBottomSheet(0.35);
    setErrorEmail(null);
    setErrorCode(null);
  }

}