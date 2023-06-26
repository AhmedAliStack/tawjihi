/// data : [{"id:1,"title":"امتحان الشهر 1","half_id":0,"start_date":"2023-05-20","start_time":"03:10:00","end_date":"2024-05-22","end_time":"04:11:00","time":"60","try":288888,"random":0}]
/// meta : {"total":1,"current_page":1}
/// response : 200

class ExamsByTeacherModel {
  ExamsByTeacherModel({
    this.data,
    this.activeExam,
    this.meta,
    this.response,
  });

  ExamsByTeacherModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
    activeExam = json['active_exam'];

    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    response = json['response'];
  }
  List<Data>? data;
  int? activeExam;
  Meta? meta;
  int? response;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    map['active_exam'] = activeExam;

    if (meta != null) {
      map['meta'] = meta?.toJson();
    }
    map['response'] = response;
    return map;
  }
}

/// total : 1
/// current_page : 1

class Meta {
  Meta({
    this.total,
    this.currentPage,
  });

  Meta.fromJson(dynamic json) {
    total = json['total'];
    currentPage = json['current_page'];
  }
  int? total;
  int? currentPage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total'] = total;
    map['current_page'] = currentPage;
    return map;
  }
}

/// id : 1
/// title : "امتحان الشهر 1"
/// half_id : 0
/// start_date : "2023-05-20"
/// start_time : "03:10:00"
/// end_date : "2024-05-22"
/// end_time : "04:11:00"
/// time : "60"
/// try : 288888
/// random : 0

class Data {
  Data({
    this.id,
    this.title,
    this.halfId,
    this.startDate,
    this.startTime,
    this.endDate,
    this.endTime,
    this.time,
    this.tryExam,
    this.random,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    halfId = json['half_id'];
    startDate = json['start_date'];
    startTime = json['start_time'];
    endDate = json['end_date'];
    endTime = json['end_time'];
    time = json['time'];
    tryExam = json['try'];
    random = json['random'];
  }
  int? id;
  String? title;
  int? halfId;
  String? startDate;
  String? startTime;
  String? endDate;
  String? endTime;
  String? time;
  int? tryExam;
  int? random;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['half_id'] = halfId;
    map['start_date'] = startDate;
    map['start_time'] = startTime;
    map['end_date'] = endDate;
    map['end_time'] = endTime;
    map['time'] = time;
    map['try'] = tryExam;
    map['random'] = random;
    return map;
  }
}
