import 'package:app/modules/profile/controller/profile_controller.dart';
import 'package:app/route/pages_name.dart';
import 'package:app/shared/widgets/base_page.dart';
import 'package:app/shared/widgets/base_widget.dart';
import 'package:app/shared/widgets/my_button.dart';
import 'package:app/shared/widgets/visual_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:super_sliver_list/super_sliver_list.dart';

class HelpPage extends StatefulWidget {
  final bool isLoginRequest;

  const HelpPage({super.key, this.isLoginRequest = false});

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends ViewState<HelpPage, ProfileController> {
  late dynamic tr;

  @override
  Widget build(BuildContext context) {
    tr = local.tr['profile']['talkToUsData'];
    controller.clearHelpPage();
    return Observer(builder: (_) {
      if (controller.successPage) {
        return BasePage(
          showAppBar: false,
          paddingPage: 0,
          body: Container(
            width: width,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 24,
            ),
            color: colors.primary.withOpacity(0.95),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  width: width * 0.6,
                  height: width * 0.6,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(1000),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: SvgPicture.asset(
                      'assets/images/icon/svg/message-send.svg',
                      colorFilter: ColorFilter.mode(
                        colors.primary,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 70),
                text(
                  tr['messageSent']['title'],
                  color: colors.text2,
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
                const SizedBox(height: 90),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: MyButton(
                    title: tr['messageSent']['goBack'],
                    colorButton: colors.text2,
                    colorTitle: colors.primary,
                    onPress: () {
                      if (widget.isLoginRequest) {
                        router.pushReplacementNamed(PagesNames.login);
                      } else {
                        router.pop();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      }
      return BasePage(
        title: tr['appBar'],
        body: SuperListView(
          physics: const ClampingScrollPhysics(),
          children: [
            SizedBox(height: height * 0.03),
            text(
              tr['title'],
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: height * 0.02),
            text(
              tr['description'],
              fontSize: 18,
            ),
            const SizedBox(height: 30),
            if (widget.isLoginRequest) ...[
              text('E-mail *', fontWeight: FontWeight.w600),
              const SizedBox(height: 10),
              VisualDisplay.textField(
                hintText: 'Digite seu e-mail',
                fillColor: Colors.white,
                colorBorder: Colors.white,
                colorCursor: colors.secondary,
                colorBorderFocus: colors.secondary.withOpacity(0.7),
                colorLabel: colors.textSecondary,
                colorLabelFocus: colors.textSecondary,
                errorText: controller.errorEmail,
                onChanged: controller.setEmail,
              ),
              const SizedBox(height: 40),
            ],
            text(tr['subject'], fontWeight: FontWeight.w600),
            const SizedBox(height: 10),
            VisualDisplay.textField(
              hintText: tr['subjectHint'],
              fillColor: Colors.white,
              colorBorder: Colors.white,
              colorCursor: colors.secondary,
              colorBorderFocus: colors.secondary.withOpacity(0.7),
              colorLabel: colors.textSecondary,
              colorLabelFocus: colors.textSecondary,
              onChanged: controller.setTitleHelp,
              textInputAction: TextInputAction.next,
            ),
            SizedBox(height: height * 0.03),
            text(tr['reason'], fontWeight: FontWeight.w600),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () => _showOptions(context),
              child: Container(
                decoration: BoxDecoration(
                  color: colors.text2,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12.withOpacity(0.05),
                      blurRadius: 5,
                      spreadRadius: 0.1,
                      offset: const Offset(2, 2.5),
                    ),
                  ],
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Observer(builder: (_) {
                      return text(
                        controller.optionHelp ?? tr['reasonHint'],
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                      );
                    }),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: colors.primary,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: height * 0.03),
            text(tr['message'], fontWeight: FontWeight.w600),
            const SizedBox(height: 10),
            VisualDisplay.textField(
                hintText: tr['messageHint'],
                fillColor: Colors.white,
                colorBorder: Colors.white,
                colorCursor: colors.secondary,
                colorBorderFocus: colors.secondary.withOpacity(0.7),
                colorLabel: colors.textSecondary,
                colorLabelFocus: colors.textSecondary,
                textInputType: TextInputType.multiline,
                errorText: controller.errorPhone,
                maxLength: 240,
                minLines: 4,
                maxLines: 4,
                onChanged: controller.setMessageHelp,
                onEditingComplete: () {
                  FocusScope.of(context).unfocus();
                }),
            SizedBox(height: height * 0.03),
          ],
        ),
        bottomNavigationBar: Observer(builder: (_) {
          return Container(
            margin: EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: MediaQuery.of(context).viewInsets.bottom + 20,
            ),
            child: MyButton(
              onPress: controller.enableButtonSendHelp()
                  ? () {
                      controller.postSupport(context);
                    }
                  : null,
              colorTitle: colors.text2,
              loading: controller.loading,
              title: tr['sendMessage'],
            ),
          );
        }),
      );
    });
  }

  void _showOptions(BuildContext context) {
    VisualDisplay.bottomSheet(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          text(
            tr['whatReason']['title'],
            color: colors.text,
            fontSize: 26,
            fontWeight: FontWeight.w600,
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 50),
          ...List.generate(
            controller.listOptionsHelp(local.local.value).length,
            (index) {
              return GestureDetector(
                onTap: () {
                  controller.setOptionHelp(
                      controller.listOptionsHelp(local.local.value)[index]);
                  router.pop();
                },
                child: Container(
                  color: Colors.transparent,
                  margin: const EdgeInsets.only(bottom: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      text(
                        controller.listOptionsHelp(local.local.value)[index],
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                      const SizedBox(height: 10),
                      const Divider(),
                    ],
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
      hasHeight: false,
      dismissible: true,
      context: context,
      onClose: () {},
    );
  }
}
