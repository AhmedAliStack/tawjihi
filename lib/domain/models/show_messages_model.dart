/// data : [{"id":7,"message":"salem test","sender":0,"teacher_id":3,"is_read":1,"conversation_id":3,"created_at":"2023-06-23 00:45:rd"},{"id":6,"message":"Hello again4","sender":0,"teacher_id":3,"is_read":1,"conversation_id":3,"created_at":"2023-06-23 00:39:rd"}]
/// response : 200

class ShowMessages {
  ShowMessages({
    this.data,
    this.response,
  });

  ShowMessages.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
    response = json['response'];
  }
  List<Data>? data;
  int? response;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    map['response'] = response;
    return map;
  }
}

/// id : 7
/// message : "salem test"
/// sender : 0
/// teacher_id : 3
/// is_read : 1
/// conversation_id : 3
/// created_at : "2023-06-23 00:45:rd"

class Data {
  Data({
    this.id,
    this.message,
    this.sender,
    this.teacherId,
    this.isRead,
    this.conversationId,
    this.createdAt,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    message = json['message'];
    sender = json['sender'];
    teacherId = json['teacher_id'];
    isRead = json['is_read'];
    conversationId = json['conversation_id'];
    createdAt = json['created_at'];
  }
  int? id;
  String? message;
  int? sender;
  int? teacherId;
  int? isRead;
  int? conversationId;
  String? createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['message'] = message;
    map['sender'] = sender;
    map['teacher_id'] = teacherId;
    map['is_read'] = isRead;
    map['conversation_id'] = conversationId;
    map['created_at'] = createdAt;
    return map;
  }
}
