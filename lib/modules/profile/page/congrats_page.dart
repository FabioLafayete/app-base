import 'package:app/route/pages_name.dart';
import 'package:app/shared/constants/images_contants.dart';
import 'package:app/shared/widgets/base_page.dart';
import 'package:app/shared/widgets/base_widget.dart';
import 'package:app/shared/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CongratsPage extends BaseWidget {
  CongratsPage({super.key});

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
                  child: SvgPicture.asset(
                    'assets/images/icon/svg/message-send.svg',
                    colorFilter: ColorFilter.mode(colors.primary, BlendMode.srcIn),
                  ),
                ),
                const SizedBox(height: 30),
                text(
                  'Mensagem registrada com sucesso!',
                  color: colors.text2,
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.center
                ),
                const SizedBox(height: 40),
                text(
                    'Um e-mail foi enviado confirmando o recebimento!',
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
