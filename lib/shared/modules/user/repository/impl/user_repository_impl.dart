import 'dart:io';

import 'package:app/config/app_local.dart';
import 'package:app/shared/model/products/product_model.dart';
import 'package:app/shared/model/support/support_model.dart';
import 'package:app/shared/model/user/user_model.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../service/user_service.dart';
import '../user_repository.dart';

class UserRepositoryImpl extends UserRepository{

  UserRepositoryImpl(this.userService);

  final UserService userService;

  @override
  Future<UserModel> updateUser(UserModel user) async {
   final data = await userService.updateUser(user);
   return UserModel.fromJson(data.data);
  }

  @override
  Future<UserModel> getUser() async {
    final data = await userService.getUser();
    return UserModel.fromJson(data.data);
  }

  @override
  Future<void> deletePhoto() async => userService.deletePhoto();

  @override
  Future<String> addPhoto(File file) async {
    final data = await userService.addPhoto(file);
    return data.data['photoUrl'];
  }

  @override
  Future<void> postSupport(SupportModel model) async => userService.postSupport(model);

  @override
  Future<List<ProductModel>> getProducts(String? country) async {
    final data = await userService.getProducts(country);
    return (data.data as List).map((e) => ProductModel.fromJson(e)).toList();
  }

  @override
  Future<void> postLog(UserModel user) async {

    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    AppLocal appLocal = AppLocal();

    String os = Platform.isAndroid ? 'android' : 'ios';
    String versionOs;
    String model;
    String name;
    String idDevice;

    if(Platform.isAndroid){
      var androidInfo = await DeviceInfoPlugin().androidInfo;
      versionOs = androidInfo.version.sdkInt.toString();
      model = androidInfo.manufacturer;
      name = androidInfo.model;
      idDevice = androidInfo.id;
    } else {
      var iosInfo = await DeviceInfoPlugin().iosInfo;
      versionOs = iosInfo.systemVersion;
      model = iosInfo.model;
      name = iosInfo.name;
      idDevice = iosInfo.identifierForVendor.toString();
    }

    Map<String, String> body = {
      "os": os,
      "versionOs": versionOs,
      "model": model,
      "name": name,
      "idDevice": idDevice,
      "languageLocal": appLocal.local.value.name,
      "versionApp": '${packageInfo.version}:${packageInfo.buildNumber}',
    };

    userService.postLog(body);
  }

  @override
  Future<void> deleteAccount() => userService.deleteAccount();
}