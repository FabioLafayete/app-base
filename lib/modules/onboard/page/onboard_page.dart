import 'package:app/modules/onboard/controller/onboard_controller.dart';
import 'package:app/modules/onboard/widgets/step_name_widget.dart';
import 'package:app/shared/widgets/base_page.dart';
import 'package:app/shared/widgets/base_widget.dart';
import 'package:app/shared/widgets/my_button.dart';
import 'package:app/shared/widgets/visual_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:super_sliver_list/super_sliver_list.dart';
import '../widgets/step_gender_widget.dart';
import '../widgets/step_target_widget.dart';
import '../widgets/step_birthday_widget.dart';
import '../widgets/step_limitation_widget.dart';
import '../widgets/step_weight_widget.dart';
import '../widgets/step_height_widget.dart';
import '../widgets/step_target_weight_widget.dart';

class OnboardPage extends BaseState<OnboardController> {
  OnboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [
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
        child: Observer(
          builder: (_) => SizedBox(
            height: height - (padding.bottom + padding.top),
            child: SuperListView(
              children: [
                space(0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.bottomLeft,
                      margin: const EdgeInsets.only(left: 16),
                      child: Opacity(
                        opacity: controller.index > 0 ? 1 : 0,
                        child: GestureDetector(
                          onTap: () {
                            if (controller.index > 0) {
                              controller.setIndex(controller.index - 1);
                            }
                          },
                          child: const Icon(
                            Icons.arrow_back_ios_new_outlined,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.55,
                      child: VisualDisplay.progressBar(
                        context,
                        totalItems: items.length,
                        index: controller.index,
                      ),
                    ),
                    const SizedBox(width: 50)
                  ],
                ),
                SizedBox(
                  height: height * 0.8,
                  child: PageView.builder(
                    controller: controller.pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: items.length,
                    itemBuilder: (_, index) => Padding(
                      padding: const EdgeInsets.all(16).copyWith(top: 0),
                      child: items[index],
                    ),
                    onPageChanged: controller.setIndex,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Container(
        color: colors.background,
        padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(
          bottom: 40,
          top: 20,
        ),
        child: Observer(
          builder: (_) => MyButton(
            title:
                controller.index + 1 == items.length ?
                local.tr['onboarding']['buttonFinish'] :
                local.tr['onboarding']['buttonNext'],
            colorTitle: colors.background,
            colorButton: colors.primary,
            iconRight: true,
            onPress: controller.enableButton
                ? () => controller.onPressButton(context)
                : null,
          ),
        ),
      ),
    );
  }
}
