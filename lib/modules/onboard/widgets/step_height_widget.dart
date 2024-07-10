import 'package:app/modules/onboard/controller/onboard_controller.dart';
import 'package:app/shared/widgets/base_widget.dart';
import 'package:app/shared/widgets/visual_display.dart';
import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';

class StepHeightWidget extends BaseState<OnboardController> {
  StepHeightWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        space(0.05),
        text(
            local.tr['onboarding']['stepHeight']['title'],
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
                  hintText: '000',
                  colorHint: Colors.black.withOpacity(0.4),
                  colorCursor: Colors.black,
                  textInputType: TextInputType.number,
                  inputMask: [TextInputMask(mask: '999')],
                  initialValue: user.height?.toString(),
                  onChanged: (value) {
                    if(value.isNotEmpty) {
                      controller.setPersonalHeight(int.parse(value));
                    } else {
                      controller.setPersonalHeight(null);
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
                    'cm',
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
