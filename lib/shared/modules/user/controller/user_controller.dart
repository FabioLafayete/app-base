import 'dart:io';

import 'package:app/shared/model/support/support_model.dart';
import 'package:app/shared/model/user/user_model.dart';
import 'package:dio/dio.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobx/mobx.dart';
import '../../../model/products/product_model.dart';
import '../repository/impl/user_repository_impl.dart';

part 'user_controller.g.dart';

class UserController = UserControllerBase with _$UserController;

abstract class UserControllerBase with Store {
  final UserRepositoryImpl userRepositoryImpl;

  UserControllerBase(this.userRepositoryImpl);

  @observable
  UserModel user = const UserModel();

  @observable
  List<ProductModel> productModel = [];

  @action
  setProducts(List<ProductModel> value) {
    productModel = List.from(value);
  }

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
  setGenderProfile(String? value) => user = user.copyWith(gender: value);

  @action
  setLimitationProfile(String? value) =>
      user = user.copyWith(limitation: value);

  @action
  setHeightProfile(int? value) => user = user.copyWith(height: value);

  @action
  setTargetProfile(String? value) => user = user.copyWith(target: value);

  @action
  setWeightProfile(int? value) => user = user.copyWith(weight: value);

  @action
  setTargetWeightProfile(int? value) => user = user.copyWith(
        targetWeight: value,
        newUser: false,
      );

  @action
  setUser(UserModel value) => user = value;

  Future<void> setInitUser({UserModel? userModel}) async {
    if (userModel != null) {
      setUser(userModel);
    } else {
      final data = await userRepositoryImpl.getUser();
      setUser(data);
    }
    await getProducts();
  }

  Future<bool> checkUserSubscription() async {
    for (int i = 0; i < 3; i++) {
      final data = await userRepositoryImpl.getUser();
      setUser(data);
      if (data.isSubscripted) {
        break;
      }
      await Future.delayed(const Duration(seconds: 2));
    }
    return user.isSubscripted;
  }

  Future deletePhotoUser() async {
    try {
      setPhotoUrlProfile(null);
      await userRepositoryImpl.deletePhoto();
    } catch (_) {
      if (_ is DioError) {
        print(_.message);
        print(_.error);
      } else {
        print(_);
      }
    }
  }

  Future addPhotoUser(File file) async {
    try {
      String urlPhoto = await userRepositoryImpl.addPhoto(file);
      setPhotoUrlProfile(urlPhoto);
    } catch (_) {
      if (_ is DioError) {
        print(_.message);
        print(_.error);
      } else {
        print(_);
      }
    }
  }

  Future<void> updateUser(UserModel value) async {
    try {
      final userModel = await userRepositoryImpl.updateUser(value);
      setUser(userModel);
    } catch (_) {
      if (_ is DioException) {
        print(_.message);
        print(_.error);
        print(_.response?.data);
      } else {
        print(_);
      }
    }
  }

  Future<bool> postLog() async {
    try {
      userRepositoryImpl.postLog(user);
      return true;
    } catch (_) {
      if (_ is DioException) {
        print(_.message);
        print(_.error);
        print(_.response?.data);
      } else {
        print(_);
      }
      return false;
    }
  }

  Future<bool> postSupport(SupportModel model) async {
    try {
      await userRepositoryImpl.postSupport(model);
      return true;
    } catch (_) {
      if (_ is DioException) {
        print(_.message);
        print(_.error);
        print(_.response?.data);
      } else {
        print(_);
      }
    }
    return false;
  }

  Future getProducts() async {
    try {
      if (productModel.isNotEmpty) return;
      final String? country = await getCountry();
      final response = await userRepositoryImpl.getProducts(country);
      setProducts(response);
    } catch (_) {
      if (_ is DioException) {
        print(_.message);
        print(_.error);
        print(_.response?.data);
      } else {
        print(_);
      }
    }
    return false;
  }

  Future<String?> getCountry() async {
    try {
      if (user.country != null && user.country!.isNotEmpty) return user.country;

      if (await handleLocationPermission()) {
        Position position = await _determinePosition();
        List<Placemark> placemarks = await placemarkFromCoordinates(
          position.latitude,
          position.longitude,
        );
        updateUser(user.copyWith(country: placemarks.first.isoCountryCode));
        return placemarks.first.isoCountryCode;
      }
      return null;
    } catch (_) {
      if (_ is DioException) {
        print(_.message);
        print(_.error);
        print(_.response?.data);
      } else {
        print(_);
      }
      return null;
    }
  }

  Future<Position> _determinePosition() async {
    return await Geolocator.getCurrentPosition();
  }

  Future<bool> handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return false;
    }
    return true;
  }
}
