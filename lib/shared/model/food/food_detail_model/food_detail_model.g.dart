// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FoodDetailModel _$$_FoodDetailModelFromJson(Map<String, dynamic> json) =>
    _$_FoodDetailModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      category: json['category'] as String?,
      image: json['image'] as String?,
      duration: json['duration'] as String?,
      preparation: json['preparation'] as String?,
      ingredients: (json['ingredients'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      difficulty: json['difficulty'] as String?,
      servings: json['servings'] as int?,
      isFavorite: json['isFavorite'] as bool? ?? false,
      kcal: json['kcal'] as int? ?? 0,
      fats: json['fats'] as int? ?? 0,
      carbs: json['carbs'] as int? ?? 0,
      proteins: json['proteins'] as int? ?? 0,
    );

Map<String, dynamic> _$$_FoodDetailModelToJson(_$_FoodDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'category': instance.category,
      'image': instance.image,
      'duration': instance.duration,
      'preparation': instance.preparation,
      'ingredients': instance.ingredients,
      'tags': instance.tags,
      'difficulty': instance.difficulty,
      'servings': instance.servings,
      'isFavorite': instance.isFavorite,
      'kcal': instance.kcal,
      'fats': instance.fats,
      'carbs': instance.carbs,
      'proteins': instance.proteins,
    };
