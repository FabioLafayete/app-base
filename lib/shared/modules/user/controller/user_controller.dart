import 'dart:io';

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
  setAgeProfile(DateTime? value) => user = user.copyWith(age: value);

  @action
  setUser(UserModel value) => user = value;

  Future<void> setInitUser({UserModel? userModel}) async {
    try{
      if(userModel != null){
        setUser(userModel);
      } else {
        final data = await userRepositoryImpl.getUser();
        setUser(data);
      }
    }catch(_){

    }
  }

  Future deletePhotoUser() async {
    try{
      setPhotoUrlProfile(null);
      await userRepositoryImpl.deletePhoto();
    }catch(_){
      if(_ is DioError){
        print(_.message);
        print(_.error);
      } else {
        print(_);
      }
    }
  }

  Future addPhotoUser(File file) async {
    try{
      String urlPhoto = await userRepositoryImpl.addPhoto(file);
      setPhotoUrlProfile(urlPhoto);
    }catch(_){
      if(_ is DioError){
        print(_.message);
        print(_.error);
      } else {
        print(_);
      }
    }
  }

  Future<void> updateUser(UserModel value) async {
    try{
      final userModel = await userRepositoryImpl.updateUser(value);
      setUser(userModel);
    }catch(_){
      if(_ is DioException){
        print(_.message);
        print(_.error);
        print(_.response?.data);
      } else {
        print(_);
      }
    }
  }

}