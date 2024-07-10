import 'package:app/modules/onboard/controller/onboard_controller.dart';
import 'package:app/shared/widgets/base_widget.dart';
import 'package:app/shared/widgets/select_item/select_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class StepLimitationWidget extends BaseState<OnboardController> {
  StepLimitationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        space(0.05),
        text(
          local.tr['onboarding']['stepLimitation']['title'],
          fontSize: 25,
          color: colors.text,
          fontWeight: FontWeight.w700,
          textAlign: TextAlign.center,
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Observer(
            builder: (_) {
              return SelectItem(
                initialValue: controller.limitation,
                items: [
                  SelectItemMenu(
                      title: local.tr['onboarding']['stepLimitation']['none'],
                      enumItem: LimitationEnum.none.name,
                      icon: text('🙅‍♀️', fontSize: 24)),
                  SelectItemMenu(
                      title: local.tr['onboarding']['stepLimitation']['limitation01'],
                      enumItem: LimitationEnum.backPains.name,
                      icon: text('🚶‍♀️', fontSize: 24)),
                  SelectItemMenu(
                      title: local.tr['onboarding']['stepLimitation']['limitation02'],
                      enumItem: LimitationEnum.kneePain.name,
                      icon: text('🦵', fontSize: 24)),
                  SelectItemMenu(
                      title: local.tr['onboarding']['stepLimitation']['limitation03'],
                      enumItem: LimitationEnum.reducedMobility.name,
                      icon: text('👩‍🦽', fontSize: 24)),
                  SelectItemMenu(
                      title: local.tr['onboarding']['stepLimitation']['limitation04'],
                      enumItem: LimitationEnum.other.name,
                      icon: text('🤷‍♀️', fontSize: 24)),
                ],
                onChange: (value) => controller.setLimitation(value.enumItem),
              );
            },
          ),
        ),
      ],
    );
  }
}

enum LimitationEnum {
  none,
  backPains,
  kneePain,
  reducedMobility,
  other,
}
