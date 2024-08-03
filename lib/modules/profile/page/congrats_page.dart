import 'package:app/route/pages_name.dart';
import 'package:app/shared/widgets/base_page.dart';
import 'package:app/shared/widgets/base_widget.dart';
import 'package:app/shared/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CongratsPage extends StatefulWidget {
  const CongratsPage({super.key});

  @override
  State<CongratsPage> createState() => _CongratsPageState();
}

class _CongratsPageState extends State<CongratsPage> with ViewMixin {

  late dynamic tr;

  @override
  Widget build(BuildContext context) {
    tr = local.tr['profile']['talkToUsData']['messageSent'];
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
                  tr['messageSent'],
                  color: colors.text2,
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.center
                ),
                const SizedBox(height: 40),
                text(
                    tr['description'],
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
                title: tr['finish'],
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
