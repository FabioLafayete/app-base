import 'package:app/modules/home/model/posts_model.dart';
import 'package:app/modules/home/model/user_model.dart';
import '../../http/http_service.dart';

class HomeService {
  HomeService({
    required this.httpService
  });

  final HttpService httpService;

  Future<List<UserModel>> getUsers() => httpService.request(
    path: '/users',
    type: RequestType.GET,
    dataResponse: UserModel(),
  );

  Future<List<PostsModel>> getPosts() => httpService.request(
    path: '/posts',
    type: RequestType.GET,
    dataResponse: PostsModel(),
  );
}
