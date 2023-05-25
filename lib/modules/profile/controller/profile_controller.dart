import 'package:app/modules/navigator/controller/nav_controller.dart';
import 'package:app/route/pages_name.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../../../service/storage/storage_service.dart';

part 'profile_controller.g.dart';

class ProfileController = ProfileControllerBase with _$ProfileController;

abstract class ProfileControllerBase with Store {

  ProfileControllerBase(){
    checkVersion();
  }


  @observable
  String? version;

  @action
  setVersion(String value) => version = value;

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
      Modular.to.pushReplacementNamed(PagesNames.login).then((value){
        Modular.get<NavController>().setSelectedIndex(0);
      });
    }catch(_){
      print(_);
    }
  }

}