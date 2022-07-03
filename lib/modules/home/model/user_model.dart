import 'package:app/interface/base_model_interface.dart';

class UserModel extends BaseModelInterface {

  UserModel({
    this.id,
    this.avatar,
    this.name,
    this.userName,
    this.email
  });

  int? id;
  String? avatar;
  String? name;
  String? userName;
  String? email;


  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id;
    data['avatar'] = avatar;
    data['name'] = name;
    data['userName'] = userName;
    data['email'] = email;

    return data;
  }

  @override
  UserModel fromJson(Map<String, dynamic> json) {

    id = json['id'];
    avatar = json['avatar']['medium'];
    name = json['name'];
    userName = json['userName'];
    email = json['email'];

    return this;
  }

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    avatar = json['avatar']['medium'];
    name = json['name'];
    userName = json['userName'];
    email = json['email'];
  }

  @override
  fromJsonArray(List<dynamic> list){
    return List<UserModel>.from(list.map((e) => UserModel.fromJson(e)));
  }

}