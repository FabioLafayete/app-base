// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboard_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OnboardController on OnboardControllerBase, Store {
  Computed<bool>? _$enableButtonComputed;

  @override
  bool get enableButton =>
      (_$enableButtonComputed ??= Computed<bool>(() => super.enableButton,
              name: 'OnboardControllerBase.enableButton'))
          .value;

  late final _$indexAtom =
      Atom(name: 'OnboardControllerBase.index', context: context);

  @override
  int get index {
    _$indexAtom.reportRead();
    return super.index;
  }

  @override
  set index(int value) {
    _$indexAtom.reportWrite(value, super.index, () {
      super.index = value;
    });
  }

  late final _$nameAtom =
      Atom(name: 'OnboardControllerBase.name', context: context);

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

  late final _$genderAtom =
      Atom(name: 'OnboardControllerBase.gender', context: context);

  @override
  String? get gender {
    _$genderAtom.reportRead();
    return super.gender;
  }

  @override
  set gender(String? value) {
    _$genderAtom.reportWrite(value, super.gender, () {
      super.gender = value;
    });
  }

  late final _$targetAtom =
      Atom(name: 'OnboardControllerBase.target', context: context);

  @override
  String? get target {
    _$targetAtom.reportRead();
    return super.target;
  }

  @override
  set target(String? value) {
    _$targetAtom.reportWrite(value, super.target, () {
      super.target = value;
    });
  }

  late final _$birthdayAtom =
      Atom(name: 'OnboardControllerBase.birthday', context: context);

  @override
  DateTime? get birthday {
    _$birthdayAtom.reportRead();
    return super.birthday;
  }

  @override
  set birthday(DateTime? value) {
    _$birthdayAtom.reportWrite(value, super.birthday, () {
      super.birthday = value;
    });
  }

  late final _$limitationAtom =
      Atom(name: 'OnboardControllerBase.limitation', context: context);

  @override
  String? get limitation {
    _$limitationAtom.reportRead();
    return super.limitation;
  }

  @override
  set limitation(String? value) {
    _$limitationAtom.reportWrite(value, super.limitation, () {
      super.limitation = value;
    });
  }

  late final _$personalHeightAtom =
      Atom(name: 'OnboardControllerBase.personalHeight', context: context);

  @override
  int? get personalHeight {
    _$personalHeightAtom.reportRead();
    return super.personalHeight;
  }

  @override
  set personalHeight(int? value) {
    _$personalHeightAtom.reportWrite(value, super.personalHeight, () {
      super.personalHeight = value;
    });
  }

  late final _$personalWeightAtom =
      Atom(name: 'OnboardControllerBase.personalWeight', context: context);

  @override
  int? get personalWeight {
    _$personalWeightAtom.reportRead();
    return super.personalWeight;
  }

  @override
  set personalWeight(int? value) {
    _$personalWeightAtom.reportWrite(value, super.personalWeight, () {
      super.personalWeight = value;
    });
  }

  late final _$targetWeightAtom =
      Atom(name: 'OnboardControllerBase.targetWeight', context: context);

  @override
  int? get targetWeight {
    _$targetWeightAtom.reportRead();
    return super.targetWeight;
  }

  @override
  set targetWeight(int? value) {
    _$targetWeightAtom.reportWrite(value, super.targetWeight, () {
      super.targetWeight = value;
    });
  }

  late final _$OnboardControllerBaseActionController =
      ActionController(name: 'OnboardControllerBase', context: context);

  @override
  dynamic setName(String? value) {
    final _$actionInfo = _$OnboardControllerBaseActionController.startAction(
        name: 'OnboardControllerBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$OnboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setGender(String? value) {
    final _$actionInfo = _$OnboardControllerBaseActionController.startAction(
        name: 'OnboardControllerBase.setGender');
    try {
      return super.setGender(value);
    } finally {
      _$OnboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTarget(String? value) {
    final _$actionInfo = _$OnboardControllerBaseActionController.startAction(
        name: 'OnboardControllerBase.setTarget');
    try {
      return super.setTarget(value);
    } finally {
      _$OnboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setBirthday(DateTime? value) {
    final _$actionInfo = _$OnboardControllerBaseActionController.startAction(
        name: 'OnboardControllerBase.setBirthday');
    try {
      return super.setBirthday(value);
    } finally {
      _$OnboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLimitation(String? value) {
    final _$actionInfo = _$OnboardControllerBaseActionController.startAction(
        name: 'OnboardControllerBase.setLimitation');
    try {
      return super.setLimitation(value);
    } finally {
      _$OnboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPersonalHeight(int? value) {
    final _$actionInfo = _$OnboardControllerBaseActionController.startAction(
        name: 'OnboardControllerBase.setPersonalHeight');
    try {
      return super.setPersonalHeight(value);
    } finally {
      _$OnboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPersonalWeight(int? value) {
    final _$actionInfo = _$OnboardControllerBaseActionController.startAction(
        name: 'OnboardControllerBase.setPersonalWeight');
    try {
      return super.setPersonalWeight(value);
    } finally {
      _$OnboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTargetWeight(int? value) {
    final _$actionInfo = _$OnboardControllerBaseActionController.startAction(
        name: 'OnboardControllerBase.setTargetWeight');
    try {
      return super.setTargetWeight(value);
    } finally {
      _$OnboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setIndex(int value) {
    final _$actionInfo = _$OnboardControllerBaseActionController.startAction(
        name: 'OnboardControllerBase.setIndex');
    try {
      return super.setIndex(value);
    } finally {
      _$OnboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
index: ${index},
name: ${name},
gender: ${gender},
target: ${target},
birthday: ${birthday},
limitation: ${limitation},
personalHeight: ${personalHeight},
personalWeight: ${personalWeight},
targetWeight: ${targetWeight},
enableButton: ${enableButton}
    ''';
  }
}
