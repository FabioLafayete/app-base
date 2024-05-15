import 'package:app/shared/constants/images_contants.dart';
import 'package:app/shared/widgets/base_page.dart';
import 'package:app/shared/widgets/base_widget.dart';
import 'package:app/shared/widgets/my_button.dart';
import 'package:flutter/material.dart';

class SubscriptionSuccessPage extends BaseWidget {
  SubscriptionSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      showAppBar: false,
      paddingPage: 0,
      body: Container(
        width: width,
        padding: const EdgeInsets.symmetric(
            horizontal: 20,
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
                  padding: const EdgeInsets.all(30),
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
                    'Parabéns 💪',
                    color: colors.text2,
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.center
                ),
                const SizedBox(height: 40),
                text(
                    'Agora você faz parte do nosso time, vamos nessa!!',
                    color: colors.text2,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.center
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: MyButton(
                title: 'FINALIZAR',
                colorButton: colors.text2,
                colorTitle: colors.primary,
                onPress: (){
                  router.pop();
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
