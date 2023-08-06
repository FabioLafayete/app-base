// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FoodController on FoodControllerBase, Store {
  late final _$listFoodDetailAtom =
      Atom(name: 'FoodControllerBase.listFoodDetail', context: context);

  @override
  List<FoodDetailModel> get listFoodDetail {
    _$listFoodDetailAtom.reportRead();
    return super.listFoodDetail;
  }

  @override
  set listFoodDetail(List<FoodDetailModel> value) {
    _$listFoodDetailAtom.reportWrite(value, super.listFoodDetail, () {
      super.listFoodDetail = value;
    });
  }

  late final _$FoodControllerBaseActionController =
      ActionController(name: 'FoodControllerBase', context: context);

  @override
  dynamic setListFoodDetail(List<FoodDetailModel> value) {
    final _$actionInfo = _$FoodControllerBaseActionController.startAction(
        name: 'FoodControllerBase.setListFoodDetail');
    try {
      return super.setListFoodDetail(value);
    } finally {
      _$FoodControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listFoodDetail: ${listFoodDetail}
    ''';
  }
}
