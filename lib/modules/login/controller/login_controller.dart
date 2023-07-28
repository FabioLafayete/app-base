import 'package:app/config/app_config.dart';
import 'package:app/modules/login/repository/impl/login_repository_impl.dart';
import 'package:app/route/pages_name.dart';
import 'package:app/util/util.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';
import 'package:app/shared/widgets/base_controller.dart';
import '../../navigator/controller/nav_controller.dart';
import '../model/auth_model.dart';

part 'login_controller.g.dart';

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase extends BaseController with Store {

  LoginControllerBase({
    required this.repositoryImpl
  }) : super(){
    bottomSheet.setHeightBottomSheet(0.35);
  }

  final LoginRepositoryImpl repositoryImpl;

  @observable
  bool isLoading = false;
  @observable
  bool isLoadingSendCode = false;
  @observable
  String? email;
  @observable
  String? errorEmail;
  @observable
  String? errorCode;
  @observable
  bool showCode = false;
  @observable
  String code1 = '';
  @observable
  String code2 = '';
  @observable
  String code3 = '';
  @observable
  String code4 = '';
  @observable
  String code5 = '';

  final bottomSheet = Modular.get<NavController>();

  @action
  setIsLoading(bool value) => isLoading = value;
  @action
  setIsLoadingSendCode(bool value) => isLoadingSendCode = value;
  @action
  setEmail(String value) => email = value.toLowerCase().trim();
  @action
  setErrorEmail(String? value) => errorEmail = value;
  @action
  setErrorCode(String? value) => errorCode = value;
  @action
  setShowCode(bool value) => showCode = value;
  @action
  void setCode1(String value) {
    code1 = value;
    if (value.isNotEmpty) codePart2FocusNode.requestFocus();
  }
  @action
  void setCode2(String value) {
    code2 = value;
    if (value.isNotEmpty) {
      codePart3FocusNode.requestFocus();
    } else {
      codePart1FocusNode.requestFocus();
    }
  }
  @action
  void setCode3(String value) {
    code3 = value;
    if (value.isNotEmpty) {
      codePart4FocusNode.nextFocus();
    } else {
      codePart2FocusNode.requestFocus();
    }
  }
  @action
  void setCode4(String value) {
    code4 = value;
    if (value.isNotEmpty) {
      codePart5FocusNode.nextFocus();
    } else {
      codePart3FocusNode.requestFocus();
    }
  }
  @action
  void setCode5(String value) {
    code5 = value;
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
        AuthModel data = await repositoryImpl.postLogin(email!, fullCode);
        await AppConfig().setBearerToken(data);
        if(data.user.newUser) {
          router.pushReplacementNamed(PagesNames.onboard);
        } else {
          router.pushReplacementNamed(PagesNames.home);
        }
        return;
      } else {
        await repositoryImpl.postTokenEmail(email!);
        bottomSheet.setHeightBottomSheet(0.53);
        await Future.delayed(const Duration(milliseconds: 350));
        setShowCode(true);
        Get.focusScope?.unfocus();
      }
    } catch(e) {
      if(showCode) {
        bottomSheet.setHeightBottomSheet(0.56);
        setErrorCode('');
        cleanCode();
        Get.focusScope?.unfocus();
      } else {
        setErrorEmail('Erro ao enviar token, tente novamente');
      }
      if (kDebugMode) {
        print(e);
      }
    } finally{
      setIsLoading(false);
    }
  }

  String get fullCode => '$code1$code2$code3$code4$code5';

  Future<void> resendCode() async {
    try{
      setIsLoadingSendCode(true);
      Get.focusScope?.unfocus();
      await repositoryImpl.postTokenEmail(email!);
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

  @computed
  bool get enableButton {
    if(showCode){
      if(code1.isNotEmpty &&
          code2.isNotEmpty &&
          code3.isNotEmpty &&
          code4.isNotEmpty &&
          code5.isNotEmpty) {
        return true;
      }
    } else {
      if(email != null && email!.isNotEmpty && Util.isEmail(email!)) return true;
    }
    return false;
  }

  cleanCode(){
    controllerCode1.clear();
    controllerCode2.clear();
    controllerCode3.clear();
    controllerCode4.clear();
    controllerCode5.clear();
    code1 = '';
    code2 = '';
    code3 = '';
    code4 = '';
    code5 = '';
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