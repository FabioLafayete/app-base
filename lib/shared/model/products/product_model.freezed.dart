// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) {
  return _ProductModel.fromJson(json);
}

/// @nodoc
mixin _$ProductModel {
  String get id => throw _privateConstructorUsedError;
  String get gateway => throw _privateConstructorUsedError;
  String get nameProduct => throw _privateConstructorUsedError;
  String get checkoutUrl => throw _privateConstructorUsedError;
  String? get detailProduct => throw _privateConstructorUsedError;
  String? get subDetailProduct => throw _privateConstructorUsedError;
  int get month => throw _privateConstructorUsedError;
  ProductTypeEnum get type => throw _privateConstructorUsedError;
  dynamic get valueProduct => throw _privateConstructorUsedError;
  dynamic get valueOffer => throw _privateConstructorUsedError;
  bool get enabled => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatetAt => throw _privateConstructorUsedError;
  DateTime? get deletedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductModelCopyWith<ProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductModelCopyWith<$Res> {
  factory $ProductModelCopyWith(
          ProductModel value, $Res Function(ProductModel) then) =
      _$ProductModelCopyWithImpl<$Res, ProductModel>;
  @useResult
  $Res call(
      {String id,
      String gateway,
      String nameProduct,
      String checkoutUrl,
      String? detailProduct,
      String? subDetailProduct,
      int month,
      ProductTypeEnum type,
      dynamic valueProduct,
      dynamic valueOffer,
      bool enabled,
      DateTime createdAt,
      DateTime updatetAt,
      DateTime? deletedAt});
}

/// @nodoc
class _$ProductModelCopyWithImpl<$Res, $Val extends ProductModel>
    implements $ProductModelCopyWith<$Res> {
  _$ProductModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? gateway = null,
    Object? nameProduct = null,
    Object? checkoutUrl = null,
    Object? detailProduct = freezed,
    Object? subDetailProduct = freezed,
    Object? month = null,
    Object? type = null,
    Object? valueProduct = freezed,
    Object? valueOffer = freezed,
    Object? enabled = null,
    Object? createdAt = null,
    Object? updatetAt = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      gateway: null == gateway
          ? _value.gateway
          : gateway // ignore: cast_nullable_to_non_nullable
              as String,
      nameProduct: null == nameProduct
          ? _value.nameProduct
          : nameProduct // ignore: cast_nullable_to_non_nullable
              as String,
      checkoutUrl: null == checkoutUrl
          ? _value.checkoutUrl
          : checkoutUrl // ignore: cast_nullable_to_non_nullable
              as String,
      detailProduct: freezed == detailProduct
          ? _value.detailProduct
          : detailProduct // ignore: cast_nullable_to_non_nullable
              as String?,
      subDetailProduct: freezed == subDetailProduct
          ? _value.subDetailProduct
          : subDetailProduct // ignore: cast_nullable_to_non_nullable
              as String?,
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ProductTypeEnum,
      valueProduct: freezed == valueProduct
          ? _value.valueProduct
          : valueProduct // ignore: cast_nullable_to_non_nullable
              as dynamic,
      valueOffer: freezed == valueOffer
          ? _value.valueOffer
          : valueOffer // ignore: cast_nullable_to_non_nullable
              as dynamic,
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatetAt: null == updatetAt
          ? _value.updatetAt
          : updatetAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProductModelCopyWith<$Res>
    implements $ProductModelCopyWith<$Res> {
  factory _$$_ProductModelCopyWith(
          _$_ProductModel value, $Res Function(_$_ProductModel) then) =
      __$$_ProductModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String gateway,
      String nameProduct,
      String checkoutUrl,
      String? detailProduct,
      String? subDetailProduct,
      int month,
      ProductTypeEnum type,
      dynamic valueProduct,
      dynamic valueOffer,
      bool enabled,
      DateTime createdAt,
      DateTime updatetAt,
      DateTime? deletedAt});
}

/// @nodoc
class __$$_ProductModelCopyWithImpl<$Res>
    extends _$ProductModelCopyWithImpl<$Res, _$_ProductModel>
    implements _$$_ProductModelCopyWith<$Res> {
  __$$_ProductModelCopyWithImpl(
      _$_ProductModel _value, $Res Function(_$_ProductModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? gateway = null,
    Object? nameProduct = null,
    Object? checkoutUrl = null,
    Object? detailProduct = freezed,
    Object? subDetailProduct = freezed,
    Object? month = null,
    Object? type = null,
    Object? valueProduct = freezed,
    Object? valueOffer = freezed,
    Object? enabled = null,
    Object? createdAt = null,
    Object? updatetAt = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_$_ProductModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      gateway: null == gateway
          ? _value.gateway
          : gateway // ignore: cast_nullable_to_non_nullable
              as String,
      nameProduct: null == nameProduct
          ? _value.nameProduct
          : nameProduct // ignore: cast_nullable_to_non_nullable
              as String,
      checkoutUrl: null == checkoutUrl
          ? _value.checkoutUrl
          : checkoutUrl // ignore: cast_nullable_to_non_nullable
              as String,
      detailProduct: freezed == detailProduct
          ? _value.detailProduct
          : detailProduct // ignore: cast_nullable_to_non_nullable
              as String?,
      subDetailProduct: freezed == subDetailProduct
          ? _value.subDetailProduct
          : subDetailProduct // ignore: cast_nullable_to_non_nullable
              as String?,
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ProductTypeEnum,
      valueProduct: freezed == valueProduct
          ? _value.valueProduct
          : valueProduct // ignore: cast_nullable_to_non_nullable
              as dynamic,
      valueOffer: freezed == valueOffer
          ? _value.valueOffer
          : valueOffer // ignore: cast_nullable_to_non_nullable
              as dynamic,
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatetAt: null == updatetAt
          ? _value.updatetAt
          : updatetAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductModel extends _ProductModel {
  const _$_ProductModel(
      {required this.id,
      required this.gateway,
      required this.nameProduct,
      required this.checkoutUrl,
      this.detailProduct,
      this.subDetailProduct,
      required this.month,
      this.type = ProductTypeEnum.SUBSCRIPTION,
      required this.valueProduct,
      this.valueOffer,
      this.enabled = false,
      required this.createdAt,
      required this.updatetAt,
      this.deletedAt})
      : super._();

  factory _$_ProductModel.fromJson(Map<String, dynamic> json) =>
      _$$_ProductModelFromJson(json);

  @override
  final String id;
  @override
  final String gateway;
  @override
  final String nameProduct;
  @override
  final String checkoutUrl;
  @override
  final String? detailProduct;
  @override
  final String? subDetailProduct;
  @override
  final int month;
  @override
  @JsonKey()
  final ProductTypeEnum type;
  @override
  final dynamic valueProduct;
  @override
  final dynamic valueOffer;
  @override
  @JsonKey()
  final bool enabled;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatetAt;
  @override
  final DateTime? deletedAt;

  @override
  String toString() {
    return 'ProductModel(id: $id, gateway: $gateway, nameProduct: $nameProduct, checkoutUrl: $checkoutUrl, detailProduct: $detailProduct, subDetailProduct: $subDetailProduct, month: $month, type: $type, valueProduct: $valueProduct, valueOffer: $valueOffer, enabled: $enabled, createdAt: $createdAt, updatetAt: $updatetAt, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.gateway, gateway) || other.gateway == gateway) &&
            (identical(other.nameProduct, nameProduct) ||
                other.nameProduct == nameProduct) &&
            (identical(other.checkoutUrl, checkoutUrl) ||
                other.checkoutUrl == checkoutUrl) &&
            (identical(other.detailProduct, detailProduct) ||
                other.detailProduct == detailProduct) &&
            (identical(other.subDetailProduct, subDetailProduct) ||
                other.subDetailProduct == subDetailProduct) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality()
                .equals(other.valueProduct, valueProduct) &&
            const DeepCollectionEquality()
                .equals(other.valueOffer, valueOffer) &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatetAt, updatetAt) ||
                other.updatetAt == updatetAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      gateway,
      nameProduct,
      checkoutUrl,
      detailProduct,
      subDetailProduct,
      month,
      type,
      const DeepCollectionEquality().hash(valueProduct),
      const DeepCollectionEquality().hash(valueOffer),
      enabled,
      createdAt,
      updatetAt,
      deletedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductModelCopyWith<_$_ProductModel> get copyWith =>
      __$$_ProductModelCopyWithImpl<_$_ProductModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductModelToJson(
      this,
    );
  }
}

abstract class _ProductModel extends ProductModel {
  const factory _ProductModel(
      {required final String id,
      required final String gateway,
      required final String nameProduct,
      required final String checkoutUrl,
      final String? detailProduct,
      final String? subDetailProduct,
      required final int month,
      final ProductTypeEnum type,
      required final dynamic valueProduct,
      final dynamic valueOffer,
      final bool enabled,
      required final DateTime createdAt,
      required final DateTime updatetAt,
      final DateTime? deletedAt}) = _$_ProductModel;
  const _ProductModel._() : super._();

  factory _ProductModel.fromJson(Map<String, dynamic> json) =
      _$_ProductModel.fromJson;

  @override
  String get id;
  @override
  String get gateway;
  @override
  String get nameProduct;
  @override
  String get checkoutUrl;
  @override
  String? get detailProduct;
  @override
  String? get subDetailProduct;
  @override
  int get month;
  @override
  ProductTypeEnum get type;
  @override
  dynamic get valueProduct;
  @override
  dynamic get valueOffer;
  @override
  bool get enabled;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatetAt;
  @override
  DateTime? get deletedAt;
  @override
  @JsonKey(ignore: true)
  _$$_ProductModelCopyWith<_$_ProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}
