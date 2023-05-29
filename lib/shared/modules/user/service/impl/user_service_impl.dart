
import 'package:app/shared/model/user/user_model.dart';
import 'package:app/shared/modules/user/constants/user_constants.dart';
import 'package:dio/dio.dart';
import '../../../../../service/http/http_service.dart';
import '../user_service.dart';

class UserServiceImpl implements UserService {

  UserServiceImpl(this._service);

  final HttpService _service;

  @override
  Future<Response> updateUser(UserModel user) {
    print(user.toJson());
    return _service.request(
        type: RequestType.PUT,
        path: UserConstants.updateUser,
        dataRequest: user.toJson()
    );
  }

  @override
  Future<Response> getUser() {
    return _service.request(
        type: RequestType.GET,
        path: UserConstants.getUser,
    );
  }
}