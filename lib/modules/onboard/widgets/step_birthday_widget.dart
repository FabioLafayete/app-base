import 'package:app/config/app_local.dart';
import 'package:app/modules/onboard/controller/onboard_controller.dart';
import 'package:app/shared/widgets/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class StepBirthdayWidget extends BaseState<OnboardController> {
  StepBirthdayWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        space(0.05),
        text(
          local.tr['onboarding']['stepBirthday']['title'],
          fontSize: 25,
          color: colors.text,
          fontWeight: FontWeight.w700,
          textAlign: TextAlign.center,
        ),
        space(0.2),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Observer(
            builder: (_) => DatePickerWidget(
              dateFormat: 'dd/MMMM/yyyy',
              firstDate: DateTime(1900),
              initialDate: controller.birthday ??
                  DateTime(
                    now.year - 35,
                    now.month,
                    now.day,
                  ),
              lastDate: now,
              locale: local.local.value == LanguageLocal.pt
                  ? DateTimePickerLocale.pt_br
                  : DateTimePickerLocale.en_us,
              pickerTheme: DateTimePickerTheme(
                backgroundColor: colors.background,
                dividerColor: colors.primary,
              ),
              onChange: (value, _) {
                controller.setBirthday(value);
              },
            ),
          ),
        ),
      ],
    );
  }
}
