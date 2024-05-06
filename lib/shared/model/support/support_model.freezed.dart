// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'support_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SupportModel _$SupportModelFromJson(Map<String, dynamic> json) {
  return _SupportModel.fromJson(json);
}

/// @nodoc
mixin _$SupportModel {
  String get subject => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  SupportReasonEnum get reason => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SupportModelCopyWith<SupportModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SupportModelCopyWith<$Res> {
  factory $SupportModelCopyWith(
          SupportModel value, $Res Function(SupportModel) then) =
      _$SupportModelCopyWithImpl<$Res, SupportModel>;
  @useResult
  $Res call({String subject, String message, SupportReasonEnum reason});
}

/// @nodoc
class _$SupportModelCopyWithImpl<$Res, $Val extends SupportModel>
    implements $SupportModelCopyWith<$Res> {
  _$SupportModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subject = null,
    Object? message = null,
    Object? reason = null,
  }) {
    return _then(_value.copyWith(
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as SupportReasonEnum,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SupportModelCopyWith<$Res>
    implements $SupportModelCopyWith<$Res> {
  factory _$$_SupportModelCopyWith(
          _$_SupportModel value, $Res Function(_$_SupportModel) then) =
      __$$_SupportModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String subject, String message, SupportReasonEnum reason});
}

/// @nodoc
class __$$_SupportModelCopyWithImpl<$Res>
    extends _$SupportModelCopyWithImpl<$Res, _$_SupportModel>
    implements _$$_SupportModelCopyWith<$Res> {
  __$$_SupportModelCopyWithImpl(
      _$_SupportModel _value, $Res Function(_$_SupportModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subject = null,
    Object? message = null,
    Object? reason = null,
  }) {
    return _then(_$_SupportModel(
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as SupportReasonEnum,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SupportModel extends _SupportModel {
  const _$_SupportModel(
      {required this.subject, required this.message, required this.reason})
      : super._();

  factory _$_SupportModel.fromJson(Map<String, dynamic> json) =>
      _$$_SupportModelFromJson(json);

  @override
  final String subject;
  @override
  final String message;
  @override
  final SupportReasonEnum reason;

  @override
  String toString() {
    return 'SupportModel(subject: $subject, message: $message, reason: $reason)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SupportModel &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, subject, message, reason);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SupportModelCopyWith<_$_SupportModel> get copyWith =>
      __$$_SupportModelCopyWithImpl<_$_SupportModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SupportModelToJson(
      this,
    );
  }
}

abstract class _SupportModel extends SupportModel {
  const factory _SupportModel(
      {required final String subject,
      required final String message,
      required final SupportReasonEnum reason}) = _$_SupportModel;
  const _SupportModel._() : super._();

  factory _SupportModel.fromJson(Map<String, dynamic> json) =
      _$_SupportModel.fromJson;

  @override
  String get subject;
  @override
  String get message;
  @override
  SupportReasonEnum get reason;
  @override
  @JsonKey(ignore: true)
  _$$_SupportModelCopyWith<_$_SupportModel> get copyWith =>
      throw _privateConstructorUsedError;
}
