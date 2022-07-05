import 'package:app/modules/login/login_controller.dart';
import 'package:get/get.dart';

import 'login_view_model.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {

    Get.put(LoginController());
    Get.put(LoginViewModel());

  }
}