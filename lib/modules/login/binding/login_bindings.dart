import 'package:app/modules/login/controller/login_controller.dart';
import 'package:get/get.dart';


class LoginBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}