// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginController on LoginControllerBase, Store {
  Computed<bool>? _$enableButtonComputed;

  @override
  bool get enableButton =>
      (_$enableButtonComputed ??= Computed<bool>(() => super.enableButton,
              name: 'LoginControllerBase.enableButton'))
          .value;

  late final _$isLoadingAtom =
      Atom(name: 'LoginControllerBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$isLoadingSendCodeAtom =
      Atom(name: 'LoginControllerBase.isLoadingSendCode', context: context);

  @override
  bool get isLoadingSendCode {
    _$isLoadingSendCodeAtom.reportRead();
    return super.isLoadingSendCode;
  }

  @override
  set isLoadingSendCode(bool value) {
    _$isLoadingSendCodeAtom.reportWrite(value, super.isLoadingSendCode, () {
      super.isLoadingSendCode = value;
    });
  }

  late final _$emailAtom =
      Atom(name: 'LoginControllerBase.email', context: context);

  @override
  String? get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String? value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$errorEmailAtom =
      Atom(name: 'LoginControllerBase.errorEmail', context: context);

  @override
  String? get errorEmail {
    _$errorEmailAtom.reportRead();
    return super.errorEmail;
  }

  @override
  set errorEmail(String? value) {
    _$errorEmailAtom.reportWrite(value, super.errorEmail, () {
      super.errorEmail = value;
    });
  }

  late final _$errorCodeAtom =
      Atom(name: 'LoginControllerBase.errorCode', context: context);

  @override
  bool get errorCode {
    _$errorCodeAtom.reportRead();
    return super.errorCode;
  }

  @override
  set errorCode(bool value) {
    _$errorCodeAtom.reportWrite(value, super.errorCode, () {
      super.errorCode = value;
    });
  }

  late final _$showCodeAtom =
      Atom(name: 'LoginControllerBase.showCode', context: context);

  @override
  bool get showCode {
    _$showCodeAtom.reportRead();
    return super.showCode;
  }

  @override
  set showCode(bool value) {
    _$showCodeAtom.reportWrite(value, super.showCode, () {
      super.showCode = value;
    });
  }

  late final _$showPasswordAtom =
      Atom(name: 'LoginControllerBase.showPassword', context: context);

  @override
  bool get showPassword {
    _$showPasswordAtom.reportRead();
    return super.showPassword;
  }

  @override
  set showPassword(bool value) {
    _$showPasswordAtom.reportWrite(value, super.showPassword, () {
      super.showPassword = value;
    });
  }

  late final _$obscureTextAtom =
      Atom(name: 'LoginControllerBase.obscureText', context: context);

  @override
  bool get obscureText {
    _$obscureTextAtom.reportRead();
    return super.obscureText;
  }

  @override
  set obscureText(bool value) {
    _$obscureTextAtom.reportWrite(value, super.obscureText, () {
      super.obscureText = value;
    });
  }

  late final _$forceSendCodeAtom =
      Atom(name: 'LoginControllerBase.forceSendCode', context: context);

  @override
  bool get forceSendCode {
    _$forceSendCodeAtom.reportRead();
    return super.forceSendCode;
  }

  @override
  set forceSendCode(bool value) {
    _$forceSendCodeAtom.reportWrite(value, super.forceSendCode, () {
      super.forceSendCode = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: 'LoginControllerBase.password', context: context);

  @override
  String? get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String? value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$code1Atom =
      Atom(name: 'LoginControllerBase.code1', context: context);

  @override
  String get code1 {
    _$code1Atom.reportRead();
    return super.code1;
  }

  @override
  set code1(String value) {
    _$code1Atom.reportWrite(value, super.code1, () {
      super.code1 = value;
    });
  }

  late final _$code2Atom =
      Atom(name: 'LoginControllerBase.code2', context: context);

  @override
  String get code2 {
    _$code2Atom.reportRead();
    return super.code2;
  }

  @override
  set code2(String value) {
    _$code2Atom.reportWrite(value, super.code2, () {
      super.code2 = value;
    });
  }

  late final _$code3Atom =
      Atom(name: 'LoginControllerBase.code3', context: context);

  @override
  String get code3 {
    _$code3Atom.reportRead();
    return super.code3;
  }

  @override
  set code3(String value) {
    _$code3Atom.reportWrite(value, super.code3, () {
      super.code3 = value;
    });
  }

  late final _$code4Atom =
      Atom(name: 'LoginControllerBase.code4', context: context);

  @override
  String get code4 {
    _$code4Atom.reportRead();
    return super.code4;
  }

  @override
  set code4(String value) {
    _$code4Atom.reportWrite(value, super.code4, () {
      super.code4 = value;
    });
  }

  late final _$code5Atom =
      Atom(name: 'LoginControllerBase.code5', context: context);

  @override
  String get code5 {
    _$code5Atom.reportRead();
    return super.code5;
  }

  @override
  set code5(String value) {
    _$code5Atom.reportWrite(value, super.code5, () {
      super.code5 = value;
    });
  }

  late final _$LoginControllerBaseActionController =
      ActionController(name: 'LoginControllerBase', context: context);

  @override
  dynamic setForceSendCode(bool value) {
    final _$actionInfo = _$LoginControllerBaseActionController.startAction(
        name: 'LoginControllerBase.setForceSendCode');
    try {
      return super.setForceSendCode(value);
    } finally {
      _$LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPassword(String? value) {
    final _$actionInfo = _$LoginControllerBaseActionController.startAction(
        name: 'LoginControllerBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setObscureText(bool value) {
    final _$actionInfo = _$LoginControllerBaseActionController.startAction(
        name: 'LoginControllerBase.setObscureText');
    try {
      return super.setObscureText(value);
    } finally {
      _$LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setShowPassword(bool value) {
    final _$actionInfo = _$LoginControllerBaseActionController.startAction(
        name: 'LoginControllerBase.setShowPassword');
    try {
      return super.setShowPassword(value);
    } finally {
      _$LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setIsLoading(bool value) {
    final _$actionInfo = _$LoginControllerBaseActionController.startAction(
        name: 'LoginControllerBase.setIsLoading');
    try {
      return super.setIsLoading(value);
    } finally {
      _$LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setIsLoadingSendCode(bool value) {
    final _$actionInfo = _$LoginControllerBaseActionController.startAction(
        name: 'LoginControllerBase.setIsLoadingSendCode');
    try {
      return super.setIsLoadingSendCode(value);
    } finally {
      _$LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEmail(String value) {
    final _$actionInfo = _$LoginControllerBaseActionController.startAction(
        name: 'LoginControllerBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setErrorEmail(String? value) {
    final _$actionInfo = _$LoginControllerBaseActionController.startAction(
        name: 'LoginControllerBase.setErrorEmail');
    try {
      return super.setErrorEmail(value);
    } finally {
      _$LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setErrorCode(bool value) {
    final _$actionInfo = _$LoginControllerBaseActionController.startAction(
        name: 'LoginControllerBase.setErrorCode');
    try {
      return super.setErrorCode(value);
    } finally {
      _$LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setShowCode(bool value) {
    final _$actionInfo = _$LoginControllerBaseActionController.startAction(
        name: 'LoginControllerBase.setShowCode');
    try {
      return super.setShowCode(value);
    } finally {
      _$LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCode1(String value) {
    final _$actionInfo = _$LoginControllerBaseActionController.startAction(
        name: 'LoginControllerBase.setCode1');
    try {
      return super.setCode1(value);
    } finally {
      _$LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCode2(String value) {
    final _$actionInfo = _$LoginControllerBaseActionController.startAction(
        name: 'LoginControllerBase.setCode2');
    try {
      return super.setCode2(value);
    } finally {
      _$LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCode3(String value) {
    final _$actionInfo = _$LoginControllerBaseActionController.startAction(
        name: 'LoginControllerBase.setCode3');
    try {
      return super.setCode3(value);
    } finally {
      _$LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCode4(String value) {
    final _$actionInfo = _$LoginControllerBaseActionController.startAction(
        name: 'LoginControllerBase.setCode4');
    try {
      return super.setCode4(value);
    } finally {
      _$LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCode5(String value, BuildContext context) {
    final _$actionInfo = _$LoginControllerBaseActionController.startAction(
        name: 'LoginControllerBase.setCode5');
    try {
      return super.setCode5(value, context);
    } finally {
      _$LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isLoadingSendCode: ${isLoadingSendCode},
email: ${email},
errorEmail: ${errorEmail},
errorCode: ${errorCode},
showCode: ${showCode},
showPassword: ${showPassword},
obscureText: ${obscureText},
forceSendCode: ${forceSendCode},
password: ${password},
code1: ${code1},
code2: ${code2},
code3: ${code3},
code4: ${code4},
code5: ${code5},
enableButton: ${enableButton}
    ''';
  }
}
