// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bottom_sheet_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BottomSheetController on BottomSheetControllerBase, Store {
  Computed<double>? _$heightBottomSheetComputed;

  @override
  double get heightBottomSheet => (_$heightBottomSheetComputed ??=
          Computed<double>(() => super.heightBottomSheet,
              name: 'BottomSheetControllerBase.heightBottomSheet'))
      .value;

  late final _$_heightBottomSheetAtom = Atom(
      name: 'BottomSheetControllerBase._heightBottomSheet', context: context);

  @override
  RxDouble get _heightBottomSheet {
    _$_heightBottomSheetAtom.reportRead();
    return super._heightBottomSheet;
  }

  @override
  set _heightBottomSheet(RxDouble value) {
    _$_heightBottomSheetAtom.reportWrite(value, super._heightBottomSheet, () {
      super._heightBottomSheet = value;
    });
  }

  late final _$BottomSheetControllerBaseActionController =
      ActionController(name: 'BottomSheetControllerBase', context: context);

  @override
  dynamic setHeightBottomSheet(double value) {
    final _$actionInfo = _$BottomSheetControllerBaseActionController
        .startAction(name: 'BottomSheetControllerBase.setHeightBottomSheet');
    try {
      return super.setHeightBottomSheet(value);
    } finally {
      _$BottomSheetControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
heightBottomSheet: ${heightBottomSheet}
    ''';
  }
}
