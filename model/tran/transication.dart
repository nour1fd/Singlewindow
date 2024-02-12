// class TransictionModel {
//   Transictiondata? data;
//   String? message;
//   bool? success;
//
//   TransictionModel.formjson(Map<String, dynamic> json) {
//     data = (json['data'] != null ? Transictiondata.formjson(json['data']) : "errpe") as Transictiondata?;
//     message = json['message'];
//     success = json['success'];
//
//   }
// }
//
// class Transictiondata {
//   int? id;
//
//   String? tran_name;
//   String? father;
//   String? mother;
//   String? section;
//   String? reg_uni;
//   String? year;
//   String? course_name;
//   String? course_year;
//   String? chapter;
//   String? teach;
//
//
//   Transictiondata.formjson(Map<String, dynamic> json) {
//     id = json['id'];
//
//     tran_name = json['tran_name'];
//     father = json['father'];
//     mother = json['mother'];
//     section = json['section'];
//     reg_uni = json['reg_uni'];
//     year = json['year'];
//     course_name = json['course_name'];
//     course_year = json['course_year'];
//     chapter = json['chapter'];
//     teach = json['teach'];
//
//
//   }
// }
// class TransictionModel {
//   bool? success;
//   List<Datum>? data;
//   String ?massage;
//
//
//
//
//   TransictionModel.formjson(Map<String, dynamic> json) {
//     massage = json['message'];
//     success = json['success'];
//   }
// }
// class Datum {
//   int id;
//   String userName;
//   int userId;
//   dynamic empId;
//   String tranName;
//   String father;
//   String mother;
//   String section;
//   String regUni;
//   dynamic year;
//   dynamic courseName;
//   dynamic courseYear;
//   dynamic chapter;
//   dynamic teach;
//   String state;
//
//   Datum({
//     required this.id,
//     required this.userName,
//     required this.userId,
//     required this.empId,
//     required this.tranName,
//     required this.father,
//     required this.mother,
//     required this.section,
//     required this.regUni,
//     required this.year,
//     required this.courseName,
//     required this.courseYear,
//     required this.chapter,
//     required this.teach,
//     required this.state,
//   });
//
// }
class TransictionModel {
  bool ?success;
  List<Data> ?data;
  String ?massage;

  TransictionModel({required this.success,required this.data,required this.massage});

  TransictionModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    massage = json['massage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['massage'] = this.massage;
    return data;
  }
}

class Data {
  int? id;
  String ?userName;
  int ?userId;
  String? empId;
  String ?tranName;
  String ?father;
  String ?mother;
  String ?section;
  String ?regUni;
  String ?year;
  String ?courseName;
  String ?courseYear;
  String ?chapter;
  String ?teach;
  String ?state;
  String ?price;
  Data(
      {this.id,
        this.userName,
        this.userId,
        this.empId,
        this.tranName,
        this.father,
        this.mother,
        this.section,
        this.regUni,
        this.year,
        this.courseName,
        this.courseYear,
        this.chapter,
        this.teach,
        this.state,
        this.price,
      });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['user_name'];
    userId = json['user_id'];
    empId = json['emp_id'];
    tranName = json['tran_name'];
    father = json['father'];
    mother = json['mother'];
    section = json['section'];
    regUni = json['reg_uni'];
    year = json['year'];
    courseName = json['course_name'];
    courseYear = json['course_year'];
    chapter = json['chapter'];
    teach = json['teach'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_name'] = this.userName;
    data['user_id'] = this.userId;
    data['emp_id'] = this.empId;
    data['tran_name'] = this.tranName;
    data['father'] = this.father;
    data['mother'] = this.mother;
    data['section'] = this.section;
    data['reg_uni'] = this.regUni;
    data['year'] = this.year;
    data['course_name'] = this.courseName;
    data['course_year'] = this.courseYear;
    data['chapter'] = this.chapter;
    data['teach'] = this.teach;
    data['state'] = this.state;
    return data;
  }
}
