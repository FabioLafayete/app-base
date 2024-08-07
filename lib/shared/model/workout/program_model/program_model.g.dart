// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'program_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProgramModel _$$_ProgramModelFromJson(Map<String, dynamic> json) =>
    _$_ProgramModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      difficulty: json['difficulty'] as String?,
      duration: json['duration'] as String?,
      kcal: json['kcal'] as int? ?? 0,
      rate: json['rate'] as int?,
      thumbnail: json['thumbnail'] as String,
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      workouts: (json['workoutsProgram'] as List<dynamic>)
          .map((e) => WorkoutsProgram.fromJson(e as Map<String, dynamic>))
          .toList(),
      alreadySeen: json['alreadySeen'] as bool? ?? false,
      isSoon: json['isSoon'] as bool? ?? false,
    );

Map<String, dynamic> _$$_ProgramModelToJson(_$_ProgramModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'difficulty': instance.difficulty,
      'duration': instance.duration,
      'kcal': instance.kcal,
      'rate': instance.rate,
      'thumbnail': instance.thumbnail,
      'tags': instance.tags,
      'workoutsProgram': instance.workouts,
      'alreadySeen': instance.alreadySeen,
      'isSoon': instance.isSoon,
    };

_$_WorkoutsProgram _$$_WorkoutsProgramFromJson(Map<String, dynamic> json) =>
    _$_WorkoutsProgram(
      video: json['video'] == null
          ? null
          : WorkoutModel.fromJson(json['video'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_WorkoutsProgramToJson(_$_WorkoutsProgram instance) =>
    <String, dynamic>{
      'video': instance.video,
    };
