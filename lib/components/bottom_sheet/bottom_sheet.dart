import 'package:app/components/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../util/colors.dart';
import 'botto_sheet_view_model.dart';

class CustomBottomSheet extends BaseWidget<BottomSheetViewModel> {

  CustomBottomSheet({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.focusScope?.unfocus(),
      child: Obx(() => SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 5,
              width: Get.width * 0.2,
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: AppColors().background.withOpacity(0.8)
              ),
            ),
            Stack(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: height * controller.heightBottomSheet,
                  padding: const EdgeInsets.all(16).copyWith(
                      top: 30
                  ),
                  decoration: BoxDecoration(
                      color: AppColors().background,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Get.width * 0.08),
                        topRight: Radius.circular(Get.width * 0.08),
                      )
                  ),
                  child: child,
                ),
                Positioned(
                  top: Get.height * 0.02,
                  right: Get.width * 0.04,
                  child: IconButton(
                    icon: const Icon(Icons.close),
                    color: AppColors().text,
                    iconSize: 25,
                    onPressed: () => Get.back(),
                  ),
                )
              ],
            ),
          ],
        ),
      )),
    );
  }
}

