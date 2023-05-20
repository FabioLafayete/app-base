import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';

part 'onboard_controller.g.dart';

class OnboardController = OnboardControllerBase with _$OnboardController;

abstract class OnboardControllerBase with Store {

  final RxInt _index = RxInt(0);
  final Rxn<String> _name = Rxn();
  final Rxn<String> _gender = Rxn();
  final Rxn<String> _target = Rxn();
  final Rxn<DateTime> _birthday = Rxn();

  int get index => _index.value;
  String? get name => _name.value;
  String? get gender => _gender.value;
  String? get target => _target.value;
  DateTime? get birthday => _birthday.value;

  PageController pageController = PageController();

  setName(String? value) => _name.value = value;
  setGender(String? value) => _gender.value = value;
  setTarget(String? value) => _target.value = value;
  setBirthday(DateTime? value) => _birthday.value = value;

  setIndex(int value) {
    _index.value = value;
    pageController.animateToPage(
        value,
        curve: Curves.decelerate,
        duration: const Duration(milliseconds: 300)
    );
  }

}