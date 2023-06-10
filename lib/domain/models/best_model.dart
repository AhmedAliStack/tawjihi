/// status : 200
/// data : [{"user_id":10,"avg_rate":"0.0","name":"محمد ابراهيم"},{"user_id":5,"avg_rate":"0.0","name":"mohamed salem"},{"user_id":1,"avg_rate":"0.0","name":"mohamed salem"}]

class BestModel {
  BestModel({
    this.status,
    this.data,
  });

  BestModel.fromJson(dynamic json) {
    status = json['status'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  int? status;
  List<Data>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// user_id : 10
/// avg_rate : "0.0"
/// name : "محمد ابراهيم"

class Data {
  Data({
    this.userId,
    this.avgRate,
    this.name,
  });

  Data.fromJson(dynamic json) {
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
