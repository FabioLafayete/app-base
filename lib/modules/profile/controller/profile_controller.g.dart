// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfileController on ProfileControllerBase, Store {
  Computed<bool>? _$enableButtonNameComputed;

  @override
  bool get enableButtonName => (_$enableButtonNameComputed ??= Computed<bool>(
          () => super.enableButtonName,
          name: 'ProfileControllerBase.enableButtonName'))
      .value;
  Computed<bool>? _$enableButtonEmailComputed;

  @override
  bool get enableButtonEmail => (_$enableButtonEmailComputed ??= Computed<bool>(
          () => super.enableButtonEmail,
          name: 'ProfileControllerBase.enableButtonEmail'))
      .value;
  Computed<bool>? _$enableButtonPhoneComputed;

  @override
  bool get enableButtonPhone => (_$enableButtonPhoneComputed ??= Computed<bool>(
          () => super.enableButtonPhone,
          name: 'ProfileControllerBase.enableButtonPhone'))
      .value;

  late final _$versionAtom =
      Atom(name: 'ProfileControllerBase.version', context: context);

  @override
  String? get version {
    _$versionAtom.reportRead();
    return super.version;
  }

  @override
  set version(String? value) {
    _$versionAtom.reportWrite(value, super.version, () {
      super.version = value;
    });
  }

  late final _$photoProfileAtom =
      Atom(name: 'ProfileControllerBase.photoProfile', context: context);

  @override
  File? get photoProfile {
    _$photoProfileAtom.reportRead();
    return super.photoProfile;
  }

  @override
  set photoProfile(File? value) {
    _$photoProfileAtom.reportWrite(value, super.photoProfile, () {
      super.photoProfile = value;
    });
  }

  late final _$loadingDeleteAtom =
      Atom(name: 'ProfileControllerBase.loadingDelete', context: context);

  @override
  bool get loadingDelete {
    _$loadingDeleteAtom.reportRead();
    return super.loadingDelete;
  }

  @override
  set loadingDelete(bool value) {
    _$loadingDeleteAtom.reportWrite(value, super.loadingDelete, () {
      super.loadingDelete = value;
    });
  }

  late final _$nameAtom =
      Atom(name: 'ProfileControllerBase.name', context: context);

  @override
  String? get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String? value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$emailAtom =
      Atom(name: 'ProfileControllerBase.email', context: context);

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

  late final _$phoneAtom =
      Atom(name: 'ProfileControllerBase.phone', context: context);

  @override
  String? get phone {
    _$phoneAtom.reportRead();
    return super.phone;
  }

  @override
  set phone(String? value) {
    _$phoneAtom.reportWrite(value, super.phone, () {
      super.phone = value;
    });
  }

  late final _$errorNameAtom =
      Atom(name: 'ProfileControllerBase.errorName', context: context);

  @override
  String? get errorName {
    _$errorNameAtom.reportRead();
    return super.errorName;
  }

  @override
  set errorName(String? value) {
    _$errorNameAtom.reportWrite(value, super.errorName, () {
      super.errorName = value;
    });
  }

  late final _$errorEmailAtom =
      Atom(name: 'ProfileControllerBase.errorEmail', context: context);

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

  late final _$errorPhoneAtom =
      Atom(name: 'ProfileControllerBase.errorPhone', context: context);

  @override
  String? get errorPhone {
    _$errorPhoneAtom.reportRead();
    return super.errorPhone;
  }

  @override
  set errorPhone(String? value) {
    _$errorPhoneAtom.reportWrite(value, super.errorPhone, () {
      super.errorPhone = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: 'ProfileControllerBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$successPageAtom =
      Atom(name: 'ProfileControllerBase.successPage', context: context);

  @override
  bool get successPage {
    _$successPageAtom.reportRead();
    return super.successPage;
  }

  @override
  set successPage(bool value) {
    _$successPageAtom.reportWrite(value, super.successPage, () {
      super.successPage = value;
    });
  }

  late final _$optionHelpAtom =
      Atom(name: 'ProfileControllerBase.optionHelp', context: context);

  @override
  String? get optionHelp {
    _$optionHelpAtom.reportRead();
    return super.optionHelp;
  }

  @override
  set optionHelp(String? value) {
    _$optionHelpAtom.reportWrite(value, super.optionHelp, () {
      super.optionHelp = value;
    });
  }

  late final _$titleHelpAtom =
      Atom(name: 'ProfileControllerBase.titleHelp', context: context);

  @override
  String? get titleHelp {
    _$titleHelpAtom.reportRead();
    return super.titleHelp;
  }

  @override
  set titleHelp(String? value) {
    _$titleHelpAtom.reportWrite(value, super.titleHelp, () {
      super.titleHelp = value;
    });
  }

  late final _$messageHelpAtom =
      Atom(name: 'ProfileControllerBase.messageHelp', context: context);

  @override
  String? get messageHelp {
    _$messageHelpAtom.reportRead();
    return super.messageHelp;
  }

  @override
  set messageHelp(String? value) {
    _$messageHelpAtom.reportWrite(value, super.messageHelp, () {
      super.messageHelp = value;
    });
  }

  late final _$ProfileControllerBaseActionController =
      ActionController(name: 'ProfileControllerBase', context: context);

  @override
  dynamic setLoadingDelete(bool value) {
    final _$actionInfo = _$ProfileControllerBaseActionController.startAction(
        name: 'ProfileControllerBase.setLoadingDelete');
    try {
      return super.setLoadingDelete(value);
    } finally {
      _$ProfileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSuccessPage(bool value) {
    final _$actionInfo = _$ProfileControllerBaseActionController.startAction(
        name: 'ProfileControllerBase.setSuccessPage');
    try {
      return super.setSuccessPage(value);
    } finally {
      _$ProfileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setOptionHelp(String? value) {
    final _$actionInfo = _$ProfileControllerBaseActionController.startAction(
        name: 'ProfileControllerBase.setOptionHelp');
    try {
      return super.setOptionHelp(value);
    } finally {
      _$ProfileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTitleHelp(String? value) {
    final _$actionInfo = _$ProfileControllerBaseActionController.startAction(
        name: 'ProfileControllerBase.setTitleHelp');
    try {
      return super.setTitleHelp(value);
    } finally {
      _$ProfileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setMessageHelp(String? value) {
    final _$actionInfo = _$ProfileControllerBaseActionController.startAction(
        name: 'ProfileControllerBase.setMessageHelp');
    try {
      return super.setMessageHelp(value);
    } finally {
      _$ProfileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setName(String? value) {
    final _$actionInfo = _$ProfileControllerBaseActionController.startAction(
        name: 'ProfileControllerBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$ProfileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEmail(String? value) {
    final _$actionInfo = _$ProfileControllerBaseActionController.startAction(
        name: 'ProfileControllerBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$ProfileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPhone(String? value) {
    final _$actionInfo = _$ProfileControllerBaseActionController.startAction(
        name: 'ProfileControllerBase.setPhone');
    try {
      return super.setPhone(value);
    } finally {
      _$ProfileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setErrorName(String? value) {
    final _$actionInfo = _$ProfileControllerBaseActionController.startAction(
        name: 'ProfileControllerBase.setErrorName');
    try {
      return super.setErrorName(value);
    } finally {
      _$ProfileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setErrorPhone(String? value) {
    final _$actionInfo = _$ProfileControllerBaseActionController.startAction(
        name: 'ProfileControllerBase.setErrorPhone');
    try {
      return super.setErrorPhone(value);
    } finally {
      _$ProfileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setVersion(String value) {
    final _$actionInfo = _$ProfileControllerBaseActionController.startAction(
        name: 'ProfileControllerBase.setVersion');
    try {
      return super.setVersion(value);
    } finally {
      _$ProfileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPhotoProfile(File? value) {
    final _$actionInfo = _$ProfileControllerBaseActionController.startAction(
        name: 'ProfileControllerBase.setPhotoProfile');
    try {
      return super.setPhotoProfile(value);
    } finally {
      _$ProfileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLoading(bool value) {
    final _$actionInfo = _$ProfileControllerBaseActionController.startAction(
        name: 'ProfileControllerBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$ProfileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
version: ${version},
photoProfile: ${photoProfile},
loadingDelete: ${loadingDelete},
name: ${name},
email: ${email},
phone: ${phone},
errorName: ${errorName},
errorEmail: ${errorEmail},
errorPhone: ${errorPhone},
loading: ${loading},
successPage: ${successPage},
optionHelp: ${optionHelp},
titleHelp: ${titleHelp},
messageHelp: ${messageHelp},
enableButtonName: ${enableButtonName},
enableButtonEmail: ${enableButtonEmail},
enableButtonPhone: ${enableButtonPhone}
    ''';
  }
}
