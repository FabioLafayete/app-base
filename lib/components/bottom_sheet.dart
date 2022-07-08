import 'package:app/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomSheet {
  static show(Widget child, {
    bool dismissible = true,
    double? height,
    Duration? exitBottomSheetDuration,
    Duration? enterBottomSheetDuration,
    Function()? onClose
  }){
    Get.bottomSheet(
      Container(
        height: height ?? Get.height * 0.5,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors().background,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Get.width * 0.08),
            topRight: Radius.circular(Get.width * 0.08),
          )
        ),
        child: child,
      ),
      ignoreSafeArea: true,
      isScrollControlled: true,
      isDismissible: dismissible,
      enableDrag: dismissible,
      exitBottomSheetDuration: exitBottomSheetDuration,
      enterBottomSheetDuration: enterBottomSheetDuration,
    ).whenComplete(() => onClose);
  }
}