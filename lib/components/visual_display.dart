import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../util/colors.dart';

class VisualDisplay {

  static bottomSheet(Widget child, {
    bool dismissible = true,
    double? height,
    Duration? exitBottomSheetDuration,
    Duration? enterBottomSheetDuration,
    Function()? onClose
  }){
    Get.bottomSheet(
      GestureDetector(
        onTap: () => Get.focusScope?.unfocus(),
        child: SingleChildScrollView(
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
                    //height: height ?? Get.height * 0.5,
                    height: height != null ? Get.height * 0.5 : Get.height * 0.8,
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
        ),
      ),
      ignoreSafeArea: true,
      isScrollControlled: true,
      isDismissible: dismissible,
      enableDrag: false,
      exitBottomSheetDuration: exitBottomSheetDuration,
      enterBottomSheetDuration: enterBottomSheetDuration,
    ).whenComplete((){
      if(onClose != null) onClose();
    });
  }

  static Widget textField({
    IconData? icon,
    String? labelText,
    String? errorText,
    bool? obscure,
    Function(String)? onChanged,
    Function()? onEditingComplete,
    TextInputType? textInputType,
    TextInputAction? textInputAction,
    List<TextInputFormatter>? inputMask,
    Color? colorLabel,
    Color? fillColor,
    Color? colorLabelFocus,
    Color? colorText,
    Color? colorIcon,
    Color? colorBorder,
    Color? colorBorderFocus,
    Color? colorCursor,
    bool? enabled,
    Widget? prefix,
    Widget? suffix,
    TextEditingController? controller
  }){
    return Material(
      elevation: 5,
      shadowColor: Colors.black38,
      borderRadius: BorderRadius.circular(15),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        style: TextStyle(
            color: colorText ?? AppColors().text,
            fontSize: 18,
            fontWeight: FontWeight.w400
        ),
        obscureText: obscure ?? false,
        enabled: enabled,
        keyboardType: textInputType,
        textInputAction: textInputAction,
        cursorColor: colorCursor,
        onEditingComplete: onEditingComplete,
        inputFormatters: inputMask,
        decoration: InputDecoration(
          errorText: errorText,
          prefixIcon: prefix,
          suffixIcon: suffix,
          alignLabelWithHint: true,
          filled: fillColor != null ? true : false,
          fillColor: fillColor,
          contentPadding: const EdgeInsets.all(20).copyWith(left: 10),
          icon: icon != null ? Icon(icon, color: colorIcon) : null,
          labelText: labelText,
          labelStyle: TextStyle(
              color: colorLabel,
              fontSize: 16,
              fontWeight: FontWeight.w400
          ),
          floatingLabelStyle: colorLabelFocus != null ?
          TextStyle(color: colorLabelFocus, fontSize: 16) : null,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: (colorBorderFocus ?? colorBorder) ?? AppColors().secondary, width: 2),
              borderRadius: BorderRadius.circular(15),
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: colorBorder ?? AppColors().secondary, width: 2),
              borderRadius: BorderRadius.circular(15),
          )
        ),
      ),
    );
  }

  static Widget textFieldPin({
    Function(String)? onChanged,
    FocusNode? focusNode,
    TextEditingController? controller,
    String? listenText = ''
  }) {
    double width = Get.width;
    double height = Get.height;
    return Container(
      width: width * 0.16,
      height: height * 0.07,
      decoration: BoxDecoration(
        color: AppColors().background,
        borderRadius: BorderRadius.circular(width * 0.03),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 2,
            offset: Offset(1.5, 2.5),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        textAlignVertical: TextAlignVertical.center,
        textAlign: TextAlign.center,
        cursorColor: AppColors().text,
        style: TextStyle(
            color: AppColors().primary,
            fontSize: 24,
            fontWeight: FontWeight.w700
        ),
        expands: true,
        maxLines: null,
        minLines: null,
        decoration: InputDecoration(
          filled: false,
          fillColor: AppColors().primary.withOpacity(0.05),
          isCollapsed: true,
          contentPadding: const EdgeInsets.all(6),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(width * 0.03),
            ),
            borderSide: BorderSide(
              width: 2,
              color: AppColors().primary.withOpacity(0.9),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(width * 0.03),
            ),
            borderSide: BorderSide(
              width: 2,
              color: listenText!.isNotEmpty ?
              AppColors().primary.withOpacity(0.9) :
              AppColors().primary.withOpacity(0.7),
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(width * 0.03),
            ),
            borderSide: BorderSide(
              width: 2,
              color: AppColors().error,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(4),
            ),
            borderSide: BorderSide(
              width: 2,
              color: AppColors().error,
            ),
          ),
        ),
        onChanged: onChanged,
        focusNode: focusNode,
        inputFormatters: [TextInputMask(mask: ['9'])],
      ),
    );
  }

}