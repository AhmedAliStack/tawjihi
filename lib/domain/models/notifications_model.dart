/// status : 200
/// data : [{"id":1,"message":"test","read":0,"data":null},{"id":2,"message":"test 1","read":0,"data":null}]

class NotificationsModel {
  NotificationsModel({
    this.status,
    this.data,
  });

  NotificationsModel.fromJson(dynamic json) {
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

/// id : 1
/// message : "test"
/// read : 0
/// data : null

class Data {
  Data({
    this.id,
    this.message,
    this.read,
    this.data,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    message = json['message'];
    read = json['read'];
    data = json['data'];
  }
  int? id;
  String? message;
  int? read;
  dynamic data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['message'] = message;
    map['read'] = read;
    map['data'] = data;
    return map;
  }
}
