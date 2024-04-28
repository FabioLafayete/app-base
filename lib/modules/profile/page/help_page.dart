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

class HelpPage extends BaseWidget<ProfileController> {

  final bool isLoginRequest;

  HelpPage({super.key, this.isLoginRequest = false});

  @override
  Widget build(BuildContext context) {
    controller.clearHelpPage();
    return Observer(builder: (_){
      if(controller.successPage){
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
                      'assets/images/icons/svg/message-send.svg',
                      colorFilter: ColorFilter.mode(colors.primary, BlendMode.srcIn),
                    ),
                  ),
                ),
                const SizedBox(height: 70),
                text(
                    'Mensagem enviada :)',
                    color: colors.text2,
                    fontSize: 30,
                    fontWeight: FontWeight.w500
                ),
                const SizedBox(height: 90),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: MyButton(
                    title: 'VOLTAR',
                    colorButton: colors.text2,
                    colorTitle: colors.primary,
                    onPress: (){
                      if(isLoginRequest){
                        router.pushReplacementNamed(PagesNames.login);
                      } else {
                        router.pop();
                      }
                    },
                  ),
                ),
                // const SizedBox.shrink(),
              ],
            ),
          ),
        );
      }
      return BasePage(
        title: 'Precisa de ajuda?',
        body: SuperListView(
          physics: const ClampingScrollPhysics(),
          children: [
            const SizedBox(height: 40),
            text(
              'Fale com a gente :)',
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(height: 20),
            text(
              'Você vai receber a resposta no e-mail que cadastrou aqui',
              fontSize: 18,
            ),
            const SizedBox(height: 30),
            if(isLoginRequest)
              ...[
                text('Email *', fontWeight: FontWeight.w600),
                const SizedBox(height: 10),
                VisualDisplay.textField(
                  hintText: 'Digite seu e-mail',
                  fillColor: Colors.white,
                  colorBorder: Colors.white,
                  colorCursor: colors.secondary,
                  colorBorderFocus: colors.secondary.withOpacity(0.7),
                  colorLabel: colors.textSecondary,
                  colorLabelFocus: colors.textSecondary,
                  textInputType: TextInputType.number,
                  errorText: controller.errorPhone,
                  onChanged: controller.setEmail,
                ),
                const SizedBox(height: 40),
            ],
            text('Assunto *', fontWeight: FontWeight.w600),
            const SizedBox(height: 10),
            VisualDisplay.textField(
              hintText: 'Digite o assunto da mensagem',
              fillColor: Colors.white,
              colorBorder: Colors.white,
              colorCursor: colors.secondary,
              colorBorderFocus: colors.secondary.withOpacity(0.7),
              colorLabel: colors.textSecondary,
              colorLabelFocus: colors.textSecondary,
              textInputType: TextInputType.number,
              errorText: controller.errorPhone,
              onChanged: controller.setTitleHelp,
            ),
            const SizedBox(height: 40),
            text('Motivo do contato *', fontWeight: FontWeight.w600),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                _showOptions(context);
              },
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
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Observer(builder: (_) {
                      return text(
                          controller.optionHelp ?? 'Escolha o motivo do contato',
                          fontSize: 18,
                          fontWeight: FontWeight.w500);
                    }),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: colors.primary,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
            text('Mensagem *', fontWeight: FontWeight.w600),
            const SizedBox(height: 10),
            VisualDisplay.textField(
              hintText: 'Digite sua mensagem',
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
            ),
            const SizedBox(height: 50),
            Observer(builder: (_) {
              return MyButton(
                onPress: controller.enableButtonSendHelp() ? () {} : null,
                colorTitle: colors.text2,
                title: 'Enviar mensagem',
              );
            }),
            const SizedBox(height: 60),
          ],
        ),
      );
    });
  }

  void _showOptions(BuildContext context) {
    VisualDisplay.bottomSheet(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            text('Qual é o motivo?',
                color: colors.text,
                fontSize: 26,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.start),
            const SizedBox(height: 50),
            ...List.generate(controller.listOptionsHelp.length, (index) {
              return GestureDetector(
                onTap: () {
                  controller.setOptionHelp(controller.listOptionsHelp[index]);
                  router.pop();
                },
                child: Container(
                  color: Colors.transparent,
                  margin: const EdgeInsets.only(bottom: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      text(controller.listOptionsHelp[index],
                          fontWeight: FontWeight.w600, fontSize: 18),
                      const SizedBox(height: 10),
                      const Divider(),
                    ],
                  ),
                ),
              );
            }),
            const SizedBox(height: 20),
          ],
        ),
        hasHeight: false,
        dismissible: true,
        context: context,
        onClose: () {});
  }
}
