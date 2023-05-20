import 'dart:io';

import 'package:app/components/base_page.dart';
import 'package:app/components/base_widget.dart';
import 'package:app/shared/model/user/user_model.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import '../../../route/pages_name.dart';
import '../../../shared/widgets/image_cropper.dart';
import '../controller/profile_controller.dart';
import '../widgets/list_button.dart';

class ProfilePage extends BaseWidget<ProfileController> {
  ProfilePage({Key? key}) : super(key: key);

  UserModel user = const UserModel(name: 'Mariana Cardoso', age: 22);

  static const router = '${PagesNames.profile}/';

  @override
  Widget build(BuildContext context) {
    return BasePage(
        showAppBar: false,
        padding: 0,
        body: ListView(
          padding: MediaQuery.of(context).padding.copyWith(top: 0),
          children: [
            Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 20,
                bottom: 20, left: 16, right: 16
              ),
              color: colors.primary,
              child: ImageCropperWidget(
                textImage: 'FL',
                title: 'Fabio Lafayete',
                subTitle: 'Meus dados',
                onPress: (){},
                onChange: (File? image) {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  space(0.03),
                  text('Conta', fontWeight: FontWeight.w600, fontSize: 18),
                  space(0.01),
                  ListButton(
                    list: [
                      ListButtonItem(title: 'Meu perfil', icon: LineIcons.user, onPress: (){print('AI');}),
                      ListButtonItem(title: 'Meu perfil', icon: LineIcons.user, onPress: (){}),
                      ListButtonItem(title: 'Ajuda', icon: LineIcons.questionCircle, onPress: (){}),
                      ListButtonItem(title: 'Sobre', icon: LineIcons.exclamationCircle, onPress: (){}),
                      ListButtonItem(title: 'Sair', icon: LineIcons.powerOff, onPress: controller.logout),
                    ],
                  ),
                ],
              ),
            ),
          ],
        )
    );
  }


}
