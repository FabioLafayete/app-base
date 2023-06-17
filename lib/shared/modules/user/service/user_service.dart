import 'dart:io';

import 'package:app/shared/model/user/user_model.dart';
import 'package:dio/dio.dart';

abstract class UserService {
  Future<Response> updateUser(UserModel user);
  Future<Response> getUser();
  Future<Response> deletePhoto();
  Future<Response> addPhoto(File file);
}