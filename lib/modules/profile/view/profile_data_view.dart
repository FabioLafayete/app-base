import 'package:app/modules/profile/controller/profile_controller.dart';
import 'package:app/shared/widgets/base_page.dart';
import 'package:app/shared/widgets/base_widget.dart';
import 'package:app/shared/widgets/my_button.dart';
import 'package:app/shared/widgets/visual_display.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../shared/widgets/image_cropper.dart';
import '../widgets/list_button.dart';

class ProfileDataView extends StatefulWidget {
  ProfileDataView({Key? key}) : super(key: key);

  @override
  State<ProfileDataView> createState() => _ProfileDataViewState();
}

class _ProfileDataViewState extends ViewState<ProfileDataView, ProfileController> {

  late dynamic tr;

  @override
  Widget build(BuildContext context) {
    tr = local.tr['profile']['data'];
    return BasePage(
      title: tr['title'],
      elevation: 0,
      body: Column(
        children: [
          const SizedBox(height: 30),
          Observer(
            builder: (_) => ImageCropperWidget(
              textImage: user.name,
              loading: controller.loading,
              onChange: (value) {
                if (value != null) {
                  controller.changePhoto(value);
                } else {
                  controller.userController.deletePhotoUser();
                }
              },
              imageUrl: user.photoUrl,
            ),
          ),
          const SizedBox(height: 30),
          Observer(
              builder: (_) => ListButton(
                    list: [
                      ListButtonItem(
                        title: user.name ?? '',
                        subTitle: tr['name'],
                        textIcon: tr['edit'],
                        onPress: () => _editName(context),
                      ),
                      ListButtonItem(
                        title: controller.user.email ?? '',
                        subTitle: 'E-mail',
                        showIcon: false,
                      ),
                      ListButtonItem(
                        title: user.cellphone != null
                            ? UtilBrasilFields.obterTelefone(
                                controller.user.cellphone!)
                            : '',
                        subTitle: tr['phone'],
                        textIcon: tr['edit'],
                        onPress: () => _editPhone(context),
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
            text(tr['editName'],
                color: colors.text,
                fontSize: 20,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.start),
            const SizedBox(height: 30),
            VisualDisplay.textField(
              labelText: tr['newName'],
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
                if (controller.enableButtonName) {
                  controller.changeName().then((value) {
                    router.pop();
                  });
                } else {
                  controller.setErrorName(tr['errorName']);
                }
              },
              validator: (txt) {
                if (controller.errorName != null) {
                  return controller.errorName;
                }
                return null;
              },
              onChanged: (value) {
                controller.setName(value);
                if (controller.enableButtonName) {
                  controller.setErrorName(null);
                }
              },
            ),
            const SizedBox(height: 24),
            Observer(
                builder: (_) => MyButton(
                      title: tr['save'],
                      colorTitle: colors.background,
                      colorButton: colors.primary,
                      loading: controller.loading,
                      onPress: controller.enableButtonName
                          ? () {
                              controller.changeName().then((value) {
                                router.pop();
                              });
                            }
                          : null,
                    )),
            const SizedBox(height: 64)
          ],
        ),
        hasHeight: false,
        dismissible: true,
        context: context,
        onClose: () {});
  }

  void _editPhone(BuildContext context) {
    VisualDisplay.bottomSheet(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            text(tr['editPhone'],
                color: colors.text,
                fontSize: 20,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.start),
            const SizedBox(height: 30),
            VisualDisplay.textField(
              labelText: tr['editPhone'],
              fillColor: Colors.white,
              colorBorder: Colors.white,
              colorCursor: colors.secondary,
              colorBorderFocus: colors.secondary.withOpacity(0.7),
              colorLabel: colors.textSecondary,
              colorLabelFocus: colors.textSecondary,
              textInputType: TextInputType.number,
              errorText: controller.errorPhone,
              initialValue: user.cellphone != null
                  ? UtilBrasilFields.obterTelefone(controller.user.cellphone!)
                  : null,
              inputMask: [
                FilteringTextInputFormatter.digitsOnly,
                TelefoneInputFormatter(),
              ],
              onEditingComplete: () {
                if (controller.enableButtonPhone) {
                  controller.changePhone();
                } else {
                  controller.setErrorPhone(tr['errorPhone']);
                }
              },
              validator: (txt) {
                if (controller.errorPhone != null) {
                  return controller.errorPhone;
                }
                if (txt != null) {
                  if (!controller.enableButtonPhone) {
                    return tr['errorPhone'];
                  }
                }
                return null;
              },
              onChanged: (value) {
                print(value);
                print(value.length);
                controller.setPhone(value);
                if (controller.enableButtonPhone) {
                  controller.setErrorPhone(null);
                }
              },
            ),
            const SizedBox(height: 24),
            Observer(
                builder: (_) => MyButton(
                      title: tr['save'],
                      colorTitle: colors.background,
                      colorButton: colors.primary,
                      loading: controller.loading,
                      onPress: controller.enableButtonPhone
                          ? () {
                              controller.changePhone().then((value) {
                                router.pop();
                              });
                            }
                          : null,
                    )),
            const SizedBox(height: 64)
          ],
        ),
        hasHeight: false,
        dismissible: true,
        context: context,
        onClose: () {});
  }
}
