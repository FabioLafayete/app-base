import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class ProductModel with _$ProductModel {
  const ProductModel._();
  const factory ProductModel({
    required String id,
    required String gateway,
    required String nameProduct,
    required String checkoutUrl,
    String? detailProduct,
    String? subDetailProduct,
    required int month,
    @Default(ProductTypeEnum.SUBSCRIPTION) ProductTypeEnum type,
    required dynamic valueProduct,
    dynamic valueOffer,
    @Default(false) bool enabled,
    required DateTime createdAt,
    required DateTime updatetAt,
    DateTime? deletedAt,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}

enum ProductTypeEnum { SUBSCRIPTION }
