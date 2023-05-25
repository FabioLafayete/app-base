import 'package:app/modules/login/page/login_page.dart';
import 'package:app/route/pages_name.dart';
import 'package:app/service/storage/storage_service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {

  HomeControllerBase();

  Future logout() async {
    try{
      final storage = Modular.get<SecureStorageService>();
      await storage.clearAll();
      Modular.to.pushReplacementNamed(PagesNames.login);
    }catch(_){
      print(_);
    }
  }

}