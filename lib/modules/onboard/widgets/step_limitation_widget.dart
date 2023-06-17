import 'package:app/components/base_widget.dart';
import 'package:app/modules/onboard/controller/onboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../components/select_item/select_item.dart';


class StepLimitationWidget extends BaseWidget<OnboardController> {
  StepLimitationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        space(0.05),
        text(
          'Tem alguma limitação física?',
          fontSize: 25,
          color: colors.text,
          fontWeight: FontWeight.w700,
          textAlign: TextAlign.center
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Observer(builder: (_) => SelectItem(
            initialValue: controller.limitation,
            items: [
              SelectItemMenu(
                  title: 'Nenhuma',
                  icon: text('🙅‍♀️', fontSize: 24)
              ),
              SelectItemMenu(
                  title: 'Dores nas costas',
                  icon: text('🚶‍♀️', fontSize: 24)
              ),
              SelectItemMenu(
                  title: 'Dores no joelho',
                  icon: text('🦵', fontSize: 24)
              ),
              SelectItemMenu(
                  title: 'Mobilidade resuzida (cadeira de rodas)',
                  icon: text('👩‍🦽', fontSize: 24)
              ),
              SelectItemMenu(
                  title: 'Outros',
                  icon: text('🤷‍♀️', fontSize: 24)
              ),
            ],
            onChange: (value) => controller.setLimitation(value?.title),
          )),
        )
      ],
    );
  }
}
