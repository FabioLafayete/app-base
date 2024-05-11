import 'package:app/modules/profile/controller/profile_controller.dart';
import 'package:app/shared/widgets/base_page.dart';
import 'package:app/shared/widgets/base_widget.dart';
import 'package:app/shared/widgets/my_button.dart';
import 'package:app/shared/widgets/subscription_bottom_sheet.dart';
import 'package:app/shared/widgets/visual_display.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import '../../../shared/widgets/image_cropper.dart';
import '../widgets/list_button.dart';

class ProfileDataView extends BaseWidget<ProfileController> {
  ProfileDataView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: 'Perfil',
      elevation: 0,
      body: Column(
        children: [
          const SizedBox(height: 30),
          Observer(builder: (_) => ImageCropperWidget(
            textImage: user.name,
            loading: controller.loading,
            onChange: (value){
              if(value != null) {
                controller.changePhoto(value);
              } else {
                controller.userController.deletePhotoUser();
              }
            },
            imageUrl: user.photoUrl,
          ),),
          const SizedBox(height: 30),
          Observer(builder: (_) => ListButton(
            list: [
              ListButtonItem(title: user.name ?? '', subTitle: 'Nome', textIcon: 'Editar', onPress: () => _editName(context)),
              ListButtonItem(title: controller.user.email ?? '', subTitle: 'Email', showIcon: false),
              ListButtonItem(
                  title: user.cellphone != null ?
                  UtilBrasilFields.obterTelefone(controller.user.cellphone!) : '',
                  subTitle: 'Celular',
                  textIcon: 'Editar',
                  // onPress: () => _editPhone(context)
                onPress: () => const SubscriptionBottomSheet().show(context: context),
              ),
            ],
          ))
        ],
      ),
    );
  }

  void _editName(BuildContext context) {
    VisualDisplay.bottomSheet(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            text(
                'Editar nome',
                color: colors.text,
                fontSize: 20,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.start
            ),
            const SizedBox(height: 30),
            VisualDisplay.textField(
              labelText: 'Novo nome',
              fillColor: Colors.white,
              colorBorder: Colors.white,
              colorCursor: colors.secondary,
              colorBorderFocus: colors.secondary.withOpacity(0.7),
              colorLabel: colors.textSecondary,
              colorLabelFocus: colors.textSecondary,
              textInputType: TextInputType.emailAddress,
              errorText: controller.errorName,
              initialValue: controller.user.name,
              onEditingComplete: () {
                if(controller.enableButtonName){
                  controller.changeName().then((value) {
                    router.pop();
                  });
                } else {
                  controller.setErrorName('Digite um nome válido');
                }
              },
              validator: (txt) {
                if(controller.errorName != null){
                  return controller.errorName;
                }
                if(txt != null){
                  if(!GetUtils.isEmail(txt)){
                    return 'Digite um e-mail válido';
                  }
                }
                return null;
              },
              onChanged: (value) {
                controller.setName(value);
                if(controller.enableButtonName){
                  controller.setErrorName(null);
                }
              },
            ),
            const SizedBox(height: 24),
            Observer(builder: (_) => MyButton(
              title: 'SALVAR',
              colorTitle: colors.background,
              colorButton: colors.primary,
              loading: controller.loading,
              onPress: controller.enableButtonName ? () {
                    controller.changeName().then((value) {
                      router.pop();
                    });
              } : null,
            )),
            const SizedBox(height: 64)
          ],
        ),
        hasHeight: false,
        dismissible: true,
        context: context,
        onClose: (){}
    );
  }

  void _editPhone(BuildContext context) {
    VisualDisplay.bottomSheet(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            text(
                'Editar celular',
                color: colors.text,
                fontSize: 20,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.start
            ),
            const SizedBox(height: 30),
            VisualDisplay.textField(
              labelText: 'Novo celular',
              fillColor: Colors.white,
              colorBorder: Colors.white,
              colorCursor: colors.secondary,
              colorBorderFocus: colors.secondary.withOpacity(0.7),
              colorLabel: colors.textSecondary,
              colorLabelFocus: colors.textSecondary,
              textInputType: TextInputType.number,
              errorText: controller.errorPhone,
              initialValue: user.cellphone != null ? UtilBrasilFields.obterTelefone(controller.user.cellphone!) : null,
              inputMask: [
                FilteringTextInputFormatter.digitsOnly,
                TelefoneInputFormatter(),
              ],
              onEditingComplete: () {
                if(controller.enableButtonPhone){
                  controller.changePhone();
                } else {
                  controller.setErrorPhone('Digite um numero válido');
                }
              },
              validator: (txt) {
                if(controller.errorPhone != null){
                  return controller.errorPhone;
                }
                if(txt != null){
                  if(!controller.enableButtonPhone){
                    return 'Digite um numero válido';
                  }
                }
                return null;
              },
              onChanged: (value) {
                print(value);
                print(value.length);
                controller.setPhone(value);
                if(controller.enableButtonPhone){
                  controller.setErrorPhone(null);
                }
              },
            ),
            const SizedBox(height: 24),
            Observer(builder: (_) => MyButton(
              title: 'SALVAR',
              colorTitle: colors.background,
              colorButton: colors.primary,
              loading: controller.loading,
              onPress: controller.enableButtonPhone ? () {
                controller.changePhone().then((value) {
                  router.pop();
                });
              } : null,
            )),
            const SizedBox(height: 64)
          ],
        ),
        hasHeight: false,
        dismissible: true,
        context: context,
        onClose: (){}
    );
  }

}
