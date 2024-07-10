import 'dart:io';

import 'package:app/shared/model/support/support_model.dart';
import 'package:app/shared/model/user/user_model.dart';
import 'package:dio/dio.dart';

abstract class UserService {
  Future<Response> updateUser(UserModel user);
  Future<Response> getUser();
  Future<Response> deletePhoto();
  Future<Response> addPhoto(File file);
  Future<Response> postSupport(SupportModel model);
  Future<Response> getProducts(String? country);
  Future<Response> postLog(Map<String, String> body);
  Future<Response> deleteAccount();
}