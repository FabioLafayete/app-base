import 'package:app/components/base_page.dart';
import 'package:app/components/base_widget.dart';
import 'package:app/components/visual_display.dart';
import 'package:app/modules/onboard/controller/onboard_controller.dart';
import 'package:app/modules/onboard/widgets/step_name_widget.dart';
import 'package:app/route/pages_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../components/custom_button.dart';
import '../widgets/step_gender_widget.dart';
import '../widgets/step_target_widget.dart';
import '../widgets/step_birthday_widget.dart';
import '../widgets/step_limitation_widget.dart';
import '../widgets/step_weight_widget.dart';
import '../widgets/step_height_widget.dart';
import '../widgets/step_target_weight_widget.dart';

class OnboardPage extends BaseWidget<OnboardController> {

  OnboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<Widget> _items = [
      StepName(),
      StepBirthdayWidget(),
      StepGender(),
      StepLimitationWidget(),
      StepHeightWidget(),
      StepTargetWidget(),
      StepWeightWidget(),
      StepTargetWeightWidget(),
    ];

    final EdgeInsets padding = MediaQuery.of(context).padding;
    return BasePage(
      paddingPage: 0,
      showAppBar: false,
      body: SafeArea(
        child: Observer(builder: (_) => SingleChildScrollView(
          child: SizedBox(
            height: height - (padding.bottom + padding.top),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                space(0.01),
                VisualDisplay.progressBar(
                    totalItems: _items.length,
                    index: controller.index
                ),
                Container(
                  height: height * 0.07,
                  alignment: Alignment.bottomLeft,
                  child: Visibility(
                    visible: controller.index > 0,
                    child: IconButton(
                        onPressed: (){
                          controller.setIndex(controller.index - 1);
                        },
                        icon: const Icon(Icons.arrow_back_ios_new_outlined)
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.7,
                  child: PageView.builder(
                    controller: controller.pageController,
                    itemCount: _items.length,
                    itemBuilder: (_, index) =>
                        Padding(
                          padding: const EdgeInsets.all(16).copyWith(top: 0),
                          child: _items[index]
                        ),
                    onPageChanged: controller.setIndex,
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Observer(builder: (_) => CustomButton(
                    title: controller.index + 1 == _items.length ? 'FINALIZAR' : "AVANÇAR",
                    colorTitle: colors.background,
                    colorButton: colors.primary,
                    iconRight: true,
                    onPress: controller.enableButton ? controller.onPressButton : null,
                  )),
                ),
                space(0.01),
              ],
            ),
          ),
        )),
      ),
    );
  }



}
