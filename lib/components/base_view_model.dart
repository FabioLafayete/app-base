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
    if (this.hasController && T != null) controller = Get.find<T>();
  }

}