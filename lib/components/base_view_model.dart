import 'package:get/get.dart';

abstract class BaseViewModel<T extends GetxController> extends GetxController {

  BaseViewModel({
    this.hasController = true
  });

  T? controller;
  bool hasController;

  final RxBool _isLoading = RxBool(false);

  bool get isLoading => _isLoading.value;

  setIsLoading(bool value) => _isLoading.value = value;

  @override
  void onInit() {
    super.onInit();
    if (hasController) controller = Get.find<T>();
  }

}