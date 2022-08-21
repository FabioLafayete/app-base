import 'package:app/components/base_widget.dart';
import 'package:app/modules/onboard/controller/onboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/select_item/select_item.dart';

class Step02Widget extends BaseWidget<OnboardController> {
  Step02Widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        space(0.05),
        text(
          'Qual o seu gênero?',
          fontSize: 25,
          color: colors.text,
          fontWeight: FontWeight.w700
        ),
        space(0.1),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(() => SelectItem(
            initialValue: controller.gender,
            items: [
              SelectItemMenu(
                  title: 'Masculino',
                  icon: text('👱‍♂️', fontSize: 18)
              ),
              SelectItemMenu(
                  title: 'Feminino',
                  icon: text('👩', fontSize: 18)
              ),
              SelectItemMenu(
                  title: 'Outro',
                  icon: text('👱‍️', fontSize: 18)
              ),
            ],
            onChange: (value) => controller.setGender(value?.title),
          )),
        )
      ],
    );
  }
}
