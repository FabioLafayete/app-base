import 'package:app/components/base_widget.dart';
import 'package:app/modules/onboard/controller/onboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../components/select_item/select_item.dart';

class StepTargetWidget extends BaseWidget<OnboardController> {
  StepTargetWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        space(0.05),
        text(
          'Qual o seu principal objetivo?',
          fontSize: 25,
          color: colors.text,
          fontWeight: FontWeight.w700,
          textAlign: TextAlign.center
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Observer(builder: (_) => SelectItem(
            initialValue: controller.target,
            items: [
              SelectItemMenu(
                  title: 'Perder peso',
                  icon: text('🏋️‍♀️', fontSize: 24)
              ),
              SelectItemMenu(
                  title: 'Ganhar massa muscular',
                  icon: text('💪️', fontSize: 24)
              ),
              SelectItemMenu(
                  title: 'Definir e manter o peso',
                  icon: text('🏃‍♀️', fontSize: 24)
              ),
            ],
            onChange: (value) => controller.setTarget(value?.title),
          )),
        )
      ],
    );
  }
}
