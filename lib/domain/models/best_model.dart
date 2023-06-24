/// status : 200
/// data : {"students":[{"user_id":1,"avg_rate":"10.0","name":"Mohamed"},{"user_id":10,"avg_rate":"0.0","name":"Mohamed"},{"user_id":5,"avg_rate":"0.0","name":"mohamed salem"},{"user_id":18,"avg_rate":"0.0","name":"mohamed ebrahem"}],"student_order":3,"activity":"20%"}

class BestModel {
  BestModel({
    this.status,
    this.data,
  });

  BestModel.fromJson(dynamic json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  int? status;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

/// students : [{"user_id":1,"avg_rate":"10.0","name":"Mohamed"},{"user_id":10,"avg_rate":"0.0","name":"Mohamed"},{"user_id":5,"avg_rate":"0.0","name":"mohamed salem"},{"user_id":18,"avg_rate":"0.0","name":"mohamed ebrahem"}]
/// student_order : 3
/// activity : "20%"

class Data {
  Data({
    this.students,
    this.studentOrder,
    this.activity,
  });

  Data.fromJson(dynamic json) {
    if (json['students'] != null) {
      students = [];
      json['students'].forEach((v) {
        students?.add(Students.fromJson(v));
      });
    }
    studentOrder = json['student_order'];
    activity = json['activity'];
  }
  List<Students>? students;
  int? studentOrder;
  String? activity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (students != null) {
      map['students'] = students?.map((v) => v.toJson()).toList();
    }
    map['student_order'] = studentOrder;
    map['activity'] = activity;
    return map;
  }
}

/// user_id : 1
/// avg_rate : "10.0"
/// name : "Mohamed"

class Students {
  Students({
    this.userId,
    this.avgRate,
    this.name,
  });

  Students.fromJson(dynamic json) {
    userId = json['user_id'];
    avgRate = json['avg_rate'];
    name = json['name'];
  }
  int? userId;
  String? avgRate;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = userId;
    map['avg_rate'] = avgRate;
    map['name'] = name;
    return map;
  }
}
