import 'package:app/shared/controller/user_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../route/my_router.dart';
import '../service/storage/storage_service.dart';
import '../shared/model/user/user_model.dart';

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

  setAgeProfile(int? value) => userController.setAgeProfile(value);

  setUser(UserModel value) => userController.setUser(value);

}