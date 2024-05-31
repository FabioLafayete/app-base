import 'package:app/config/app_config.dart';
import 'package:app/modules/login/repository/impl/login_repository_impl.dart';
import 'package:app/route/pages_name.dart';
import 'package:app/shared/model/auth_model/auth_model.dart';
import 'package:app/util/util.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:app/shared/widgets/base_controller.dart';
import '../../navigator/controller/nav_controller.dart';

part 'login_controller.g.dart';

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase extends BaseController with Store {

  LoginControllerBase({
    required this.repositoryImpl
  });

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
  bool errorCode = false;
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
  setForceSendCode(bool value) => forceSendCode = value;
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
  setErrorCode(bool value) => errorCode = value;
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
    }
  }
  @action
  void setCode3(String value) {
    code3 = value;
    if (value.isNotEmpty) {
      codePart4FocusNode.nextFocus();
    }
  }
  @action
  void setCode4(String value) {
    code4 = value;
    if (value.isNotEmpty) {
      codePart5FocusNode.nextFocus();
    }
  }
  @action
  void setCode5(String value, BuildContext context) {
    code5 = value;
    if (value.isNotEmpty) {
      FocusScope.of(context).unfocus();
      callLogin(context);
    } else {
      // codePart4FocusNode.requestFocus();
    }
  }

  late final FocusNode codePart1FocusNode = FocusNode(
    onKeyEvent: (node, event){
      if(node.hasFocus){
        if(event is KeyUpEvent) {
          if(int.tryParse(event.character ?? '') != null && code1.isNotEmpty){
            code1 = event.character!;
            controllerCode1.text = event.character!;
            node.nextFocus();
          }
        }
      }
      return KeyEventResult.ignored;
    }
  );
  late final FocusNode codePart2FocusNode = FocusNode(
    onKeyEvent: (node, event){
      if(node.hasFocus){
        if(event is KeyUpEvent) {
          if (event.logicalKey == LogicalKeyboardKey.backspace) {
            if(code2.isEmpty){
              node.previousFocus();
            }
          } else if(int.tryParse(event.character ?? '') != null && code2.isNotEmpty){
            code2 = event.character!;
            controllerCode2.text = event.character!;
            node.nextFocus();
          }
        }
      }
      return KeyEventResult.ignored;
    },
  );
  late final FocusNode codePart3FocusNode = FocusNode(
    onKeyEvent: (node, event){
      if(node.hasFocus){
        if(event is KeyUpEvent) {
          if (event.logicalKey == LogicalKeyboardKey.backspace) {
            if(code3.isEmpty){
              node.previousFocus();
            }
          } else if(int.tryParse(event.character ?? '') != null && code3.isNotEmpty){
            code3 = event.character!;
            controllerCode3.text = event.character!;
            node.nextFocus();
          }
        }
      }
      return KeyEventResult.ignored;
    },
  );
  late final FocusNode codePart4FocusNode = FocusNode(
    onKeyEvent: (node, event){
      if(node.hasFocus){
        if(event is KeyUpEvent) {
          if (event.logicalKey == LogicalKeyboardKey.backspace) {
            if(code4.isEmpty){
              node.previousFocus();
            }
          } else if(int.tryParse(event.character ?? '') != null && code4.isNotEmpty){
            code4 = event.character!;
            controllerCode4.text = event.character!;
            node.nextFocus();
          }
        }
      }
      return KeyEventResult.ignored;
    },
  );
  late final FocusNode codePart5FocusNode = FocusNode(
    onKeyEvent: (node, event){
      if(node.hasFocus){
        if(event is KeyUpEvent) {
          if (event.logicalKey == LogicalKeyboardKey.backspace) {
            if(code5.isEmpty){
              node.previousFocus();
            }
          } else if(int.tryParse(event.character ?? '') != null && code5.isNotEmpty){
            code5 = event.character!;
            controllerCode3.text = event.character!;
          }
        }
      }
      return KeyEventResult.ignored;
    },
  );

  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerCode1 = TextEditingController();
  TextEditingController controllerCode2 = TextEditingController();
  TextEditingController controllerCode3 = TextEditingController();
  TextEditingController controllerCode4 = TextEditingController();
  TextEditingController controllerCode5 = TextEditingController();

  Future<void> onPress(BuildContext context) async {
    try{
      setIsLoading(true);
      if(showCode) {
        AuthModel data = await repositoryImpl.postLogin(email!, token: fullCode);
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
        setErrorCode(true);
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

  String get fullCode => '$code1$code2$code3$code4$code5';

  Future<void> resendCode(BuildContext context) async {
    try{
      setIsLoadingSendCode(true);
      FocusScope.of(context).unfocus();
      await repositoryImpl.postTokenEmail(
          email!,
          forceSendCode: forceSendCode,
      );
      cleanCode();
      setErrorCode(false);
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
    setErrorCode(false);
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

  callLogin(BuildContext context){
    if(code1.isNotEmpty &&
        code2.isNotEmpty &&
        code3.isNotEmpty &&
        code4.isNotEmpty &&
        code5.isNotEmpty) {
      onPress(context);
    }
  }

  void cleanLogin(BuildContext context){
    setEmail('');
    cleanCode();
    controllerEmail.clear();
    FocusScope.of(context).unfocus();
    setShowCode(false);
    setErrorEmail(null);
    setErrorCode(false);
  }
}