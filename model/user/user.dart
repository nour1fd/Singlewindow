class UserModel {
  Userdata? data;
  String? message;
  bool? success;

  UserModel.formjson(Map<String, dynamic> json) {
    data = (json['data'] != null ? Userdata.formjson(json['data']) : "errpe") as Userdata?;
    message = json['message'];
    success = json['success'];

  }
}

class Userdata {
  int? id;
  String? name;
  String? email;
  int? id_uni;
  String? token;

  String? approve;


  Userdata.formjson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    id_uni = json['id_uni'];
    token = json['token'];
    approve = json['approve'];

  }
}