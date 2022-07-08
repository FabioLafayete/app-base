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

  static Widget textField({
    IconData? icon,
    String? hint,
    String? errorText,
    bool? obscure,
    Function(String)? onChanged,
    Function()? onEditingComplete,
    TextInputType? textInputType,
    TextInputAction? textInputAction,
    List<TextInputFormatter>? inputMask,
    Color? colorHint,
    Color? colorText,
    Color? colorIcon,
    Color? colorBorder,
    Color? colorCursor,
    bool? enabled,
    Widget? prefix,
    Widget? suffix,
    TextEditingController? controller
  }){
    return TextField(
      controller: controller ?? null,
      onChanged: onChanged,
      style: TextStyle(color: colorText, fontSize: 20, fontWeight: FontWeight.w400),
      obscureText: obscure ?? false,
      enabled: enabled,
      keyboardType: textInputType,
      textInputAction: textInputAction,
      cursorColor: colorCursor,
      onEditingComplete: onEditingComplete,
      inputFormatters: inputMask,
      decoration: InputDecoration(
        errorText: errorText ?? null,
        prefixIcon: prefix,
        suffixIcon: suffix,
        alignLabelWithHint: true,
        contentPadding: EdgeInsets.only(right: 20, bottom: 10, top: 20),
        icon: icon != null ? Icon(icon, color: colorIcon) : null,
        labelText: hint,
        labelStyle: TextStyle(color: colorHint, fontSize: 18, fontWeight: FontWeight.w400),
        focusedBorder: colorBorder != null ? UnderlineInputBorder(
            borderSide: BorderSide(color: colorBorder)
        ) : null,
        enabledBorder: colorBorder != null ? UnderlineInputBorder(
            borderSide: BorderSide(color: colorBorder)
        ) : null,
      ),
    );
  }

}