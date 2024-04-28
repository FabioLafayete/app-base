import 'package:dio/dio.dart';

abstract class LoginService {
  Future<Response> postTokenEmail(String email);
  Future<Response> postLogin(String email, String token);
}