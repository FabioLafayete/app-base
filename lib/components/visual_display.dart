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
      elevation: 3,
      shadowColor: Colors.black38,
      borderRadius: BorderRadius.circular(15),
      child: TextField(
        controller: controller,
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

}