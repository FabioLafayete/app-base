import 'package:app/components/base_widget.dart';
import 'package:app/modules/onboard/controller/onboard_controller.dart';
import 'package:flutter/material.dart';

import '../../../components/visual_display.dart';

class Step01Widget extends BaseWidget<OnboardController> {
  Step01Widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        space(0.05),
        text(
          'Qual o seu nome?',
          fontSize: 25,
          color: colors.text,
          fontWeight: FontWeight.w700
        ),
        space(0.1),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: VisualDisplay.textField(
            labelText: 'Nome',
            initialValue: controller.name,
            fillColor: Colors.white,
            colorBorder: Colors.white,
            colorCursor: colors.secondary,
            colorBorderFocus: colors.secondary.withOpacity(0.7),
            colorLabel: colors.textSecondary,
            colorLabelFocus: colors.textSecondary,
            onChanged: controller.setName
          ),
        )
      ],
    );
  }
}
