import 'package:app/shared/widgets/base_widget.dart';
import 'package:flutter/material.dart';

class MyBackButton extends BaseWidget {
  MyBackButton({
    super.key,
    this.onPress,
    this.closeIcon = false,
  });

  final Function()? onPress;
  final bool closeIcon;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: onPress ?? router.pop,
        behavior: HitTestBehavior.translucent,
        child: Container(
          margin: const EdgeInsets.only(left: 15, top: 10),
          decoration: BoxDecoration(
              color: colors.text.withOpacity(0.6),
              borderRadius: BorderRadius.circular(10)
          ),
          padding: closeIcon ? const EdgeInsets.all(12) :
          const EdgeInsets.only(
              left: 18, right: 8, top: 13, bottom: 13
          ),
          child: Icon(
              closeIcon ? Icons.close : Icons.arrow_back_ios,
              color: colors.background
          ),
        ),
      ),
    );
  }


}
