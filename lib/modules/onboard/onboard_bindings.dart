import 'package:app/modules/onboard/onboard_controller.dart';
import 'package:app/modules/onboard/onboard_view_model.dart';
import 'package:get/get.dart';

class OnboardBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(OnboardController());
    Get.put(OnboardViewModel());
  }

}