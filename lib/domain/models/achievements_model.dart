/// status : 200
/// data : {"total":0,"level":"منخفض","subjects":[{"subject_id":3,"total":2,"percent":0,"result":0,"teacher_name":"محمد علي","subject":"الرياضيات"}]}

class AchievementsModel {
  AchievementsModel({
    this.status,
    this.data,
  });

  AchievementsModel.fromJson(dynamic json) {
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

/// total : 0
/// subjects : [{"subject_id":3,"total":2,"percent":0,"result":0,"teacher_name":"محمد علي","subject":"الرياضيات"}]

class Data {
  Data({
    this.total,
    this.level,
    this.subjects,
  });

  Data.fromJson(dynamic json) {
    total = json['total'];
    level = json['level'];

    if (json['subjects'] != null) {
      subjects = [];
      json['subjects'].forEach((v) {
        subjects?.add(Subjects.fromJson(v));
      });
    }
  }
  int? total;
  String? level;
  List<Subjects>? subjects;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total'] = total;
    map['level'] = level;
    if (subjects != null) {
      map['subjects'] = subjects?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// subject_id : 3
/// total : 2
/// percent : 0
/// result : 0
/// teacher_name : "محمد علي"
/// subject : "الرياضيات"

class Subjects {
  Subjects({
    this.subjectId,
    this.total,
    this.percent,
    this.result,
    this.teacherName,
    this.subject,
  });

  Subjects.fromJson(dynamic json) {
    subjectId = json['subject_id'];
    total = json['total'];
    percent = json['percent'];
    result = json['result'];
    teacherName = json['teacher_name'];
    subject = json['subject'];
  }
  int? subjectId;
  int? total;
  int? percent;
  int? result;
  String? teacherName;
  String? subject;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['subject_id'] = subjectId;
    map['total'] = total;
    map['percent'] = percent;
    map['result'] = result;
    map['teacher_name'] = teacherName;
    map['subject'] = subject;
    return map;
  }
}
