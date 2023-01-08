import 'package:app/modules/onboard/controller/onboard_controller.dart';
import 'package:get/get.dart';

class OnboardBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(OnboardController());
  }

}