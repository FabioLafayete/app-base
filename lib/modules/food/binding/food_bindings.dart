import 'package:get/get.dart';
import '../controller/food_controller.dart';


class FoodBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(FoodController());
  }
}