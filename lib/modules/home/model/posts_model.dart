import 'package:app/interface/base_model_interface.dart';

class PostsModel extends BaseModelInterface {

  PostsModel({
    this.userId,
    this.id,
    this.title,
    this.body,
  });


  int? userId;
  int? id;
  String? title;
  String? body;


  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['userId'] = userId;
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;

    return data;
  }

  @override
  BaseModelInterface fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
    return this;
  }

  PostsModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  @override
  fromJsonArray(List<dynamic> list){
    return List<PostsModel>.from(list.map((e) => PostsModel.fromJson(e)));
  }

}