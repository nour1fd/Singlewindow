class TransictionModel2 {
  Transictiondata? data;
  String? message;
  bool? success;

  TransictionModel2.formjson(Map<String, dynamic> json) {
    data = (json['data'] != null ? Transictiondata.formjson(json['data']) : "errpe") as Transictiondata?;
    message = json['message'];
    success = json['success'];

  }
}

class Transictiondata {
  int? id;

  String? tran_name;
  String? father;
  String? mother;
  String? section;
  String? reg_uni;
  String? year;
  String? course_name;
  String? course_year;
  String? chapter;
  String? teach;


  Transictiondata.formjson(Map<String, dynamic> json) {
    id = json['id'];

    tran_name = json['tran_name'];
    father = json['father'];
    mother = json['mother'];
    section = json['section'];
    reg_uni = json['reg_uni'];
    year = json['year'];
    course_name = json['course_name'];
    course_year = json['course_year'];
    chapter = json['chapter'];
    teach = json['teach'];


  }
}