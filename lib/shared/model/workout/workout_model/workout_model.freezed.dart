// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WorkoutModel _$WorkoutModelFromJson(Map<String, dynamic> json) {
  return _WorkoutModel.fromJson(json);
}

/// @nodoc
mixin _$WorkoutModel {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get duration => throw _privateConstructorUsedError;
  @JsonKey(name: 'streamUrl')
  String get videoUrl => throw _privateConstructorUsedError;
  String? get thumbnail => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  bool get alreadySeen => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkoutModelCopyWith<WorkoutModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutModelCopyWith<$Res> {
  factory $WorkoutModelCopyWith(
          WorkoutModel value, $Res Function(WorkoutModel) then) =
      _$WorkoutModelCopyWithImpl<$Res, WorkoutModel>;
  @useResult
  $Res call(
      {String id,
      String title,
      String? description,
      String? duration,
      @JsonKey(name: 'streamUrl') String videoUrl,
      String? thumbnail,
      List<String> tags,
      bool alreadySeen});
}

/// @nodoc
class _$WorkoutModelCopyWithImpl<$Res, $Val extends WorkoutModel>
    implements $WorkoutModelCopyWith<$Res> {
  _$WorkoutModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = freezed,
    Object? duration = freezed,
    Object? videoUrl = null,
    Object? thumbnail = freezed,
    Object? tags = null,
    Object? alreadySeen = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String?,
      videoUrl: null == videoUrl
          ? _value.videoUrl
          : videoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnail: freezed == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      alreadySeen: null == alreadySeen
          ? _value.alreadySeen
          : alreadySeen // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WorkoutModelCopyWith<$Res>
    implements $WorkoutModelCopyWith<$Res> {
  factory _$$_WorkoutModelCopyWith(
          _$_WorkoutModel value, $Res Function(_$_WorkoutModel) then) =
      __$$_WorkoutModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String? description,
      String? duration,
      @JsonKey(name: 'streamUrl') String videoUrl,
      String? thumbnail,
      List<String> tags,
      bool alreadySeen});
}

/// @nodoc
class __$$_WorkoutModelCopyWithImpl<$Res>
    extends _$WorkoutModelCopyWithImpl<$Res, _$_WorkoutModel>
    implements _$$_WorkoutModelCopyWith<$Res> {
  __$$_WorkoutModelCopyWithImpl(
      _$_WorkoutModel _value, $Res Function(_$_WorkoutModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = freezed,
    Object? duration = freezed,
    Object? videoUrl = null,
    Object? thumbnail = freezed,
    Object? tags = null,
    Object? alreadySeen = null,
  }) {
    return _then(_$_WorkoutModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String?,
      videoUrl: null == videoUrl
          ? _value.videoUrl
          : videoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnail: freezed == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      alreadySeen: null == alreadySeen
          ? _value.alreadySeen
          : alreadySeen // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WorkoutModel extends _WorkoutModel {
  _$_WorkoutModel(
      {required this.id,
      required this.title,
      this.description,
      this.duration,
      @JsonKey(name: 'streamUrl') required this.videoUrl,
      this.thumbnail,
      final List<String> tags = const [],
      this.alreadySeen = false})
      : _tags = tags,
        super._();

  factory _$_WorkoutModel.fromJson(Map<String, dynamic> json) =>
      _$$_WorkoutModelFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String? description;
  @override
  final String? duration;
  @override
  @JsonKey(name: 'streamUrl')
  final String videoUrl;
  @override
  final String? thumbnail;
  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  @JsonKey()
  final bool alreadySeen;

  @override
  String toString() {
    return 'WorkoutModel(id: $id, title: $title, description: $description, duration: $duration, videoUrl: $videoUrl, thumbnail: $thumbnail, tags: $tags, alreadySeen: $alreadySeen)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WorkoutModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.videoUrl, videoUrl) ||
                other.videoUrl == videoUrl) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.alreadySeen, alreadySeen) ||
                other.alreadySeen == alreadySeen));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      duration,
      videoUrl,
      thumbnail,
      const DeepCollectionEquality().hash(_tags),
      alreadySeen);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WorkoutModelCopyWith<_$_WorkoutModel> get copyWith =>
      __$$_WorkoutModelCopyWithImpl<_$_WorkoutModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WorkoutModelToJson(
      this,
    );
  }
}

abstract class _WorkoutModel extends WorkoutModel {
  factory _WorkoutModel(
      {required final String id,
      required final String title,
      final String? description,
      final String? duration,
      @JsonKey(name: 'streamUrl') required final String videoUrl,
      final String? thumbnail,
      final List<String> tags,
      final bool alreadySeen}) = _$_WorkoutModel;
  _WorkoutModel._() : super._();

  factory _WorkoutModel.fromJson(Map<String, dynamic> json) =
      _$_WorkoutModel.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String? get description;
  @override
  String? get duration;
  @override
  @JsonKey(name: 'streamUrl')
  String get videoUrl;
  @override
  String? get thumbnail;
  @override
  List<String> get tags;
  @override
  bool get alreadySeen;
  @override
  @JsonKey(ignore: true)
  _$$_WorkoutModelCopyWith<_$_WorkoutModel> get copyWith =>
      throw _privateConstructorUsedError;
}
