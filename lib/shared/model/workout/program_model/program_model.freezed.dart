// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'program_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProgramModel _$ProgramModelFromJson(Map<String, dynamic> json) {
  return _ProgramModel.fromJson(json);
}

/// @nodoc
mixin _$ProgramModel {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get difficulty => throw _privateConstructorUsedError;
  String? get duration => throw _privateConstructorUsedError;
  int get kcal => throw _privateConstructorUsedError;
  int? get rate => throw _privateConstructorUsedError;
  String get thumbnail => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  @JsonKey(name: 'workoutsProgram')
  List<WorkoutsProgram> get workouts => throw _privateConstructorUsedError;
  bool get alreadySeen => throw _privateConstructorUsedError;
  bool get isSoon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProgramModelCopyWith<ProgramModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProgramModelCopyWith<$Res> {
  factory $ProgramModelCopyWith(
          ProgramModel value, $Res Function(ProgramModel) then) =
      _$ProgramModelCopyWithImpl<$Res, ProgramModel>;
  @useResult
  $Res call(
      {String id,
      String title,
      String? description,
      String? difficulty,
      String? duration,
      int kcal,
      int? rate,
      String thumbnail,
      List<String> tags,
      @JsonKey(name: 'workoutsProgram') List<WorkoutsProgram> workouts,
      bool alreadySeen,
      bool isSoon});
}

/// @nodoc
class _$ProgramModelCopyWithImpl<$Res, $Val extends ProgramModel>
    implements $ProgramModelCopyWith<$Res> {
  _$ProgramModelCopyWithImpl(this._value, this._then);

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
    Object? difficulty = freezed,
    Object? duration = freezed,
    Object? kcal = null,
    Object? rate = freezed,
    Object? thumbnail = null,
    Object? tags = null,
    Object? workouts = null,
    Object? alreadySeen = null,
    Object? isSoon = null,
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
      difficulty: freezed == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String?,
      kcal: null == kcal
          ? _value.kcal
          : kcal // ignore: cast_nullable_to_non_nullable
              as int,
      rate: freezed == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as int?,
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      workouts: null == workouts
          ? _value.workouts
          : workouts // ignore: cast_nullable_to_non_nullable
              as List<WorkoutsProgram>,
      alreadySeen: null == alreadySeen
          ? _value.alreadySeen
          : alreadySeen // ignore: cast_nullable_to_non_nullable
              as bool,
      isSoon: null == isSoon
          ? _value.isSoon
          : isSoon // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProgramModelCopyWith<$Res>
    implements $ProgramModelCopyWith<$Res> {
  factory _$$_ProgramModelCopyWith(
          _$_ProgramModel value, $Res Function(_$_ProgramModel) then) =
      __$$_ProgramModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String? description,
      String? difficulty,
      String? duration,
      int kcal,
      int? rate,
      String thumbnail,
      List<String> tags,
      @JsonKey(name: 'workoutsProgram') List<WorkoutsProgram> workouts,
      bool alreadySeen,
      bool isSoon});
}

/// @nodoc
class __$$_ProgramModelCopyWithImpl<$Res>
    extends _$ProgramModelCopyWithImpl<$Res, _$_ProgramModel>
    implements _$$_ProgramModelCopyWith<$Res> {
  __$$_ProgramModelCopyWithImpl(
      _$_ProgramModel _value, $Res Function(_$_ProgramModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = freezed,
    Object? difficulty = freezed,
    Object? duration = freezed,
    Object? kcal = null,
    Object? rate = freezed,
    Object? thumbnail = null,
    Object? tags = null,
    Object? workouts = null,
    Object? alreadySeen = null,
    Object? isSoon = null,
  }) {
    return _then(_$_ProgramModel(
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
      difficulty: freezed == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String?,
      kcal: null == kcal
          ? _value.kcal
          : kcal // ignore: cast_nullable_to_non_nullable
              as int,
      rate: freezed == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as int?,
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      workouts: null == workouts
          ? _value._workouts
          : workouts // ignore: cast_nullable_to_non_nullable
              as List<WorkoutsProgram>,
      alreadySeen: null == alreadySeen
          ? _value.alreadySeen
          : alreadySeen // ignore: cast_nullable_to_non_nullable
              as bool,
      isSoon: null == isSoon
          ? _value.isSoon
          : isSoon // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProgramModel extends _ProgramModel {
  const _$_ProgramModel(
      {required this.id,
      required this.title,
      this.description,
      this.difficulty,
      this.duration,
      this.kcal = 0,
      this.rate,
      required this.thumbnail,
      final List<String> tags = const [],
      @JsonKey(name: 'workoutsProgram')
      required final List<WorkoutsProgram> workouts,
      this.alreadySeen = false,
      this.isSoon = false})
      : _tags = tags,
        _workouts = workouts,
        super._();

  factory _$_ProgramModel.fromJson(Map<String, dynamic> json) =>
      _$$_ProgramModelFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String? description;
  @override
  final String? difficulty;
  @override
  final String? duration;
  @override
  @JsonKey()
  final int kcal;
  @override
  final int? rate;
  @override
  final String thumbnail;
  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  final List<WorkoutsProgram> _workouts;
  @override
  @JsonKey(name: 'workoutsProgram')
  List<WorkoutsProgram> get workouts {
    if (_workouts is EqualUnmodifiableListView) return _workouts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_workouts);
  }

  @override
  @JsonKey()
  final bool alreadySeen;
  @override
  @JsonKey()
  final bool isSoon;

  @override
  String toString() {
    return 'ProgramModel(id: $id, title: $title, description: $description, difficulty: $difficulty, duration: $duration, kcal: $kcal, rate: $rate, thumbnail: $thumbnail, tags: $tags, workouts: $workouts, alreadySeen: $alreadySeen, isSoon: $isSoon)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProgramModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.difficulty, difficulty) ||
                other.difficulty == difficulty) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.kcal, kcal) || other.kcal == kcal) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality().equals(other._workouts, _workouts) &&
            (identical(other.alreadySeen, alreadySeen) ||
                other.alreadySeen == alreadySeen) &&
            (identical(other.isSoon, isSoon) || other.isSoon == isSoon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      difficulty,
      duration,
      kcal,
      rate,
      thumbnail,
      const DeepCollectionEquality().hash(_tags),
      const DeepCollectionEquality().hash(_workouts),
      alreadySeen,
      isSoon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProgramModelCopyWith<_$_ProgramModel> get copyWith =>
      __$$_ProgramModelCopyWithImpl<_$_ProgramModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProgramModelToJson(
      this,
    );
  }
}

abstract class _ProgramModel extends ProgramModel {
  const factory _ProgramModel(
      {required final String id,
      required final String title,
      final String? description,
      final String? difficulty,
      final String? duration,
      final int kcal,
      final int? rate,
      required final String thumbnail,
      final List<String> tags,
      @JsonKey(name: 'workoutsProgram')
      required final List<WorkoutsProgram> workouts,
      final bool alreadySeen,
      final bool isSoon}) = _$_ProgramModel;
  const _ProgramModel._() : super._();

  factory _ProgramModel.fromJson(Map<String, dynamic> json) =
      _$_ProgramModel.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String? get description;
  @override
  String? get difficulty;
  @override
  String? get duration;
  @override
  int get kcal;
  @override
  int? get rate;
  @override
  String get thumbnail;
  @override
  List<String> get tags;
  @override
  @JsonKey(name: 'workoutsProgram')
  List<WorkoutsProgram> get workouts;
  @override
  bool get alreadySeen;
  @override
  bool get isSoon;
  @override
  @JsonKey(ignore: true)
  _$$_ProgramModelCopyWith<_$_ProgramModel> get copyWith =>
      throw _privateConstructorUsedError;
}

WorkoutsProgram _$WorkoutsProgramFromJson(Map<String, dynamic> json) {
  return _WorkoutsProgram.fromJson(json);
}

/// @nodoc
mixin _$WorkoutsProgram {
  WorkoutModel? get video => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkoutsProgramCopyWith<WorkoutsProgram> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutsProgramCopyWith<$Res> {
  factory $WorkoutsProgramCopyWith(
          WorkoutsProgram value, $Res Function(WorkoutsProgram) then) =
      _$WorkoutsProgramCopyWithImpl<$Res, WorkoutsProgram>;
  @useResult
  $Res call({WorkoutModel? video});

  $WorkoutModelCopyWith<$Res>? get video;
}

/// @nodoc
class _$WorkoutsProgramCopyWithImpl<$Res, $Val extends WorkoutsProgram>
    implements $WorkoutsProgramCopyWith<$Res> {
  _$WorkoutsProgramCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? video = freezed,
  }) {
    return _then(_value.copyWith(
      video: freezed == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as WorkoutModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WorkoutModelCopyWith<$Res>? get video {
    if (_value.video == null) {
      return null;
    }

    return $WorkoutModelCopyWith<$Res>(_value.video!, (value) {
      return _then(_value.copyWith(video: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_WorkoutsProgramCopyWith<$Res>
    implements $WorkoutsProgramCopyWith<$Res> {
  factory _$$_WorkoutsProgramCopyWith(
          _$_WorkoutsProgram value, $Res Function(_$_WorkoutsProgram) then) =
      __$$_WorkoutsProgramCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({WorkoutModel? video});

  @override
  $WorkoutModelCopyWith<$Res>? get video;
}

/// @nodoc
class __$$_WorkoutsProgramCopyWithImpl<$Res>
    extends _$WorkoutsProgramCopyWithImpl<$Res, _$_WorkoutsProgram>
    implements _$$_WorkoutsProgramCopyWith<$Res> {
  __$$_WorkoutsProgramCopyWithImpl(
      _$_WorkoutsProgram _value, $Res Function(_$_WorkoutsProgram) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? video = freezed,
  }) {
    return _then(_$_WorkoutsProgram(
      video: freezed == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as WorkoutModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WorkoutsProgram implements _WorkoutsProgram {
  const _$_WorkoutsProgram({this.video});

  factory _$_WorkoutsProgram.fromJson(Map<String, dynamic> json) =>
      _$$_WorkoutsProgramFromJson(json);

  @override
  final WorkoutModel? video;

  @override
  String toString() {
    return 'WorkoutsProgram(video: $video)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WorkoutsProgram &&
            (identical(other.video, video) || other.video == video));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, video);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WorkoutsProgramCopyWith<_$_WorkoutsProgram> get copyWith =>
      __$$_WorkoutsProgramCopyWithImpl<_$_WorkoutsProgram>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WorkoutsProgramToJson(
      this,
    );
  }
}

abstract class _WorkoutsProgram implements WorkoutsProgram {
  const factory _WorkoutsProgram({final WorkoutModel? video}) =
      _$_WorkoutsProgram;

  factory _WorkoutsProgram.fromJson(Map<String, dynamic> json) =
      _$_WorkoutsProgram.fromJson;

  @override
  WorkoutModel? get video;
  @override
  @JsonKey(ignore: true)
  _$$_WorkoutsProgramCopyWith<_$_WorkoutsProgram> get copyWith =>
      throw _privateConstructorUsedError;
}
