import 'package:flutter/material.dart';
import 'package:get/get.dart';


class WorkoutController extends GetxController with StateMixin {

  WorkoutController() : super() {
    change(null, status: RxStatus.success());
  }


}