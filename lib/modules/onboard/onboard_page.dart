import 'package:app/components/base_page.dart';
import 'package:app/components/base_widget.dart';
import 'package:app/components/visual_display.dart';
import 'package:app/modules/onboard/onboard_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/custom_button.dart';

class OnboardPage extends BaseWidget<OnboardViewModel> {

  OnboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      padding: 0,
      showAppBar: false,
      body: SafeArea(
        child: Obx(() => Column(
          children: [
            space(0.01),
            VisualDisplay.progressBar(
                totalItems: viewModel.steps.length,
                index: viewModel.index
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomButton(
                title: 'AVANCAR',
                colorTitle: colors.background,
                colorButton: colors.primary,
                iconRight: true,
                onPress: (){
                  viewModel.setIndex(viewModel.index + 1);
                },
              ),
            ),
            space(0.05),
          ],
        )),
      ),
    );
  }
}
