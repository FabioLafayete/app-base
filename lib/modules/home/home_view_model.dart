import 'package:app/modules/home/model/posts_model.dart';
import 'package:app/modules/home/model/user_model.dart';
import 'package:get/get.dart';

import '../../components/base_view_model.dart';
import 'home_controller.dart';
import 'model/user_post_model.dart';

class HomeViewModel extends BaseViewModel<HomeController> {

  final RxList<UserModel> _users = RxList<UserModel>();
  final RxList<PostsModel> _posts = RxList<PostsModel>();
  final RxList<UserPostsModel> _userPosts = RxList<UserPostsModel>([]);
  final RxBool _isLoading = RxBool(false);
  final RxBool _isDarkTheme = RxBool(false);
  final RxString _pageError = RxString('');

  List<UserModel> get users => _users;
  List<PostsModel> get posts => _posts;
  List<UserPostsModel> get userPosts => _userPosts;
  bool get isLoading => _isLoading.value;
  bool get isDarkTheme => _isDarkTheme.value;
  String get pageError => _pageError.value;

  setUsers(List<UserModel> value) => _users.value = value;
  setPosts(List<PostsModel> value) => _posts.value = value;
  setUserPosts(List<UserPostsModel> value) => _userPosts.value = value;
  setIsLoading(bool value) => _isLoading.value = value;
  setIsDarkTheme(bool value) => _isDarkTheme.value = value;
  setPageError(String value) => _pageError.value = value;

}