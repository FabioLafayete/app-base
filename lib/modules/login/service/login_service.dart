import 'package:dio/dio.dart';

abstract class LoginService {
  Future<Response> postTokenEmail(String email, {bool forceSendCode = false,});
  Future<Response> postLogin(String email, {
    String? token,
    String? password,
  });
}