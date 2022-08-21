import 'package:flutter/material.dart';
import 'package:get/get.dart';


class OnboardController extends GetxController {

  final RxInt _index = RxInt(0);
  final Rxn<String> _name = Rxn();
  final Rxn<String> _gender = Rxn();

  int get index => _index.value;
  String? get name => _name.value;
  String? get gender => _gender.value;

  PageController pageController = PageController();

  setName(String? value) => _name.value = value;
  setGender(String? value) => _gender.value = value;

  setIndex(int value) {
    _index.value = value;
    pageController.animateToPage(
        value,
        curve: Curves.decelerate,
        duration: const Duration(milliseconds: 300)
    );
  }

}