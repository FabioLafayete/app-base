
import 'package:dio/dio.dart';

import '../../../../service/http/http_service.dart';
import '../../constants/login_constants.dart';
import '../login_service.dart';

class LoginServiceImpl implements LoginService {

  LoginServiceImpl(this._service);

  final HttpService _service;

  @override
  Future<Response> postTokenEmail(String email, {bool forceSendCode = false,}) {
    return _service.request(
      type: RequestType.POST,
      path: LoginConstants.postTokenEmail,
      dataRequest: {
        "email": email,
        if(forceSendCode)
          "forceSendCode": forceSendCode
      }
    );
  }

  @override
  Future<Response> postLogin(String email, {
    String? token,
    String? password,
  }) {
    return _service.request(
        type: RequestType.POST,
        path: LoginConstants.postLogin,
        dataRequest: {
          "email": email,
          if(token != null)
            "token": token,
          if(password != null)
            "password": password,
        }
    );
  }

}