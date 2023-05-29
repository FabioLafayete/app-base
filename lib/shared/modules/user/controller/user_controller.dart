import 'package:app/shared/model/user/user_model.dart';
import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import '../repository/impl/user_repository_impl.dart';

part 'user_controller.g.dart';

class UserController = UserControllerBase with _$UserController;

abstract class UserControllerBase with Store{

  final UserRepositoryImpl userRepositoryImpl;

  UserControllerBase(this.userRepositoryImpl);

  @observable
  UserModel user = const UserModel();

  @action
  setNameProfile(String? value) => user = user.copyWith(name: value);

  @action
  setEmailProfile(String? value) => user = user.copyWith(email: value);

  @action
  setPhoneProfile(String? value) => user = user.copyWith(cellphone: value);

  @action
  setPhotoUrlProfile(String? value) => user = user.copyWith(photoUrl: value);

  @action
  setAgeProfile(int? value) => user = user.copyWith(age: value);

  @action
  setUser(UserModel value) => user = value;

  Future<void> setInitUser() async {
    try{
      final userModel = await userRepositoryImpl.getUser();
      setUser(userModel);
    }catch(_){

    }
  }

  Future<void> updateUser(UserModel value) async {
    try{
      final userModel = await userRepositoryImpl.updateUser(value);
      setUser(userModel);
    }catch(_){
      if(_ is DioError){
        print(_.message);
        print(_.error);
      } else {
        print(_);
      }
    }
  }

}