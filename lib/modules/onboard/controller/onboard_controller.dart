import 'package:app/shared/widgets/base_controller.dart';
import 'package:app/route/pages_name.dart';
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
  int? personalWeight;
  @observable
  int? targetWeight;

  late PageController pageController;

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
  setPersonalWeight(int? value) => personalWeight = value;
  @action
  setTargetWeight(int? value) => targetWeight = value;

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
      if(personalHeight == null ||
          (personalHeight! < 100 || personalHeight! > 300) ) return false;
    } else if(index == 5) {
      if(target == null) return false;
    } else if(index == 6) {
      if(personalWeight == null ||
          (personalWeight! < 30 || personalWeight! > 300)) return false;
    } else if(index == 7) {
      if(targetWeight == null ||
          (targetWeight! < 40 || targetWeight! > 180)) return false;
    }
    return true;
  }

  _init(){
    if(user.name != null) setName(user.name);
    if(user.gender != null) setGender(user.gender);
    if(user.age != null) setBirthday(user.age);
    if(user.gender != null) setGender(user.gender);
    if(user.limitation != null) setLimitation(user.limitation);
    if(user.height != null) setPersonalHeight(user.height);
    if(user.target != null) setTarget(user.target);
    if(user.weight != null) setPersonalWeight(user.weight);
    if(user.targetWeight != null) setTargetWeight(user.weight);

    if(user.targetWeight != null) {
      index = 7;
      pageController = PageController(initialPage: 7);
    } else if (user.weight != null) {
      index = 7;
      pageController = PageController(initialPage: 7);
    } else if (user.target != null) {
      index = 6;
      pageController = PageController(initialPage: 6);
    } else if (user.height != null) {
      index = 5;
      pageController = PageController(initialPage: 5);
    } else if (user.limitation != null) {
      index = 4;
      pageController = PageController(initialPage: 4);
    } else if (user.gender != null) {
      index = 3;
      pageController = PageController(initialPage: 3);
    } else if (user.age != null) {
      index = 2;
      pageController = PageController(initialPage: 2);
    } else if (user.name != null) {
      index = 1;
      pageController = PageController(initialPage: 1);
    } else {
      pageController = PageController();
    }
  }

  void onPressButton(BuildContext context){
    try{
      FocusScope.of(context).unfocus();
      if(index == 0){
        addName();
      } else if (index == 1){
        addBirthday();
      } else if (index == 2){
        addGender();
      } else if (index == 3){
        addLimitation();
      } else if (index == 4){
        addHeight();
      } else if (index == 5){
        addTarget();
      } else if (index == 6){
        addWeight();
      } else if (index == 7){
        addTargetWeight();
        router.pushReplacementNamed(PagesNames.home);
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

  Future<void> addGender() async {
    try{
      if(user.gender != null && user.gender == gender) return;
      await setGenderProfile(gender);
      updateUser(user);
    }catch(_){
      print(_);
    }
  }

  Future<void> addLimitation() async {
    try{
      if(user.limitation != null && user.limitation == limitation) return;
      await setLimitationProfile(limitation);
      updateUser(user);
    }catch(_){
      print(_);
    }
  }

  Future<void> addHeight() async {
    try{
      if(user.height != null && user.height == personalHeight) return;
      await setHeightProfile(personalHeight);
      updateUser(user);
    }catch(_){
      print(_);
    }
  }

  Future<void> addTarget() async {
    try{
      if(user.target != null && user.target == target) return;
      await setTargetProfile(target);
      updateUser(user);
    }catch(_){
      print(_);
    }
  }

  Future<void> addWeight() async {
    try{
      if(user.weight != null && user.weight == personalWeight) return;
      await setWeightProfile(personalWeight);
      updateUser(user);
    }catch(_){
      print(_);
    }
  }

  Future<void> addTargetWeight() async {
    try{
      if(user.targetWeight != null && user.targetWeight == targetWeight) return;
      await setTargetWeightProfile(targetWeight);
      updateUser(user);
    }catch(_){
      print(_);
    }
  }
}