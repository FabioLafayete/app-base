import 'package:app/shared/widgets/base_widget.dart';
import 'package:flutter/material.dart';

class MyBackButton extends BaseWidget {
  MyBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: router.pop,
        child: Container(
          margin: const EdgeInsets.only(left: 10, top: 10),
          decoration: BoxDecoration(
              color: colors.text.withOpacity(0.7),
              borderRadius: BorderRadius.circular(10)
          ),
          padding: const EdgeInsets.only(
              left: 18, right: 8, top: 13, bottom: 13
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
