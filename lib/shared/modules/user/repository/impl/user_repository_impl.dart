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
}