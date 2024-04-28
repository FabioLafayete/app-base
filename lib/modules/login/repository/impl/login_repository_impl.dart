import 'package:app/shared/model/auth_model/auth_model.dart';

import '../../service/login_service.dart';
import '../login_repository.dart';

class LoginRepositoryImpl extends LoginRepository{

  LoginRepositoryImpl(this.loginService);

  final LoginService loginService;

  @override
  Future<void> postTokenEmail(String email) => loginService.postTokenEmail(email);

  @override
  Future<AuthModel> postLogin(String email, String token) async {
    final data = await loginService.postLogin(email, token);
    return AuthModel.fromJson(data.data);
  }

}