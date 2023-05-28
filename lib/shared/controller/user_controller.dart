import 'package:app/shared/model/user/user_model.dart';
import 'package:mobx/mobx.dart';

part 'user_controller.g.dart';

class UserController = UserControllerBase with _$UserController;

abstract class UserControllerBase with Store{
  UserControllerBase();

  @observable
  UserModel user = const UserModel();

  @action
  setNameProfile(String? value) => user = user.copyWith(name: value);

  @action
  setEmailProfile(String? value) => user = user.copyWith(email: value);

  @action
  setPhoneProfile(String? value) => user = user.copyWith(phone: value);

  @action
  setPhotoUrlProfile(String? value) => user = user.copyWith(photoUrl: value);

  @action
  setAgeProfile(int? value) => user = user.copyWith(age: value);

  @action
  setUser(UserModel value) => user = value;

}