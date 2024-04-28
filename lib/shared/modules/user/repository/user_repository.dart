import 'dart:io';

import 'package:app/shared/model/user/user_model.dart';

abstract class UserRepository {
  Future<UserModel> updateUser(UserModel user);
  Future<UserModel> getUser();
  Future<void> deletePhoto();
  Future<String> addPhoto(File file);
}