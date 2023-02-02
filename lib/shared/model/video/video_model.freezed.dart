// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VideoModel _$VideoModelFromJson(Map<String, dynamic> json) {
  return _VideoModelModel.fromJson(json);
}

/// @nodoc
mixin _$VideoModel {
  String get name => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  DataSourceType get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VideoModelCopyWith<VideoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoModelCopyWith<$Res> {
  factory $VideoModelCopyWith(
          VideoModel value, $Res Function(VideoModel) then) =
      _$VideoModelCopyWithImpl<$Res, VideoModel>;
  @useResult
  $Res call({String name, String url, DataSourceType type});
}

/// @nodoc
class _$VideoModelCopyWithImpl<$Res, $Val extends VideoModel>
    implements $VideoModelCopyWith<$Res> {
  _$VideoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DataSourceType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_VideoModelModelCopyWith<$Res>
    implements $VideoModelCopyWith<$Res> {
  factory _$$_VideoModelModelCopyWith(
          _$_VideoModelModel value, $Res Function(_$_VideoModelModel) then) =
      __$$_VideoModelModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String url, DataSourceType type});
}

/// @nodoc
class __$$_VideoModelModelCopyWithImpl<$Res>
    extends _$VideoModelCopyWithImpl<$Res, _$_VideoModelModel>
    implements _$$_VideoModelModelCopyWith<$Res> {
  __$$_VideoModelModelCopyWithImpl(
      _$_VideoModelModel _value, $Res Function(_$_VideoModelModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
    Object? type = null,
  }) {
    return _then(_$_VideoModelModel(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DataSourceType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_VideoModelModel extends _VideoModelModel {
  const _$_VideoModelModel(
      {required this.name, required this.url, required this.type})
      : super._();

  factory _$_VideoModelModel.fromJson(Map<String, dynamic> json) =>
      _$$_VideoModelModelFromJson(json);

  @override
  final String name;
  @override
  final String url;
  @override
  final DataSourceType type;

  @override
  String toString() {
    return 'VideoModel(name: $name, url: $url, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VideoModelModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, url, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VideoModelModelCopyWith<_$_VideoModelModel> get copyWith =>
      __$$_VideoModelModelCopyWithImpl<_$_VideoModelModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VideoModelModelToJson(
      this,
    );
  }
}

abstract class _VideoModelModel extends VideoModel {
  const factory _VideoModelModel(
      {required final String name,
      required final String url,
      required final DataSourceType type}) = _$_VideoModelModel;
  const _VideoModelModel._() : super._();

  factory _VideoModelModel.fromJson(Map<String, dynamic> json) =
      _$_VideoModelModel.fromJson;

  @override
  String get name;
  @override
  String get url;
  @override
  DataSourceType get type;
  @override
  @JsonKey(ignore: true)
  _$$_VideoModelModelCopyWith<_$_VideoModelModel> get copyWith =>
      throw _privateConstructorUsedError;
}
