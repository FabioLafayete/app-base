import 'package:app/modules/navigator/controller/nav_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../service/storage/storage_service.dart';
import '../../login/page/login_page.dart';

part 'profile_controller.g.dart';

class ProfileController = ProfileControllerBase with _$ProfileController;

abstract class ProfileControllerBase with Store {

  Future logout() async {
    try{
      final storage = Modular.get<SecureStorageService>();
      await storage.clearAll();
      Modular.to.pushReplacementNamed(LoginPage.router).then((value){
        Modular.get<NavController>().setSelectedIndex(0);
      });
    }catch(_){
      print(_);
    }
  }

}