abstract class LoginRepository {
  Future<void> postTokenEmail(String email);
  Future<Map<String, dynamic>> postLogin(String email, String token);
}