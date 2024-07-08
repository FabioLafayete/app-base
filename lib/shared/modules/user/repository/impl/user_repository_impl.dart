import 'dart:io';

import 'package:app/shared/model/products/product_model.dart';
import 'package:app/shared/model/support/support_model.dart';
import 'package:app/shared/model/user/user_model.dart';

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
}