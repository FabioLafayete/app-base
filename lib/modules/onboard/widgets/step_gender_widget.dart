import 'package:app/modules/onboard/controller/onboard_controller.dart';
import 'package:app/shared/widgets/base_widget.dart';
import 'package:app/shared/widgets/select_item/select_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class StepGender extends BaseState<OnboardController> {
  StepGender({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        space(0.05),
        text(
            local.tr['onboarding']['stepGender']['title'],
          fontSize: 25,
          color: colors.text,
          fontWeight: FontWeight.w700
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(8.0).copyWith(
            bottom: height * 0.05,
          ),
          child: Observer(builder: (_) => SelectItem(
            initialValue: controller.gender,
            items: [
              SelectItemMenu(
                  title: local.tr['onboarding']['stepGender']['feminine'],
                  enumItem: GenderEnum.feminine.name,
                  icon: text('👩', fontSize: 24)
              ),
              SelectItemMenu(
                  title: local.tr['onboarding']['stepGender']['masculine'],
                  enumItem: GenderEnum.masculine.name,
                  icon: text('👱‍♂️', fontSize: 24)
              ),
              SelectItemMenu(
                  title: local.tr['onboarding']['stepGender']['other'],
                  enumItem: GenderEnum.other.name,
                  icon: text('👱‍️', fontSize: 24)
              ),
            ],
            onChange: (value) => controller.setGender(value.enumItem),
          )),
        )
      ],
    );
  }
}

enum GenderEnum {
  feminine,
  masculine,
  other
}
