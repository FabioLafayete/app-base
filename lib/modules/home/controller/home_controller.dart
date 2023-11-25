import 'package:app/route/pages_name.dart';
import 'package:app/service/storage/storage_service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:app/shared/widgets/base_controller.dart';
part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase extends BaseController with Store {

  HomeControllerBase();

  @override
  Future logout() async {
    try{
      final storage = Modular.get<SecureStorageService>();
      await storage.clearAll();
      router.pushReplacementNamed(PagesNames.login);
    }catch(_){
      print(_);
    }
  }

}