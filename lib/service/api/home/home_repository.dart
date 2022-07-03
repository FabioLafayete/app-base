
import 'package:app/modules/home/model/posts_model.dart';
import 'package:app/modules/home/model/user_model.dart';

import 'home_service.dart';

class HomeRepository {

  HomeRepository({required this.service});

  final HomeService service;

  Future<List<UserModel>> getUsers() => service.getUsers();

  Future<List<PostsModel>> getPosts() => service.getPosts();
}
