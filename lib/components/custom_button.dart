import 'package:app/components/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends BaseWidget {
  CustomButton({
    Key? key,
    required this.title,
    this.sizeTitle,
    this.heightButton,
    this.onPress,
    this.colorTitle,
    this.colorButton,
    this.colorBorder,
    this.cleanButton = false,
    this.boldText = true
  }) : super(key: key);

  final String title;
  final double? sizeTitle;
  final double? heightButton;
  final Function()? onPress;
  final Color? colorTitle;
  final Color? colorButton;
  final Color? colorBorder;
  final bool cleanButton;
  final bool boldText;


  @override
  Widget build(BuildContext context) {
    if(cleanButton){
      return SizedBox(
        width: width,
        child: TextButton(
            onPressed: onPress,
            child: text(
                title,
                color: colorTitle ?? colors.text,
                fontWeight: boldText ? FontWeight.w600 : FontWeight.normal,
                fontSize: sizeTitle
            )
        ),
      );
    }
    return SizedBox(
      width: width,
      height: heightButton ?? 50,
      child: ElevatedButton(
        onPressed: onPress,
        style: ButtonStyle(
            overlayColor: MaterialStateProperty.all<Color>(colors.primary.withOpacity(0.1)),
            backgroundColor: MaterialStateProperty.all<Color>(colorButton ?? colors.primary),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13.0),
                    side: BorderSide(color: colorBorder ?? colors.secondary)
                )
            )
        ),
        child: text(
            title,
            color: colorTitle ?? colors.text,
            fontWeight: boldText ? FontWeight.bold : FontWeight.normal,
            fontSize: sizeTitle
        ),
      ),
    );
  }
}
