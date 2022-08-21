import 'package:flutter/material.dart';
import 'package:get/get.dart';


class OnboardController extends GetxController {

  final RxInt _index = RxInt(0);
  final Rxn<String> _name = Rxn();

  int get index => _index.value;
  String? get name => _name.value;

  PageController pageController = PageController();

  setName(String? value) => _name.value = value;

  setIndex(int value) {
    _index.value = value;
    pageController.animateToPage(
        value,
        curve: Curves.decelerate,
        duration: const Duration(milliseconds: 300)
    );
  }

}