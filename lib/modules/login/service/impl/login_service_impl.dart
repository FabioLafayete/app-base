
import 'package:dio/dio.dart';

import '../../../../service/http/http_service.dart';
import '../../constants/login_constants.dart';
import '../login_service.dart';

class LoginServiceImpl implements LoginService {

  LoginServiceImpl(this._service);

  final HttpService _service;

  @override
  Future<Response> postTokenEmail(String email) {
    return _service.request(
      type: RequestType.POST,
      path: LoginConstants.postTokenEmail,
      dataRequest: {
        "email": email
      }
    );
  }

  @override
  Future<Response> postLogin(String email, String token) {
    return _service.request(
        type: RequestType.POST,
        path: LoginConstants.postLogin,
        dataRequest: {
          "email": email,
          "token": token
        }
    );
  }

}