// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      age: json['age'] == null ? null : DateTime.parse(json['age'] as String),
      cellphone: json['cellphone'] as String?,
      photoUrl: json['photoUrl'] as String?,
      gender: json['gender'] as String?,
      limitation: json['limitation'] as String?,
      height: json['height'] as int?,
      weight: json['weight'] as int?,
      targetWeight: json['targetWeight'] as int?,
      target: json['target'] as String?,
      activated: json['activated'] as bool? ?? true,
      newUser: json['newUser'] as bool? ?? true,
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'age': instance.age?.toIso8601String(),
      'cellphone': instance.cellphone,
      'photoUrl': instance.photoUrl,
      'gender': instance.gender,
      'limitation': instance.limitation,
      'height': instance.height,
      'weight': instance.weight,
      'targetWeight': instance.targetWeight,
      'target': instance.target,
      'activated': instance.activated,
      'newUser': instance.newUser,
    };
