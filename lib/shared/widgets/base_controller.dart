import 'package:app/modules/navigator/controller/nav_controller.dart';
import 'package:app/route/my_router.dart';
import 'package:app/route/pages_name.dart';
import 'package:app/service/storage/storage_service.dart';
import 'package:app/shared/model/user/user_model.dart';
import 'package:app/shared/modules/user/controller/user_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

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
  setGenderProfile(String? value) => userController.setGenderProfile(value);
  setWeightProfile(int? value) => userController.setWeightProfile(value);
  setHeightProfile(int? value) => userController.setHeightProfile(value);
  setLimitationProfile(String? value) => userController.setLimitationProfile(value);
  setTargetProfile(String? value) => userController.setTargetProfile(value);
  setTargetWeightProfile(int? value) => userController.setTargetWeightProfile(value);

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