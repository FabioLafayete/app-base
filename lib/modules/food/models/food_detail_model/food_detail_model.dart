import 'package:freezed_annotation/freezed_annotation.dart';

part 'food_detail_model.freezed.dart';
part 'food_detail_model.g.dart';

@freezed
class FoodDetailModel with _$FoodDetailModel {
  const FoodDetailModel._();
  const factory FoodDetailModel({
    String? id,
    String? name,
    String? description,
    String? type,
    String? image,
    String? duration,
    String? preparation,
    @Default([]) List<String> ingredients,
    String? difficulty,
    int? servings,
    @Default(false) bool isFavorite,
    @Default(0) int kcal,
    @Default(0) int fats,
    @Default(0) int carbs,
    @Default(0) int proteins,
  }) = _FoodDetailModel;

  factory FoodDetailModel.fromJson(Map<String, dynamic> json) =>
      _$FoodDetailModelFromJson(json);
}
