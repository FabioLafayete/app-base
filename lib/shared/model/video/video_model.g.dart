// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_VideoModelModel _$$_VideoModelModelFromJson(Map<String, dynamic> json) =>
    _$_VideoModelModel(
      name: json['name'] as String,
      url: json['url'] as String,
      type: $enumDecode(_$DataSourceTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$_VideoModelModelToJson(_$_VideoModelModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
      'type': _$DataSourceTypeEnumMap[instance.type]!,
    };

const _$DataSourceTypeEnumMap = {
  DataSourceType.asset: 'asset',
  DataSourceType.network: 'network',
  DataSourceType.file: 'file',
  DataSourceType.contentUri: 'contentUri',
};
