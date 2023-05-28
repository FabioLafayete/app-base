import 'dart:io';

import 'package:app/modules/navigator/controller/nav_controller.dart';
import 'package:app/route/pages_name.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:mobx/mobx.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../../../components/base_controller.dart';
import '../../../service/storage/storage_service.dart';

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

  @action
  setErrorName(String? value) => errorName = value;

  @action
  setVersion(String value) => version = value;

  @action
  setPhotoProfile(File? value) => photoProfile = value;

  @computed
  bool get enableButtonName {
    if(email != null && email!.isNotEmpty && GetUtils.isEmail(email!)) return true;
    return false;
  }

  @computed
  bool get enableButtonEmail {
    if(email != null && email!.isNotEmpty && GetUtils.isEmail(email!)) return true;
    return false;
  }

  Future checkVersion() async {
    try{
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      setVersion('Versão ${packageInfo.version} (${packageInfo.buildNumber}) (Beta)');
    }catch(_){
      print(_);
    }
  }

  Future logout() async {
    try{
      final storage = Modular.get<SecureStorageService>();
      await storage.clearAll();
      router.pushReplacementNamed(PagesNames.login).then((value){
        Modular.get<NavController>().setSelectedIndex(0);
      });
    }catch(_){
      print(_);
    }
  }

}