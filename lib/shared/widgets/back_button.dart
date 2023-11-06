import 'package:app/shared/widgets/base_widget.dart';
import 'package:flutter/material.dart';

class MyBackButton extends BaseWidget {
  MyBackButton({super.key, this.onPress});

  final Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: onPress ?? router.pop,
        child: Container(
          margin: const EdgeInsets.only(left: 10, top: 10),
          decoration: BoxDecoration(
              color: colors.text.withOpacity(0.6),
              borderRadius: BorderRadius.circular(10)
          ),
          padding: const EdgeInsets.only(
              left: 15, right: 5, top: 10, bottom: 10
          ),
          child: Icon(
              Icons.arrow_back_ios,
              color: colors.background
          ),
        ),
      ),
    );
  }


}
