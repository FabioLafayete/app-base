import 'package:app/shared/model/user/user_model.dart';

abstract class UserRepository {
  Future<UserModel> updateUser(UserModel user);
  Future<UserModel> getUser();
}