import '../../service/login_service.dart';
import '../login_repository.dart';

class LoginRepositoryImpl extends LoginRepository{

  LoginRepositoryImpl(this.loginService);

  final LoginService loginService;

  @override
  Future<void> postTokenEmail(String email) => loginService.postTokenEmail(email);

  @override
  Future<Map<String, dynamic>> postLogin(String email, String token) async {
    final data = await loginService.postLogin(email, token);
    return data.data;
  }

}