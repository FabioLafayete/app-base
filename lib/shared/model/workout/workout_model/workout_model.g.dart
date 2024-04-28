// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WorkoutModel _$$_WorkoutModelFromJson(Map<String, dynamic> json) =>
    _$_WorkoutModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      duration: json['duration'] as String?,
      videoUrl: json['streamUrl'] as String,
      thumbnail: json['thumbnail'] as String?,
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      alreadySeen: json['alreadySeen'] as bool? ?? false,
    );

Map<String, dynamic> _$$_WorkoutModelToJson(_$_WorkoutModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'duration': instance.duration,
      'streamUrl': instance.videoUrl,
      'thumbnail': instance.thumbnail,
      'tags': instance.tags,
      'alreadySeen': instance.alreadySeen,
    };
