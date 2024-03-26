import 'package:app/modules/onboard/controller/onboard_controller.dart';
import 'package:app/shared/widgets/base_widget.dart';
import 'package:app/shared/widgets/visual_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class StepName extends BaseWidget<OnboardController> {
  StepName({Key? key}) : super(key: key);

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
            labelText: 'Nome e sobrenome',
            initialValue: controller.name,
            fillColor: Colors.white,
            colorBorder: Colors.white,
            colorCursor: colors.secondary,
            colorBorderFocus: colors.secondary.withOpacity(0.7),
            colorLabel: colors.textSecondary,
            colorLabelFocus: colors.textSecondary,
            textInputType: TextInputType.text,
            maxLines: 1,
            onEditingComplete: (){
              if(controller.enableButton){
                controller.onPressButton();
              }
            },
            onChanged: controller.setName
          ),
        )
      ],
    );
  }
}
