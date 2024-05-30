import 'package:app/shared/model/auth_model/auth_model.dart';
import 'package:app/shared/model/login/login_model.dart';

import '../../service/login_service.dart';
import '../login_repository.dart';

class LoginRepositoryImpl extends LoginRepository{

  LoginRepositoryImpl(this.loginService);

  final LoginService loginService;

  @override
  Future<LoginModel> postTokenEmail(String email, {bool forceSendCode = false,}) async {
    final data = await loginService.postTokenEmail(email, forceSendCode: forceSendCode);
    return LoginModel.fromJson(data.data);
  }

  @override
  Future<AuthModel> postLogin(String email, {
    String? token,
    String? password,
  }) async {
    final data = await loginService.postLogin(email,
    token: token, password: password,
    );
    return AuthModel.fromJson(data.data);
  }

}