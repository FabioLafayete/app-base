import 'package:get/get.dart';

abstract class BaseViewModel<T extends GetxController> extends GetxController {

  BaseViewModel({
    this.hasController = true
  });

  T? controller;
  bool hasController;


  @override
  void onInit() {
    super.onInit();
    if (hasController) controller = Get.find<T>();
  }

}