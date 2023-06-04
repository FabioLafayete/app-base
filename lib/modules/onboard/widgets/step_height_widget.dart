import 'package:app/components/base_widget.dart';
import 'package:app/modules/onboard/controller/onboard_controller.dart';
import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:get/get.dart';

import '../../../components/select_item/select_item.dart';
import '../../../components/visual_display.dart';


class StepHeightWidget extends BaseWidget<OnboardController> {
  StepHeightWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        space(0.05),
        text(
          'Qual sua altura?',
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
                  onChanged: (value) {
                    controller.setPersonalHeight(int.parse(value));
                  },
                  onEditingComplete: (){
                    if(controller.enableButton){
                      controller.setIndex(controller.index + 1);
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
