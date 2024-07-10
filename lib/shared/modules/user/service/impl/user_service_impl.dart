
import 'dart:io';

import 'package:app/shared/model/support/support_model.dart';
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

  @override
  Future<Response> deletePhoto() {
    return _service.request(
      type: RequestType.PUT,
      path: UserConstants.deletePhoto,
      dataRequest: FormData()
    );
  }

  @override
  Future<Response> addPhoto(File file) async {
    FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(file.path, filename: file.path.split('/').last),
    });
    return _service.request(
      type: RequestType.PUT,
      path: UserConstants.addPhoto,
      dataRequest: formData
    );
  }

  @override
  Future<Response> postSupport(SupportModel model) async {
    return _service.request(
        type: RequestType.POST,
        path: UserConstants.postSupport,
        dataRequest: model.toJson()
    );
  }

  @override
  Future<Response> getProducts(String? country) async {
    return _service.request(
      type: RequestType.GET,
      path: UserConstants.getProducts,
      country: country,
    );
  }

  @override
  Future<Response> postLog(Map<String, String> body) async {
    return _service.request(
      type: RequestType.POST,
      path: UserConstants.postLog,
      dataRequest: body,
    );
  }
}