import 'package:app/config/app_config.dart';
import 'package:app/modules/login/repository/impl/login_repository_impl.dart';
import 'package:app/route/pages_name.dart';
import 'package:app/shared/model/auth_model/auth_model.dart';
import 'package:app/util/util.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:app/shared/widgets/base_controller.dart';
import '../../navigator/controller/nav_controller.dart';

part 'login_controller.g.dart';

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase extends BaseController with Store {

  LoginControllerBase({
    required this.repositoryImpl
  }) : super(){
    // setShowCode(true);
  }

  final LoginRepositoryImpl repositoryImpl;

  @observable
  bool isLoading = false;
  @observable
  bool isLoadingSendCode = false;
  @observable
  String? email;
  @observable
  String? token;
  @observable
  String? errorEmail;
  @observable
  String? errorCode;
  @observable
  bool showCode = false;
  @observable
  bool showPassword = false;
  @observable
  bool obscureText = true;
  @observable
  bool forceSendCode = false;
  @observable
  String? password;

  final bottomSheet = Modular.get<NavController>();

  @action
  setForceSendCode(bool value) => forceSendCode = value;
  @action
  setToken(String? value, BuildContext context) {
    token = value;
    if(value?.length == 5){
      onPress(context);
    }
  }
  @action
  setPassword(String? value) => password = value;
  @action
  setObscureText(bool value) => obscureText = value;
  @action
  setShowPassword(bool value) => showPassword = value;
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

  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerCode = TextEditingController();

  Future<void> onPress(BuildContext context) async {
    try{
      setIsLoading(true);
      if(showCode) {
        AuthModel data = await repositoryImpl.postLogin(
          email!,
          token: token,
        );
        await AppConfig().setBearerToken(data);
        if(data.user.newUser) {
          router.pushReplacementNamed(PagesNames.onboard);
        } else {
          router.pushReplacementNamed(PagesNames.home);
        }
        return;
      } else if (showPassword){
        AuthModel data = await repositoryImpl.postLogin(email!, password: password);
        await AppConfig().setBearerToken(data);
        if(data.user.newUser) {
          router.pushReplacementNamed(PagesNames.onboard);
        } else {
          router.pushReplacementNamed(PagesNames.home);
        }
        return;
      }else {
        final response = await repositoryImpl.postTokenEmail(email!);
        await Future.delayed(const Duration(milliseconds: 350));
        if(response.hasPassword){
          setShowPassword(true);
        } else {
          setShowCode(true);
        }
        FocusScope.of(context).unfocus();
      }
    } catch(e) {
      if(showCode) {
        setErrorCode('Código informado inválido');
        cleanCode();
        FocusScope.of(context).unfocus();
      } else {
        setErrorEmail('Erro interno, favor tentar novamente');
      }
      if (kDebugMode) {
        print(e);
      }
    } finally{
      setIsLoading(false);
    }
  }

  Future<void> resendCode(BuildContext context) async {
    try{
      setIsLoadingSendCode(true);
      FocusScope.of(context).unfocus();
      await repositoryImpl.postTokenEmail(
          email!,
          forceSendCode: forceSendCode,
      );
      cleanCode();
      setErrorCode(null);
      setErrorEmail(null);
      setShowPassword(false);
      setShowCode(true);
    } finally{
      setIsLoadingSendCode(false);
    }
  }

  bool isDigit(){

    return true;
  }

  Future<void> changeEmail(BuildContext context) async {
    FocusScope.of(context).unfocus();
    setShowCode(false);
    cleanCode();
    setErrorEmail(null);
    setErrorCode(null);
  }

  @computed
  bool get enableButton {
    if(showCode){
      if(token?.length == 5) {
        return true;
      }
    } else if (showPassword) {
      if(email != null && email!.isNotEmpty && Util.isEmail(email!)) {
        if(password != null && password!.length > 2 ){
          return true;
        }
      }
    }else {
      if(email != null && email!.isNotEmpty && Util.isEmail(email!)) return true;
    }
    return false;
  }

  cleanCode(){
    controllerCode.clear();
    token = null;
  }

  void cleanLogin(BuildContext context){
    setEmail('');
    cleanCode();
    controllerEmail.clear();
    FocusScope.of(context).unfocus();
    setShowCode(false);
    setErrorEmail(null);
    setErrorCode(null);
  }
}