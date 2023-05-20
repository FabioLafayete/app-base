import 'package:app/components/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
    this.boldText = true,
    this.iconRight = false,
    this.loading = false,
    this.loadingColor
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
  final bool loading;
  final Color? loadingColor;
  final bool iconRight;


  @override
  Widget build(BuildContext context) {
    if(cleanButton){
      return Center(
        child: !loading ? TextButton(
            onPressed: onPress,
            style: ButtonStyle(
                overlayColor: MaterialStateColor.resolveWith((states) => Colors.transparent)
            ),
            child: text(
                title,
                color: colorTitle ?? colors.text,
                fontWeight: boldText ? FontWeight.w600 : FontWeight.normal,
                fontSize: sizeTitle
            )
        ) : Padding(
          padding: const EdgeInsets.only(top: 15),
          child: SpinKitThreeBounce(
            color: loadingColor ?? colors.background,
            size: 20,
          ),
        ),
      );
    }
    return SizedBox(
      width: width,
      height: heightButton ?? 50,
      child: ElevatedButton(
        onPressed: loading ? (){} : onPress,
        style: onPress != null ? enableButtonStyle() : disableButtonStyle(),
        child: !loading ? Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: double.infinity,
              //margin: const EdgeInsets.symmetric(horizontal: 40),
              child: text(
                title,
                color: colorTitle ?? colors.text,
                fontWeight: boldText ? FontWeight.bold : FontWeight.normal,
                fontSize: sizeTitle ?? 16,
                textAlign: TextAlign.center
              ),
            ),
            if(iconRight)
              Positioned(
                right: 0,
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: colorTitle ?? colors.text,
                  size: 20,
                ),
              )
          ],
        ) : Center(
          child: SpinKitThreeBounce(
            color: loadingColor ?? colors.background,
            size: 20,
          ),
        ),
      ),
    );
  }

  ButtonStyle enableButtonStyle(){
    return ButtonStyle(
        overlayColor: MaterialStateProperty.all<Color>(colors.primary.withOpacity(0.1)),
        backgroundColor: MaterialStateProperty.all<Color>(colorButton ?? colors.primary),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(1000.0),
                side: colorBorder != null ? BorderSide(color: colorBorder!) : BorderSide.none
            )
        )
    );
  }

  ButtonStyle disableButtonStyle(){
    return ButtonStyle(
        overlayColor: MaterialStateProperty.all<Color>(colors.primary.withOpacity(0.1)),
        backgroundColor: MaterialStateProperty.all<Color>(
            colorButton?.withOpacity(0.4) ?? colors.primary.withOpacity(0.4)
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(1000.0),
                side: colorBorder != null ? BorderSide(color: colorBorder!) : BorderSide.none
            )
        )
    );
  }

}
