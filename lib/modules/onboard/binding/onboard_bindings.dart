import 'package:app/modules/onboard/controller/onboard_controller.dart';
import 'package:get/get.dart';

class OnboardBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(OnboardController());
  }

}