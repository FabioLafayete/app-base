import 'package:app/components/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'onboard_controller.dart';

class OnboardViewModel extends BaseViewModel<OnboardController> {

  final RxInt _index = RxInt(1);
  final RxList<Widget> _steps = RxList(List.generate(10, (index) => Container()).toList());

  int get index => _index.value;
  List<Widget> get steps => _steps;

  setIndex(int value) => _index.value = value;
  setSteps(List<Widget> value) => _steps.value = value;

}