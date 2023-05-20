import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';

part 'workout_controller.g.dart';

class WorkoutController = WorkoutControllerBase with _$WorkoutController;

abstract class WorkoutControllerBase with Store {

  WorkoutControllerBase() : super() {
    // change(null, status: RxStatus.success());
  }


}