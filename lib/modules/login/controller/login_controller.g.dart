// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginController on LoginControllerBase, Store {
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: 'LoginControllerBase.isLoading'))
          .value;
  Computed<bool>? _$isLoadingSendCodeComputed;

  @override
  bool get isLoadingSendCode => (_$isLoadingSendCodeComputed ??= Computed<bool>(
          () => super.isLoadingSendCode,
          name: 'LoginControllerBase.isLoadingSendCode'))
      .value;
  Computed<String>? _$emailComputed;

  @override
  String get email => (_$emailComputed ??= Computed<String>(() => super.email,
          name: 'LoginControllerBase.email'))
      .value;
  Computed<String?>? _$errorEmailComputed;

  @override
  String? get errorEmail =>
      (_$errorEmailComputed ??= Computed<String?>(() => super.errorEmail,
              name: 'LoginControllerBase.errorEmail'))
          .value;
  Computed<String?>? _$errorCodeComputed;

  @override
  String? get errorCode =>
      (_$errorCodeComputed ??= Computed<String?>(() => super.errorCode,
              name: 'LoginControllerBase.errorCode'))
          .value;
  Computed<bool>? _$showCodeComputed;

  @override
  bool get showCode =>
      (_$showCodeComputed ??= Computed<bool>(() => super.showCode,
              name: 'LoginControllerBase.showCode'))
          .value;
  Computed<String>? _$code1Computed;

  @override
  String get code1 => (_$code1Computed ??= Computed<String>(() => super.code1,
          name: 'LoginControllerBase.code1'))
      .value;
  Computed<String>? _$code2Computed;

  @override
  String get code2 => (_$code2Computed ??= Computed<String>(() => super.code2,
          name: 'LoginControllerBase.code2'))
      .value;
  Computed<String>? _$code3Computed;

  @override
  String get code3 => (_$code3Computed ??= Computed<String>(() => super.code3,
          name: 'LoginControllerBase.code3'))
      .value;
  Computed<String>? _$code4Computed;

  @override
  String get code4 => (_$code4Computed ??= Computed<String>(() => super.code4,
          name: 'LoginControllerBase.code4'))
      .value;
  Computed<String>? _$code5Computed;

  @override
  String get code5 => (_$code5Computed ??= Computed<String>(() => super.code5,
          name: 'LoginControllerBase.code5'))
      .value;

  late final _$_emailAtom =
      Atom(name: 'LoginControllerBase._email', context: context);

  @override
  Rx<String> get _email {
    _$_emailAtom.reportRead();
    return super._email;
  }

  @override
  set _email(Rx<String> value) {
    _$_emailAtom.reportWrite(value, super._email, () {
      super._email = value;
    });
  }

  late final _$_errorEmailAtom =
      Atom(name: 'LoginControllerBase._errorEmail', context: context);

  @override
  Rxn<String> get _errorEmail {
    _$_errorEmailAtom.reportRead();
    return super._errorEmail;
  }

  @override
  set _errorEmail(Rxn<String> value) {
    _$_errorEmailAtom.reportWrite(value, super._errorEmail, () {
      super._errorEmail = value;
    });
  }

  late final _$_errorCodeAtom =
      Atom(name: 'LoginControllerBase._errorCode', context: context);

  @override
  Rxn<String> get _errorCode {
    _$_errorCodeAtom.reportRead();
    return super._errorCode;
  }

  @override
  set _errorCode(Rxn<String> value) {
    _$_errorCodeAtom.reportWrite(value, super._errorCode, () {
      super._errorCode = value;
    });
  }

  late final _$_isLoadingAtom =
      Atom(name: 'LoginControllerBase._isLoading', context: context);

  @override
  RxBool get _isLoading {
    _$_isLoadingAtom.reportRead();
    return super._isLoading;
  }

  @override
  set _isLoading(RxBool value) {
    _$_isLoadingAtom.reportWrite(value, super._isLoading, () {
      super._isLoading = value;
    });
  }

  late final _$_isLoadingSendCodeAtom =
      Atom(name: 'LoginControllerBase._isLoadingSendCode', context: context);

  @override
  RxBool get _isLoadingSendCode {
    _$_isLoadingSendCodeAtom.reportRead();
    return super._isLoadingSendCode;
  }

  @override
  set _isLoadingSendCode(RxBool value) {
    _$_isLoadingSendCodeAtom.reportWrite(value, super._isLoadingSendCode, () {
      super._isLoadingSendCode = value;
    });
  }

  late final _$_showCodeAtom =
      Atom(name: 'LoginControllerBase._showCode', context: context);

  @override
  RxBool get _showCode {
    _$_showCodeAtom.reportRead();
    return super._showCode;
  }

  @override
  set _showCode(RxBool value) {
    _$_showCodeAtom.reportWrite(value, super._showCode, () {
      super._showCode = value;
    });
  }

  late final _$_code1Atom =
      Atom(name: 'LoginControllerBase._code1', context: context);

  @override
  Rx<String> get _code1 {
    _$_code1Atom.reportRead();
    return super._code1;
  }

  @override
  set _code1(Rx<String> value) {
    _$_code1Atom.reportWrite(value, super._code1, () {
      super._code1 = value;
    });
  }

  late final _$_code2Atom =
      Atom(name: 'LoginControllerBase._code2', context: context);

  @override
  Rx<String> get _code2 {
    _$_code2Atom.reportRead();
    return super._code2;
  }

  @override
  set _code2(Rx<String> value) {
    _$_code2Atom.reportWrite(value, super._code2, () {
      super._code2 = value;
    });
  }

  late final _$_code3Atom =
      Atom(name: 'LoginControllerBase._code3', context: context);

  @override
  Rx<String> get _code3 {
    _$_code3Atom.reportRead();
    return super._code3;
  }

  @override
  set _code3(Rx<String> value) {
    _$_code3Atom.reportWrite(value, super._code3, () {
      super._code3 = value;
    });
  }

  late final _$_code4Atom =
      Atom(name: 'LoginControllerBase._code4', context: context);

  @override
  Rx<String> get _code4 {
    _$_code4Atom.reportRead();
    return super._code4;
  }

  @override
  set _code4(Rx<String> value) {
    _$_code4Atom.reportWrite(value, super._code4, () {
      super._code4 = value;
    });
  }

  late final _$_code5Atom =
      Atom(name: 'LoginControllerBase._code5', context: context);

  @override
  Rx<String> get _code5 {
    _$_code5Atom.reportRead();
    return super._code5;
  }

  @override
  set _code5(Rx<String> value) {
    _$_code5Atom.reportWrite(value, super._code5, () {
      super._code5 = value;
    });
  }

  late final _$LoginControllerBaseActionController =
      ActionController(name: 'LoginControllerBase', context: context);

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
  dynamic setErrorCode(String? value) {
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
  void setCode5(String value) {
    final _$actionInfo = _$LoginControllerBaseActionController.startAction(
        name: 'LoginControllerBase.setCode5');
    try {
      return super.setCode5(value);
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
code1: ${code1},
code2: ${code2},
code3: ${code3},
code4: ${code4},
code5: ${code5}
    ''';
  }
}
