import 'dart:io';
import 'package:app/route/pages_name.dart';
import 'package:app/shared/model/support/support_model.dart';
import 'package:app/shared/widgets/base_controller.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:mobx/mobx.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:toastification/toastification.dart';

part 'profile_controller.g.dart';

class ProfileController = ProfileControllerBase with _$ProfileController;

abstract class ProfileControllerBase extends BaseController with Store {

  ProfileControllerBase(){
    checkVersion();
  }

  @observable
  String? version;

  @observable
  File? photoProfile;

  @observable
  String? name;

  @observable
  String? email;

  @observable
  String? phone;

  @observable
  String? errorName;

  @observable
  String? errorEmail;

  @observable
  String? errorPhone;

  @observable
  bool loading = false;

  @observable
  bool successPage = false;

  @observable
  String? optionHelp;

  @observable
  String? titleHelp;

  @observable
  String? messageHelp;

  List<String> listOptionsHelp = [
    'Problema',
    'Dúvida',
    'Elogio',
    'Parceria',
    // 'Reembolso',
    'Cancelar assinatura'
  ];

  @action
  setSuccessPage(bool value) => successPage = value;

  @action
  setOptionHelp(String? value) => optionHelp = value;

  @action
  setTitleHelp(String? value) => titleHelp = value;

  @action
  setMessageHelp(String? value) => messageHelp = value;

  @action
  setName(String? value) => name = value;

  @action
  setEmail(String? value) => email = value;

  @action
  setPhone(String? value) => phone = value;

  @action
  setErrorName(String? value) => errorName = value;

  @action
  setErrorPhone(String? value) => errorPhone = value;

  @action
  setVersion(String value) => version = value;

  @action
  setPhotoProfile(File? value) => photoProfile = value;

  @action
  setLoading(bool value) => loading = value;

  @computed
  bool get enableButtonName {
    if (name == null) return false;
    if (name!.isEmpty) return false;
    if (!name!.trim().contains(' ')) return false;
    if (name!.trim().split(' ').toList().length < 2) return false;
    if (name == user.name) return false;
    return true;
  }

  @computed
  bool get enableButtonEmail {
    if(email != null && email!.isNotEmpty && GetUtils.isEmail(email!)) return true;
    return false;
  }

  @computed
  bool get enableButtonPhone {
    if (phone == null) return false;
    if (phone!.isEmpty) return false;
    if(user.cellphone != null && user.cellphone!.length >= 11){
      if(UtilBrasilFields.obterTelefone(user.cellphone!) == phone){
        return false;
      }
    }
    if (phone == user.cellphone) return false;
    if (phone!.length <= 14) return false;
    return true;
  }

  Future changeName() async {
    try{
      setLoading(true);
      await updateUser(user.copyWith(name: name));
      setName(null);
    }catch(_){
      print(_);
    } finally {
      setLoading(false);
    }
  }

  Future changePhone() async {
    try{
      setLoading(true);
      await updateUser(user.copyWith(cellphone: UtilBrasilFields.obterTelefone(phone!, mascara: false)));
      setPhone(null);
    }catch(_){
      print(_);
    } finally {
      setLoading(false);
    }
  }

  Future changePhoto(File file) async {
    try{
      setLoading(true);
      await userController.addPhotoUser(file);
    }catch(_){
      print(_);
    } finally {
      setLoading(false);
    }
  }

  Future checkVersion() async {
    try{
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      setVersion('Versão ${packageInfo.version} (${packageInfo.buildNumber}) (Beta)');
    }catch(_){
      print(_);
    }
  }

  void clearHelpPage(){
    setOptionHelp(null);
    setMessageHelp(null);
    setTitleHelp(null);
    setSuccessPage(false);
  }

  bool enableButtonSendHelp(){
    if(messageHelp == null || messageHelp!.isEmpty) return false;
    if(titleHelp == null || titleHelp!.isEmpty) return false;
    if(optionHelp == null || optionHelp!.isEmpty) return false;
    if(loading) return false;
    return true;
  }

  Future postSupport(BuildContext context) async {
    try{
      setLoading(true);

      late SupportReasonEnum supportReasonEnum;

      if(optionHelp! == 'Problema'){
        supportReasonEnum = SupportReasonEnum.PROBLEM;
      }
      if(optionHelp! == 'Dúvida'){
        supportReasonEnum = SupportReasonEnum.DOUBT;
      }
      if(optionHelp! == 'Elogio'){
        supportReasonEnum = SupportReasonEnum.PRIASE;
      }
      if(optionHelp! == 'Parceria'){
        supportReasonEnum = SupportReasonEnum.PARTNERSHIP;
      }
      if(optionHelp! == 'Reembolso'){
        supportReasonEnum = SupportReasonEnum.REIMBURSEMENT;
      }
      if(optionHelp! == 'Cancelar assinatura'){
        supportReasonEnum = SupportReasonEnum.SUBSCRIPTION_CANCELED;
      }

      final model = SupportModel(
        message: messageHelp!,
        subject: titleHelp!,
        reason: supportReasonEnum
      );

      final response = await userController.postSupport(model);

      if(response){
        router.pushReplacementNamed(PagesNames.profileHelpCongrats);
      }

    }catch(_){
      showToast(
        context: context,
        title: 'Mensagem não enviada',
        description: 'Falha ao tentar enviar mensagem, por favor, tente novamente.',
        type: ToastificationType.error
      );
      print(_);
    } finally {
      setLoading(false);
    }
  }

}