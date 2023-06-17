import 'package:app/components/base_widget.dart';
import 'package:app/modules/onboard/controller/onboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../components/select_item/select_item.dart';

class StepGender extends BaseWidget<OnboardController> {
  StepGender({Key? key}) : super(key: key);

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
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Observer(builder: (_) => SelectItem(
            initialValue: controller.gender,
            items: [
              SelectItemMenu(
                  title: 'Feminino',
                  icon: text('👩', fontSize: 24)
              ),
              SelectItemMenu(
                  title: 'Masculino',
                  icon: text('👱‍♂️', fontSize: 24)
              ),
              SelectItemMenu(
                  title: 'Outro',
                  icon: text('👱‍️', fontSize: 24)
              ),
            ],
            onChange: (value) => controller.setGender(value.title),
          )),
        )
      ],
    );
  }
}
