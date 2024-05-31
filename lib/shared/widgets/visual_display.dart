import 'package:app/util/colors.dart';
import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'bottom_sheet/bottom_sheet.dart';

class VisualDisplay {
  static bottomSheet(Widget child,
      {bool dismissible = true,
      bool hasHeight = true,
      Duration? exitBottomSheetDuration,
      Duration? enterBottomSheetDuration,
      Function()? onClose,
      required BuildContext context}) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return CustomBottomSheet(hasHeight: hasHeight, child: child);
      },
      elevation: 16,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      isDismissible: dismissible,
      enableDrag: dismissible,
    ).whenComplete(() {
      if (onClose != null) onClose();
    });
  }

  static Widget textField({
    Widget? icon,
    String? labelText,
    String? hintText,
    String? errorText,
    String? initialValue,
    bool? obscure,
    Function(String)? onChanged,
    Function()? onEditingComplete,
    TextInputType? textInputType,
    TextInputAction? textInputAction,
    List<TextInputFormatter>? inputMask,
    Color? colorLabel,
    Color? colorHint,
    Color? fillColor,
    Color? colorLabelFocus,
    Color? colorText,
    Color? colorBorder,
    Color? colorBorderFocus,
    Color? colorCursor,
    Color? shadowColor,
    bool readOnly = false,
    AutovalidateMode? autoValidateMode,
    String? Function(String?)? validator,
    Widget? prefix,
    Widget? suffix,
    TextEditingController? controller,
    int? helperMaxLines,
    int? maxLength,
    int? maxLines,
    int? minLines,
  }) {
    return Stack(
      children: [
        Container(
          height: 50,
          margin: const EdgeInsets.symmetric(horizontal: 4).copyWith(top: 9),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            boxShadow: [
              BoxShadow(
                color: shadowColor ?? Colors.black12,
                blurRadius: 5,
                spreadRadius: 3,
              ),
            ],
          ),
        ),
        TextFormField(
          controller: controller,
          initialValue: initialValue,
          onChanged: onChanged,
          style: TextStyle(
            color: colorText ?? AppColors().text,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
          obscureText: obscure ?? false,
          maxLength: maxLength,
          readOnly: readOnly,
          keyboardType: textInputType,
          autovalidateMode: autoValidateMode,
          textInputAction: textInputAction,
          cursorColor: colorCursor,
          onEditingComplete: onEditingComplete,
          inputFormatters: inputMask,
          validator: validator,
          autocorrect: false,
          maxLines: maxLines,
          minLines: minLines,
          decoration: InputDecoration(
            isDense: true,
            errorText: errorText,
            prefixIcon: prefix,
            suffixIcon: Padding(
              padding: const EdgeInsets.only(top: 15, right: 20),
              child: suffix,
            ),
            alignLabelWithHint: true,
            filled: fillColor != null ? true : false,
            fillColor: fillColor,
            contentPadding: const EdgeInsets.all(20).copyWith(left: 10),
            icon: icon,
            hintText: hintText,
            hintStyle: TextStyle(
              color: colorHint,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            labelText: labelText,
            labelStyle: TextStyle(
              color: colorLabel,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            helperMaxLines: helperMaxLines,
            hoverColor: Colors.transparent,
            floatingLabelStyle: colorLabelFocus != null
                ? TextStyle(
                    color: colorLabelFocus,
                    fontSize: 16,
                    fontWeight: FontWeight.w600)
                : null,
            errorStyle: TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColors().error,
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors().error, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors().error, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: !readOnly
                ? OutlineInputBorder(
                    borderSide: BorderSide(
                        color: (colorBorderFocus ?? colorBorder) ??
                            AppColors().secondary,
                        width: 2),
                    borderRadius: BorderRadius.circular(10),
                  )
                : OutlineInputBorder(
                    borderSide:
                        BorderSide(color: colorBorder ?? AppColors().secondary),
                    borderRadius: BorderRadius.circular(10),
                  ),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: colorBorder ?? AppColors().secondary),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }

  static Widget textFieldPin({
    required BuildContext context,
    Function(String)? onChanged,
    FocusNode? focusNode,
    TextEditingController? controller,
    String? listenText = '',
    bool errorText = false,
  }) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        textAlignVertical: TextAlignVertical.center,
        textAlign: TextAlign.center,
        cursorColor: AppColors().text,
        style: TextStyle(
            color: AppColors().text, fontSize: 24, fontWeight: FontWeight.w700,
        ),
        expands: true,
        maxLines: null,
        minLines: null,
        autocorrect: false,
        decoration: InputDecoration(
            filled: false,
            errorText: errorText ? ' ' : null,
            isCollapsed: false,
            isDense: true,
            contentPadding: const EdgeInsets.all(6),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(width * 0.03),
              borderSide: BorderSide(
                width: 2,
                color: AppColors().primary.withOpacity(0.9),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(width * 0.03),
              borderSide: BorderSide(
                width: 2,
                color: listenText!.isNotEmpty
                    ? AppColors().primary.withOpacity(0.9)
                    : Colors.grey.shade500,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(width * 0.03),
              borderSide: BorderSide(
                width: 2,
                color: AppColors().error,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(width * 0.03),
              borderSide: BorderSide(
                width: 2,
                color: AppColors().error,
              ),
            ),
            errorStyle: const TextStyle(fontSize: 0.01),
        ),
        onChanged: onChanged,
        focusNode: focusNode,
        inputFormatters: [
          TextInputMask(mask: ['9'])
        ],
      ),
    );
  }

  static Widget textFieldClean(
      {String? hintText,
      String? errorText,
      String? initialValue,
      bool? obscure,
      Function(String)? onChanged,
      Function()? onEditingComplete,
      TextInputType? textInputType,
      TextInputAction? textInputAction,
      List<TextInputFormatter>? inputMask,
      Color? colorHint,
      Color? fillColor,
      Color? colorText,
      Color? colorCursor,
      bool readOnly = false,
      AutovalidateMode? autoValidateMode,
      String? Function(String?)? validator,
      Widget? prefix,
      TextEditingController? controller,}) {
    return TextFormField(
      controller: controller,
      initialValue: initialValue,
      onChanged: onChanged,
      style: TextStyle(
          color: colorText ?? AppColors().text,
          fontSize: 64,
          fontWeight: FontWeight.w700),
      obscureText: obscure ?? false,
      readOnly: readOnly,
      keyboardType: textInputType,
      autovalidateMode: autoValidateMode,
      textInputAction: textInputAction,
      cursorColor: colorCursor,
      onEditingComplete: onEditingComplete,
      inputFormatters: inputMask,
      validator: validator,
      autocorrect: false,
      textAlign: TextAlign.start,
      decoration: InputDecoration(
          isDense: true,
          contentPadding: const EdgeInsets.only(bottom: 0),
          errorText: errorText,
          prefixIcon: prefix,
          alignLabelWithHint: true,
          filled: fillColor != null ? true : false,
          fillColor: fillColor,
          hintText: hintText,
          hintStyle: TextStyle(
              color: colorHint, fontSize: 64, fontWeight: FontWeight.w500),
          hoverColor: Colors.transparent,
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  style: BorderStyle.solid,
                  color: Colors.black.withOpacity(0.5))),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  style: BorderStyle.solid,
                  color: Colors.black.withOpacity(0.5)))),
    );
  }

  static Widget progressBar(BuildContext context, {
    required int totalItems,
    required int index,
  }) {
    return Container(
      height: 3,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: AppColors().primary.withOpacity(0.1),
      ),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        color: AppColors().primary,
        width: (MediaQuery.of(context).size.width * 0.55) * ((index == 0 ? 1 : index + 1) / totalItems),
      ),
    );
  }
}
