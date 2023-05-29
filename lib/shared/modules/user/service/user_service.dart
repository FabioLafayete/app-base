import 'package:app/shared/model/user/user_model.dart';
import 'package:dio/dio.dart';

abstract class UserService {
  Future<Response> updateUser(UserModel user);
  Future<Response> getUser();
}