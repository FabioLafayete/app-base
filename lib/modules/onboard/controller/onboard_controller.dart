import 'package:app/components/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'onboard_controller.g.dart';

class OnboardController = OnboardControllerBase with _$OnboardController;

abstract class OnboardControllerBase extends BaseController with Store {

  OnboardControllerBase(){
    _init();
  }

  @observable
  int index = 0;
  @observable
  String? name;
  @observable
  String? gender;
  @observable
  String? target;
  @observable
  DateTime? birthday;
  @observable
  String? limitation;
  @observable
  int? personalHeight;
  @observable
  double? personalWeight;
  @observable
  double? targetWeight;

  PageController pageController = PageController();

  @action
  setName(String? value) => name = value;
  @action
  setGender(String? value) => gender = value;
  @action
  setTarget(String? value) => target = value;
  @action
  setBirthday(DateTime? value) => birthday = value;
  @action
  setLimitation(String? value) => limitation = value;
  @action
  setPersonalHeight(int? value) => personalHeight = value;
  @action
  setPersonalWeight(double? value) => personalWeight = value;
  @action
  setTargetWeight(double? value) => targetWeight = value;

  @action
  setIndex(int value) {
    index = value;
    pageController.animateToPage(
        value,
        curve: Curves.decelerate,
        duration: const Duration(milliseconds: 300)
    );
  }

  @computed
  bool get enableButton {
    if(index == 0){
      return verifyName();
    } else if(index == 2){
      if(gender == null) return false;
    } else if(index == 3) {
      if(limitation == null) return false;
    } else if(index == 4) {
      if(personalHeight == null) return false;
    } else if(index == 5) {
      if(target == null) return false;
    } else if(index == 6) {
      if(personalWeight == null) return false;
    } else if(index == 7) {
      if(targetWeight == null) return false;
    }
    return true;
  }

  _init(){
    if(user.name != null) setName(user.name);
    if(user.gender != null) setGender(user.gender);
    if(user.age != null) setBirthday(user.age);
  }

  void onPressButton(){
    try{
      if(index == 0){
        addName();
      } else if (index == 1){
        addBirthday();
      } else if (index == 2){

      } else if (index == 3){

      } else if (index == 4){

      } else if (index == 5){

      } else if (index == 6){

      } else if (index == 7){

      }
      setIndex(index + 1);
    }catch(_){
      print(_);
    }
  }

  bool verifyName() {
    if (name == null) return false;
    if (!name!.trim().contains(' ')) return false;
    if (name!.trim().split(' ').toList().length < 2) return false;
    return true;
  }


  Future<void> addName() async {
    try{
      if(user.name != null && user.name == name) return;
      await setNameProfile(name);
      updateUser(user);
    }catch(_){
      print(_);
    }
  }

  Future<void> addBirthday() async {
    try{
      if(user.age != null && user.age == birthday) return;
      await setAgeProfile(birthday);
      updateUser(user);
    }catch(_){
      print(_);
    }
  }
}