import 'package:app/modules/home/binding/home_bindings.dart';
import 'package:get/get.dart';
import '../../food/binding/food_bindings.dart';
import '../../workout/binding/workout_bindings.dart';
import '../controller/nav_controller.dart';


class NavBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NavController());
    HomeBindings().dependencies();
    WorkoutBindings().dependencies();
    FoodBindings().dependencies();
  }
}