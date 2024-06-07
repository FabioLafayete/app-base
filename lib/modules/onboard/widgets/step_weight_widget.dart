import 'package:app/modules/onboard/controller/onboard_controller.dart';
import 'package:app/shared/widgets/base_widget.dart';
import 'package:app/shared/widgets/visual_display.dart';
import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';

class StepWeightWidget extends BaseState<OnboardController> {
  StepWeightWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        space(0.05),
        text(
          'Qual o seu peso atual?',
          fontSize: 25,
          color: colors.text,
          fontWeight: FontWeight.w700,
          textAlign: TextAlign.center
        ),
        space(0.1),
        IntrinsicWidth(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: VisualDisplay.textFieldClean(
                  hintText: '00',
                  colorHint: Colors.black.withOpacity(0.4),
                  colorCursor: Colors.black,
                  textInputType: TextInputType.number,
                  initialValue: user.weight?.toString(),
                  inputMask: [TextInputMask(mask: '999')],
                  onChanged: (value){
                    if(value.isNotEmpty){
                      controller.setPersonalWeight(int.parse(value));
                    } else {
                      controller.setPersonalWeight(null);
                    }
                  },
                  onEditingComplete: (){
                    if(controller.enableButton){
                      controller.onPressButton(context);
                    }
                  }
                ),
              ),
              space(0.03, width: true),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: text(
                    'kg',
                    fontSize: 25,
                    color: colors.text,
                    fontWeight: FontWeight.w700,
                    textAlign: TextAlign.center
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
