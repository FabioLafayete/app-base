import 'package:app/route/pages_name.dart';
import 'package:app/shared/constants/images_contants.dart';
import 'package:app/shared/widgets/base_page.dart';
import 'package:app/shared/widgets/base_widget.dart';
import 'package:app/shared/widgets/my_button.dart';
import 'package:flutter/material.dart';

class CongratsPage extends BaseState {
  CongratsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      showAppBar: false,
      paddingPage: 0,
      body: Container(
        width: width,
        padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 24
        ),
        color: colors.primary.withOpacity(0.95),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox.shrink(),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  width: width * 0.6,
                  height: width * 0.6,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(1000),
                  ),
                  child: Image.asset(ImagesConstants.aplaudir),
                ),
                const SizedBox(height: 30),
                text(
                  local.tr['workout']['congratsPage']['title'],
                  color: colors.text2,
                  fontSize: 30,
                  fontWeight: FontWeight.w500
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: MyButton(
                title: local.tr['workout']['congratsPage']['button'],
                colorButton: colors.text2,
                colorTitle: colors.primary,
                onPress: (){
                  router.pushReplacementNamed(PagesNames.home);
                },
              ),
            ),
            const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
