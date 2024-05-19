import 'dart:io';

import 'package:app/shared/model/products/product_model.dart';
import 'package:app/shared/model/support/support_model.dart';
import 'package:app/shared/model/user/user_model.dart';

abstract class UserRepository {
  Future<UserModel> updateUser(UserModel user);
  Future<UserModel> getUser();
  Future<void> deletePhoto();
  Future<String> addPhoto(File file);
  Future<void> postSupport(SupportModel model);
  Future<List<ProductModel>> getProducts();
}