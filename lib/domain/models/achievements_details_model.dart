/// status : 200
/// data : {"total":0,"subject":"الرياضيات","exams":[{"exam":"امتحان الشهر 1","result":0,"total":2,"percent":0}]}

class AchievementsDetailsModel {
  AchievementsDetailsModel({
    this.status,
    this.data,
  });

  AchievementsDetailsModel.fromJson(dynamic json) {
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
/// subject : "الرياضيات"
/// exams : [{"exam":"امتحان الشهر 1","result":0,"total":2,"percent":0}]

class Data {
  Data({
    this.total,
    this.subject,
    this.level,
    this.exams,
  });

  Data.fromJson(dynamic json) {
    total = json['total'];
    level = json['level'];

    subject = json['subject'];
    if (json['exams'] != null) {
      exams = [];
      json['exams'].forEach((v) {
        exams?.add(Exams.fromJson(v));
      });
    }
  }
  num? total;
  String? level;
  String? subject;
  List<Exams>? exams;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total'] = total;
    map['level'] = level;

    map['subject'] = subject;
    if (exams != null) {
      map['exams'] = exams?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// exam : "امتحان الشهر 1"
/// result : 0
/// total : 2
/// percent : 0

class Exams {
  Exams({
    this.exam,
    this.result,
    int? resultId,
    this.total,
    this.percent,
  });

  Exams.fromJson(dynamic json) {
    exam = json['exam'];
    result = json['result'];
    resultId = json['result_id'];

    total = json['total'];
    percent = json['percent'];
  }
  String? exam;
  String? result;
  int? resultId;
  int? total;
  num? percent;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['exam'] = exam;
    map['result'] = result;
    map['result_id'] = resultId;
    map['total'] = total;
    map['percent'] = percent;
    return map;
  }
}
