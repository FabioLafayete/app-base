import 'package:app/modules/onboard/controller/onboard_controller.dart';
import 'package:app/shared/widgets/base_widget.dart';
import 'package:app/shared/widgets/visual_display.dart';
import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import '../../../route/pages_name.dart';


class StepTargetWeightWidget extends BaseState<OnboardController> {
  StepTargetWeightWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        space(0.05),
        text(
            local.tr['onboarding']['stepTargetWeight']['title'],
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
                  initialValue: user.targetWeight?.toString(),
                  textInputType: TextInputType.number,
                  inputMask: [TextInputMask(mask: '999')],
                  onChanged: (value){
                    if(value.isNotEmpty){
                      controller.setTargetWeight(int.parse(value));
                    } else {
                      controller.setTargetWeight(null);
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
