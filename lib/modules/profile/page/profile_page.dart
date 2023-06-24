import 'dart:io';

import 'package:app/components/base_page.dart';
import 'package:app/components/base_widget.dart';
import 'package:app/modules/profile/view/profile_data_view.dart';
import 'package:app/route/pages_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:line_icons/line_icons.dart';
import '../../../shared/widgets/image_cropper.dart';
import '../controller/profile_controller.dart';
import '../widgets/list_button.dart';

class ProfilePage extends BaseWidget<ProfileController> {
  ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
        showAppBar: false,
        paddingPage: 0,
        body: ListView(
          physics: const ClampingScrollPhysics(),
          padding: MediaQuery.of(context).padding.copyWith(top: 0),
          children: [
            Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 50,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Observer(builder: (_) => ImageCropperWidget(
                textImage: user.name,
                title: user.name,
                imageUrl: user.photoUrl,
                loading: controller.loading,
                onChange: (_){},
                simpleView: true,
              )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  space(0.03),
                  ListButton(
                    list: [
                      ListButtonItem(title: 'Meus dados', icon: LineIcons.user, onPress: (){
                        router.pushNamed(PagesNames.profileData);
                      }),
                      ListButtonItem(title: 'Ajuda e suporte', icon: LineIcons.questionCircle, onPress: (){}),
                      ListButtonItem(title: 'Indicar amigo(a)', icon: LineIcons.laughFaceWithBeamingEyes, onPress: (){}),
                      ListButtonItem(title: 'Feedback', icon: LineIcons.redo, onPress: (){}),
                      ListButtonItem(title: 'Sair da conta', icon: LineIcons.powerOff, onPress: controller.logout, isLogout: true),
                    ],
                  ),
                ],
              ),
            ),
            Observer(builder: (_) {
              if(controller.version != null) {
                return Container(
                  margin: const EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      text(
                          controller.version!,
                          color: colors.text.withOpacity(0.4),
                        fontSize: 12
                      ),
                    ],
                  ),
                );
              }
              return const SizedBox.shrink();
            })
          ],
        )
    );
  }


}
