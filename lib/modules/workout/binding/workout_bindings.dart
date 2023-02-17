import 'package:get/get.dart';

import '../controller/workout_controller.dart';

class WorkoutBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(WorkoutController());
  }

}