import 'package:app/config/app_config.dart';
import 'package:app/modules/login/repository/impl/login_repository_impl.dart';
import 'package:app/route/pages_name.dart';
import 'package:app/util/util.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';

import '../../../components/bottom_sheet/bottom_sheet_controller.dart';

part 'login_controller.g.dart';

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase with Store {

  LoginControllerBase({
    required this.repositoryImpl
  }) : super(){
    // bottomSheet.setHeightBottomSheet(0.35);
  }

  final LoginRepositoryImpl repositoryImpl;

  @observable
  Rx<String> _email = Rx('');
  @observable
  Rxn<String> _errorEmail = Rxn<String>();
  @observable
  Rxn<String> _errorCode = Rxn<String>();
  @observable
  RxBool _isLoading = RxBool(false);
  @observable
  RxBool _isLoadingSendCode = RxBool(false);
  @observable
  RxBool _showCode = RxBool(false);
  @observable
  Rx<String> _code1 = Rx('');
  @observable
  Rx<String> _code2 = Rx('');
  @observable
  Rx<String> _code3 = Rx('');
  @observable
  Rx<String> _code4 = Rx('');
  @observable
  Rx<String> _code5 = Rx('');

  @computed
  bool get isLoading => _isLoading.value;
  @computed
  bool get isLoadingSendCode => _isLoadingSendCode.value;
  @computed
  String get email => _email.value;
  @computed
  String? get errorEmail => _errorEmail.value;
  @computed
  String? get errorCode => _errorCode.value;
  @computed
  bool get showCode => _showCode.value;
  @computed
  String get code1 => _code1.value;
  @computed
  String get code2 => _code2.value;
  @computed
  String get code3 => _code3.value;
  @computed
  String get code4 => _code4.value;
  @computed
  String get code5 => _code5.value;

  final bottomSheet = Get.find<BottomSheetController>();
  bool isEmail(String email) => Util.isEmail(email);

  @action
  setIsLoading(bool value) => _isLoading.value = value;
  @action
  setIsLoadingSendCode(bool value) => _isLoadingSendCode.value = value;
  @action
  setEmail(String value) => _email.value = value;
  @action
  setErrorEmail(String? value) => _errorEmail.value = value;
  @action
  setErrorCode(String? value) => _errorCode.value = value;
  @action
  setShowCode(bool value) => _showCode.value = value;
  @action
  void setCode1(String value) {
    _code1.value = value;
    if (value.isNotEmpty) codePart2FocusNode.requestFocus();
  }
  @action
  void setCode2(String value) {
    _code2.value = value;
    if (value.isNotEmpty) {
      codePart3FocusNode.requestFocus();
    } else {
      codePart1FocusNode.requestFocus();
    }
  }
  @action
  void setCode3(String value) {
    _code3.value = value;
    if (value.isNotEmpty) {
      codePart4FocusNode.nextFocus();
    } else {
      codePart2FocusNode.requestFocus();
    }
  }
  @action
  void setCode4(String value) {
    _code4.value = value;
    if (value.isNotEmpty) {
      codePart5FocusNode.nextFocus();
    } else {
      codePart3FocusNode.requestFocus();
    }
  }
  @action
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

  Future<void> onPress() async {
    try{
      setIsLoading(true);
      if(showCode) {
        final data = await repositoryImpl.postLogin(
            email, '$code1$code2$code3$code4$code5'
        );
        if(data.isNotEmpty && data.containsKey('token')){
          AppConfig().setBearerToken(data['token']);

          Get.offAllNamed(PagesNames.onboard);
          return;
        }
      } else {
        await repositoryImpl.postTokenEmail(email);
        bottomSheet.setHeightBottomSheet(0.53);
        setShowCode(true);
        Get.focusScope?.unfocus();
      }
    } catch(e){
      bottomSheet.setHeightBottomSheet(0.56);
      setErrorCode('');
      cleanCode();
      Get.focusScope?.unfocus();
      if (kDebugMode) {
        print(e);
      }
    } finally{
      setIsLoading(false);
    }
  }

  Future<void> resendCode() async {
    try{
      setIsLoadingSendCode(true);
      Get.focusScope?.unfocus();
      await repositoryImpl.postTokenEmail(email);
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

  bool enableButton() {
    if(showCode){
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
      onPress();
    }
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