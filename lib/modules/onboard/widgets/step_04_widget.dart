import 'package:app/components/base_widget.dart';
import 'package:app/modules/onboard/controller/onboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:get/get.dart';


class Step04Widget extends BaseWidget<OnboardController> {
  Step04Widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _now = DateTime.now();
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
        space(0.2),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(() => DatePickerWidget(
            dateFormat: 'dd/MMMM/yyyy',
            firstDate: DateTime(1900),
            initialDate: controller.birthday ??
                DateTime(_now.year - 18, _now.month, _now.day),
            lastDate: _now,
            locale: DateTimePickerLocale.pt_br,
            pickerTheme: DateTimePickerTheme(
                backgroundColor: colors.background,
                dividerColor: colors.primary
            ),
            onChange: (value, _){
              controller.setBirthday(value);
            },
          )),
        )
      ],
    );
  }
}
