import 'package:app/modules/onboard/controller/onboard_controller.dart';
import 'package:app/shared/widgets/base_widget.dart';
import 'package:app/shared/widgets/select_item/select_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class StepTargetWidget extends BaseState<OnboardController> {
  StepTargetWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        space(0.05),
        text(
            local.tr['onboarding']['stepTarget']['title'],
          fontSize: 25,
          color: colors.text,
          fontWeight: FontWeight.w700,
          textAlign: TextAlign.center
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(8.0).copyWith(
              bottom: height * 0.05
          ),
          child: Observer(builder: (_) => SelectItem(
            initialValue: controller.target,
            items: [
              SelectItemMenu(
                  title: local.tr['onboarding']['stepTarget']['target01'],
                  enumItem: TargetEnum.loseWeight.name,
                  icon: text('🏋️‍♀️', fontSize: 24)
              ),
              SelectItemMenu(
                  title: local.tr['onboarding']['stepTarget']['target02'],
                  enumItem: TargetEnum.gainMuscularMass.name,
                  icon: text('💪️', fontSize: 24)
              ),
              SelectItemMenu(
                  title: local.tr['onboarding']['stepTarget']['target03'],
                  enumItem: TargetEnum.defineMaintainWeight.name,
                  icon: text('🏃‍♀️', fontSize: 24)
              ),
            ],
            onChange: (value) => controller.setTarget(value.enumItem),
          )),
        )
      ],
    );
  }
}

enum TargetEnum {
  loseWeight,
  gainMuscularMass,
  defineMaintainWeight,
}

