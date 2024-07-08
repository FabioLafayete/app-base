// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const UserModel._();
  const factory UserModel({
    String? id,
    String? name,
    String? email,
    String? cpf,
    String? password,
    DateTime? age,
    String? cellphone,
    String? photoUrl,
    String? gender,
    String? limitation,
    int? height,
    int? weight,
    int? targetWeight,
    String? target,
    String? country,
    @Default(true) bool activated,
    @Default(true) bool newUser,
    @Default(false) bool verifiedEmail,
    @Default(false) bool verifiedCellphone,
    @Default(false) bool isSubscripted,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
