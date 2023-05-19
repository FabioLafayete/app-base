import 'package:app/modules/login/controller/login_controller.dart';
import 'package:app/modules/login/repository/impl/login_repository_impl.dart';
import 'package:app/modules/login/service/impl/login_service_impl.dart';
import 'package:get/get.dart';

import '../../../service/http/http_service.dart';


class LoginBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController(
      repositoryImpl: LoginRepositoryImpl(
        LoginServiceImpl(HttpService())
      )
    ));
  }
}