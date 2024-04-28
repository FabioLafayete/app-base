// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'combo_program_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ComboProgramModel _$ComboProgramModelFromJson(Map<String, dynamic> json) {
  return _ComboProgramModel.fromJson(json);
}

/// @nodoc
mixin _$ComboProgramModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<TargetProgram> get targetProgram => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ComboProgramModelCopyWith<ComboProgramModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComboProgramModelCopyWith<$Res> {
  factory $ComboProgramModelCopyWith(
          ComboProgramModel value, $Res Function(ComboProgramModel) then) =
      _$ComboProgramModelCopyWithImpl<$Res, ComboProgramModel>;
  @useResult
  $Res call({String id, String name, List<TargetProgram> targetProgram});
}

/// @nodoc
class _$ComboProgramModelCopyWithImpl<$Res, $Val extends ComboProgramModel>
    implements $ComboProgramModelCopyWith<$Res> {
  _$ComboProgramModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? targetProgram = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      targetProgram: null == targetProgram
          ? _value.targetProgram
          : targetProgram // ignore: cast_nullable_to_non_nullable
              as List<TargetProgram>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ComboProgramModelCopyWith<$Res>
    implements $ComboProgramModelCopyWith<$Res> {
  factory _$$_ComboProgramModelCopyWith(_$_ComboProgramModel value,
          $Res Function(_$_ComboProgramModel) then) =
      __$$_ComboProgramModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, List<TargetProgram> targetProgram});
}

/// @nodoc
class __$$_ComboProgramModelCopyWithImpl<$Res>
    extends _$ComboProgramModelCopyWithImpl<$Res, _$_ComboProgramModel>
    implements _$$_ComboProgramModelCopyWith<$Res> {
  __$$_ComboProgramModelCopyWithImpl(
      _$_ComboProgramModel _value, $Res Function(_$_ComboProgramModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? targetProgram = null,
  }) {
    return _then(_$_ComboProgramModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      targetProgram: null == targetProgram
          ? _value._targetProgram
          : targetProgram // ignore: cast_nullable_to_non_nullable
              as List<TargetProgram>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ComboProgramModel extends _ComboProgramModel {
  const _$_ComboProgramModel(
      {required this.id,
      required this.name,
      final List<TargetProgram> targetProgram = const []})
      : _targetProgram = targetProgram,
        super._();

  factory _$_ComboProgramModel.fromJson(Map<String, dynamic> json) =>
      _$$_ComboProgramModelFromJson(json);

  @override
  final String id;
  @override
  final String name;
  final List<TargetProgram> _targetProgram;
  @override
  @JsonKey()
  List<TargetProgram> get targetProgram {
    if (_targetProgram is EqualUnmodifiableListView) return _targetProgram;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_targetProgram);
  }

  @override
  String toString() {
    return 'ComboProgramModel(id: $id, name: $name, targetProgram: $targetProgram)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ComboProgramModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._targetProgram, _targetProgram));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name,
      const DeepCollectionEquality().hash(_targetProgram));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ComboProgramModelCopyWith<_$_ComboProgramModel> get copyWith =>
      __$$_ComboProgramModelCopyWithImpl<_$_ComboProgramModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ComboProgramModelToJson(
      this,
    );
  }
}

abstract class _ComboProgramModel extends ComboProgramModel {
  const factory _ComboProgramModel(
      {required final String id,
      required final String name,
      final List<TargetProgram> targetProgram}) = _$_ComboProgramModel;
  const _ComboProgramModel._() : super._();

  factory _ComboProgramModel.fromJson(Map<String, dynamic> json) =
      _$_ComboProgramModel.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  List<TargetProgram> get targetProgram;
  @override
  @JsonKey(ignore: true)
  _$$_ComboProgramModelCopyWith<_$_ComboProgramModel> get copyWith =>
      throw _privateConstructorUsedError;
}

TargetProgram _$TargetProgramFromJson(Map<String, dynamic> json) {
  return _TargetProgram.fromJson(json);
}

/// @nodoc
mixin _$TargetProgram {
  ProgramModel? get program => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TargetProgramCopyWith<TargetProgram> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TargetProgramCopyWith<$Res> {
  factory $TargetProgramCopyWith(
          TargetProgram value, $Res Function(TargetProgram) then) =
      _$TargetProgramCopyWithImpl<$Res, TargetProgram>;
  @useResult
  $Res call({ProgramModel? program});

  $ProgramModelCopyWith<$Res>? get program;
}

/// @nodoc
class _$TargetProgramCopyWithImpl<$Res, $Val extends TargetProgram>
    implements $TargetProgramCopyWith<$Res> {
  _$TargetProgramCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? program = freezed,
  }) {
    return _then(_value.copyWith(
      program: freezed == program
          ? _value.program
          : program // ignore: cast_nullable_to_non_nullable
              as ProgramModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProgramModelCopyWith<$Res>? get program {
    if (_value.program == null) {
      return null;
    }

    return $ProgramModelCopyWith<$Res>(_value.program!, (value) {
      return _then(_value.copyWith(program: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TargetProgramCopyWith<$Res>
    implements $TargetProgramCopyWith<$Res> {
  factory _$$_TargetProgramCopyWith(
          _$_TargetProgram value, $Res Function(_$_TargetProgram) then) =
      __$$_TargetProgramCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ProgramModel? program});

  @override
  $ProgramModelCopyWith<$Res>? get program;
}

/// @nodoc
class __$$_TargetProgramCopyWithImpl<$Res>
    extends _$TargetProgramCopyWithImpl<$Res, _$_TargetProgram>
    implements _$$_TargetProgramCopyWith<$Res> {
  __$$_TargetProgramCopyWithImpl(
      _$_TargetProgram _value, $Res Function(_$_TargetProgram) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? program = freezed,
  }) {
    return _then(_$_TargetProgram(
      program: freezed == program
          ? _value.program
          : program // ignore: cast_nullable_to_non_nullable
              as ProgramModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TargetProgram implements _TargetProgram {
  const _$_TargetProgram({this.program});

  factory _$_TargetProgram.fromJson(Map<String, dynamic> json) =>
      _$$_TargetProgramFromJson(json);

  @override
  final ProgramModel? program;

  @override
  String toString() {
    return 'TargetProgram(program: $program)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TargetProgram &&
            (identical(other.program, program) || other.program == program));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, program);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TargetProgramCopyWith<_$_TargetProgram> get copyWith =>
      __$$_TargetProgramCopyWithImpl<_$_TargetProgram>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TargetProgramToJson(
      this,
    );
  }
}

abstract class _TargetProgram implements TargetProgram {
  const factory _TargetProgram({final ProgramModel? program}) =
      _$_TargetProgram;

  factory _TargetProgram.fromJson(Map<String, dynamic> json) =
      _$_TargetProgram.fromJson;

  @override
  ProgramModel? get program;
  @override
  @JsonKey(ignore: true)
  _$$_TargetProgramCopyWith<_$_TargetProgram> get copyWith =>
      throw _privateConstructorUsedError;
}
