import '../model/auth_model.dart';

abstract class LoginRepository {
  Future<void> postTokenEmail(String email);
  Future<AuthModel> postLogin(String email, String token);
}