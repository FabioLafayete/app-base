import 'package:app/components/base_page.dart';
import 'package:app/components/base_widget.dart';
import 'package:app/components/visual_display.dart';
import 'package:app/modules/home/page/home_page.dart';
import 'package:app/modules/onboard/controller/onboard_controller.dart';
import 'package:app/modules/onboard/widgets/step_01_widget.dart';
import 'package:app/route/pages_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../components/custom_button.dart';
import '../widgets/step_02_widget.dart';
import '../widgets/step_03_widget.dart';
import '../widgets/step_04_widget.dart';
import '../widgets/step_05_widget.dart';
import '../widgets/step_06_widget.dart';
import '../widgets/step_07_widget.dart';
import '../widgets/step_08_widget.dart';

class OnboardPage extends BaseWidget<OnboardController> {

  OnboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<Widget> _items = [
      Step01Widget(),
      Step02Widget(),
      Step03Widget(),
      Step04Widget(),
      Step05Widget(),
      Step06Widget(),
      Step07Widget(),
      Step08Widget(),
    ];


    return BasePage(
      padding: 0,
      showAppBar: false,
      body: SafeArea(
        child: Observer(builder: (_) => SingleChildScrollView(
          child: SizedBox(
            height: height * 0.9,
            child: Column(
              children: [
                space(0.01),
                VisualDisplay.progressBar(
                    totalItems: _items.length,
                    index: controller.index
                ),
                SizedBox(
                  height: height * 0.8,
                  child: PageView.builder(
                    controller: controller.pageController,
                    itemCount: _items.length,
                    itemBuilder: (_, index) =>
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: _items[index]
                        ),
                    onPageChanged: controller.setIndex,
                  ),
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
                      controller.setIndex(controller.index + 1);
                      if(controller.index == 8){
                        router.pushReplacementNamed(PagesNames.home);
                      }
                    },
                  ),
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
