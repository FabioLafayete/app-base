// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductModel _$$_ProductModelFromJson(Map<String, dynamic> json) =>
    _$_ProductModel(
      id: json['id'] as String,
      gateway: json['gateway'] as String,
      nameProduct: json['nameProduct'] as String,
      checkoutUrl: json['checkoutUrl'] as String,
      detailProduct: json['detailProduct'] as String?,
      subDetailProduct: json['subDetailProduct'] as String?,
      month: json['month'] as int,
      type: $enumDecodeNullable(_$ProductTypeEnumEnumMap, json['type']) ??
          ProductTypeEnum.SUBSCRIPTION,
      valueProduct: json['valueProduct'],
      valueOffer: json['valueOffer'],
      enabled: json['enabled'] as bool? ?? false,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatetAt: DateTime.parse(json['updatetAt'] as String),
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
    );

Map<String, dynamic> _$$_ProductModelToJson(_$_ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'gateway': instance.gateway,
      'nameProduct': instance.nameProduct,
      'checkoutUrl': instance.checkoutUrl,
      'detailProduct': instance.detailProduct,
      'subDetailProduct': instance.subDetailProduct,
      'month': instance.month,
      'type': _$ProductTypeEnumEnumMap[instance.type]!,
      'valueProduct': instance.valueProduct,
      'valueOffer': instance.valueOffer,
      'enabled': instance.enabled,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatetAt': instance.updatetAt.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
    };

const _$ProductTypeEnumEnumMap = {
  ProductTypeEnum.SUBSCRIPTION: 'SUBSCRIPTION',
};
