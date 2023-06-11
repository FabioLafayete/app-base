import 'package:flutter_modular/flutter_modular.dart';
import '../modules/navigator/controller/nav_controller.dart';
import '../route/my_router.dart';
import '../route/pages_name.dart';
import '../service/storage/storage_service.dart';
import '../shared/model/user/user_model.dart';
import '../shared/modules/user/controller/user_controller.dart';

class BaseController {
  BaseController();

  final MyRouter router = MyRouter();

  final SecureStorageService storage = SecureStorageService();

  UserController userController = Modular.get<UserController>();

  UserModel get user => userController.user;

  setNameProfile(String? value) => userController.setNameProfile(value);

  setEmailProfile(String? value) => userController.setEmailProfile(value);

  setPhoneProfile(String? value) => userController.setPhoneProfile(value);

  setPhotoUrlProfile(String? value) => userController.setPhotoUrlProfile(value);

  setAgeProfile(DateTime? value) => userController.setAgeProfile(value);

  setUser(UserModel value) => userController.setUser(value);

  Future updateUser(UserModel value) async {
    try{
      await userController.updateUser(value);
    }catch(_){

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