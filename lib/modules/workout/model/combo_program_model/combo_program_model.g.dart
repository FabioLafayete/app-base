// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'combo_program_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ComboProgramModel _$$_ComboProgramModelFromJson(Map<String, dynamic> json) =>
    _$_ComboProgramModel(
      id: json['id'] as String,
      name: json['name'] as String,
      targetProgram: (json['targetProgram'] as List<dynamic>?)
              ?.map((e) => TargetProgram.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_ComboProgramModelToJson(
        _$_ComboProgramModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'targetProgram': instance.targetProgram,
    };

_$_TargetProgram _$$_TargetProgramFromJson(Map<String, dynamic> json) =>
    _$_TargetProgram(
      program: json['program'] == null
          ? null
          : ProgramModel.fromJson(json['program'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_TargetProgramToJson(_$_TargetProgram instance) =>
    <String, dynamic>{
      'program': instance.program,
    };
