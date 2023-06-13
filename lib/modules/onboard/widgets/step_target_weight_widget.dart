import 'package:app/components/base_widget.dart';
import 'package:app/modules/onboard/controller/onboard_controller.dart';
import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:get/get.dart';

import '../../../components/select_item/select_item.dart';
import '../../../components/visual_display.dart';
import '../../../route/pages_name.dart';


class StepTargetWeightWidget extends BaseWidget<OnboardController> {
  StepTargetWeightWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        space(0.05),
        text(
          'Qual seu peso desejado?',
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
                  inputMask: [TextInputMask(mask: '999')],
                  onChanged: (value){
                    controller.setTargetWeight(double.parse(value));
                  },
                  onEditingComplete: (){
                    if(controller.enableButton){
                      router.pushReplacementNamed(PagesNames.home);
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