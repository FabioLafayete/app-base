import 'package:flutter/material.dart';

class BorderWidget extends StatelessWidget {
  const BorderWidget({
    super.key,
    required this.child,
    required this.backgroundColor,
    this.colorBorder,
    this.circularBorder,
    this.widthBorder,
    this.paddingDouble,
    this.padding,
    this.margin
  });

  final Widget child;
  final Color backgroundColor;
  final double? circularBorder;
  final Color? colorBorder;
  final double? widthBorder;
  final double? paddingDouble;
  final EdgeInsets? padding;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding ?? EdgeInsets.all(paddingDouble ?? 8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(circularBorder ?? 100),
        border: Border.all(
          color: colorBorder ?? Colors.white,
          width: widthBorder ?? 1
        )
      ),
      child: child,
    );
  }
}
