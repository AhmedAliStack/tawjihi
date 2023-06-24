/// data : [{"id":1,"user":{"name":"Mohamed","first_name":"aaaaa","last_name":"dddddd","phone":"012125459885","nationality":"Egyptian","country_id":1,"manhag_id":1,"term_id":2,"subject_type_id":2,"score":0},"teacher":{"id":2,"name":"محمد علي","email":"mohammad@gmail.com","nationality":"jordan","country_id":2,"manhag_id":2,"year_id":1,"age":30,"bio":"مدرس متخصص بتدريس الياضيات بخبرة تتجاوز 10 سنوات و نتائج طلاب مبهرة في الثانوية","cv":null,"average":0,"rate":0,"exams_count":0,"subjects":[{"id":3,"title":"الرياضيات","year_id":1,"term_id":2,"subjecttype_id":2,"created_at":"2023-05-14T12:02:37.000000Z","updated_at":"2023-05-14T12:02:37.000000Z","manhag_id":2,"half_id":0,"pic":"1684065757.png","date":"2022-2023","pivot":{"teacher_id":2,"subjects_id":3}}],"subject":"الرياضيات"},"last_message":{"id":4,"message":"Hello again3","sender":0,"teacher_id":2,"is_read":1,"conversation_id":1,"created_at":"2023-06-23 00:33:rd"},"created_at":"2023-06-23 00:33:57"},{"id":2,"user":{"name":"Mohamed","first_name":"aaaaa","last_name":"dddddd","phone":"012125459885","nationality":"Egyptian","country_id":1,"manhag_id":1,"term_id":2,"subject_type_id":2,"score":0},"teacher":{"id":1,"name":"Maryam Estrada","email":"vopihi@mailinator.com","nationality":"Eiusmod et sed est i","country_id":1,"manhag_id":1,"year_id":1,"age":0,"bio":"Amet eiusmod eiusmo","cv":null,"average":0,"rate":0,"exams_count":0,"subjects":[{"id":1,"title":"ماده العلوم","year_id":1,"term_id":1,"subjecttype_id":1,"created_at":"2023-01-07T19:10:42.000000Z","updated_at":"2023-01-07T19:10:42.000000Z","manhag_id":1,"half_id":0,"pic":"1673118642.jpg","date":"2022-2023","pivot":{"teacher_id":1,"subjects_id":1}}],"subject":"ماده العلوم"},"last_message":{"id":5,"message":"Hello again4","sender":0,"teacher_id":1,"is_read":1,"conversation_id":2,"created_at":"2023-06-23 00:39:rd"},"created_at":"2023-06-23 00:39:01"},{"id":3,"user":{"name":"Mohamed","first_name":"aaaaa","last_name":"dddddd","phone":"012125459885","nationality":"Egyptian","country_id":1,"manhag_id":1,"term_id":2,"subject_type_id":2,"score":0},"teacher":{"id":3,"name":"مروان احمد","email":"marwan@em.com","nationality":"jordan","country_id":2,"manhag_id":2,"year_id":1,"age":30,"bio":"مدرس متخصص في تدريس الفيزياء للفرع العلمي","cv":null,"average":0,"rate":0,"exams_count":0,"subjects":[{"id":2,"title":"الفيزياء","year_id":1,"term_id":2,"subjecttype_id":2,"created_at":"2023-05-14T12:02:03.000000Z","updated_at":"2023-05-14T12:02:03.000000Z","manhag_id":2,"half_id":0,"pic":"1684065723.png","date":"2022-2023","pivot":{"teacher_id":3,"subjects_id":2}}],"subject":"الفيزياء"},"last_message":{"id":7,"message":"salem test","sender":0,"teacher_id":3,"is_read":1,"conversation_id":3,"created_at":"2023-06-23 00:45:rd"},"created_at":"2023-06-23 00:39:32"}]
/// response : 200

class ConverstionsModel {
  ConverstionsModel({
    this.data,
    this.response,
  });

  ConverstionsModel.fromJson(dynamic json) {
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

/// id : 1
/// user : {"name":"Mohamed","first_name":"aaaaa","last_name":"dddddd","phone":"012125459885","nationality":"Egyptian","country_id":1,"manhag_id":1,"term_id":2,"subject_type_id":2,"score":0}
/// teacher : {"id":2,"name":"محمد علي","email":"mohammad@gmail.com","nationality":"jordan","country_id":2,"manhag_id":2,"year_id":1,"age":30,"bio":"مدرس متخصص بتدريس الياضيات بخبرة تتجاوز 10 سنوات و نتائج طلاب مبهرة في الثانوية","cv":null,"average":0,"rate":0,"exams_count":0,"subjects":[{"id":3,"title":"الرياضيات","year_id":1,"term_id":2,"subjecttype_id":2,"created_at":"2023-05-14T12:02:37.000000Z","updated_at":"2023-05-14T12:02:37.000000Z","manhag_id":2,"half_id":0,"pic":"1684065757.png","date":"2022-2023","pivot":{"teacher_id":2,"subjects_id":3}}],"subject":"الرياضيات"}
/// last_message : {"id":4,"message":"Hello again3","sender":0,"teacher_id":2,"is_read":1,"conversation_id":1,"created_at":"2023-06-23 00:33:rd"}
/// created_at : "2023-06-23 00:33:57"

class Data {
  Data({
    this.id,
    this.user,
    this.teacher,
    this.lastMessage,
    this.createdAt,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    teacher =
        json['teacher'] != null ? Teacher.fromJson(json['teacher']) : null;
    lastMessage = json['last_message'] != null
        ? LastMessage.fromJson(json['last_message'])
        : null;
    createdAt = json['created_at'];
  }
  int? id;
  User? user;
  Teacher? teacher;
  LastMessage? lastMessage;
  String? createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    if (teacher != null) {
      map['teacher'] = teacher?.toJson();
    }
    if (lastMessage != null) {
      map['last_message'] = lastMessage?.toJson();
    }
    map['created_at'] = createdAt;
    return map;
  }
}

/// id : 4
/// message : "Hello again3"
/// sender : 0
/// teacher_id : 2
/// is_read : 1
/// conversation_id : 1
/// created_at : "2023-06-23 00:33:rd"

class LastMessage {
  LastMessage({
    this.id,
    this.message,
    this.sender,
    this.teacherId,
    this.isRead,
    this.conversationId,
    this.createdAt,
  });

  LastMessage.fromJson(dynamic json) {
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

/// id : 2
/// name : "محمد علي"
/// email : "mohammad@gmail.com"
/// nationality : "jordan"
/// country_id : 2
/// manhag_id : 2
/// year_id : 1
/// age : 30
/// bio : "مدرس متخصص بتدريس الياضيات بخبرة تتجاوز 10 سنوات و نتائج طلاب مبهرة في الثانوية"
/// cv : null
/// average : 0
/// rate : 0
/// exams_count : 0
/// subjects : [{"id":3,"title":"الرياضيات","year_id":1,"term_id":2,"subjecttype_id":2,"created_at":"2023-05-14T12:02:37.000000Z","updated_at":"2023-05-14T12:02:37.000000Z","manhag_id":2,"half_id":0,"pic":"1684065757.png","date":"2022-2023","pivot":{"teacher_id":2,"subjects_id":3}}]
/// subject : "الرياضيات"

class Teacher {
  Teacher({
    this.id,
    this.name,
    this.email,
    this.nationality,
    this.countryId,
    this.manhagId,
    this.yearId,
    this.age,
    this.bio,
    this.cv,
    this.average,
    this.rate,
    this.examsCount,
    this.subjects,
    this.subject,
  });

  Teacher.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    nationality = json['nationality'];
    countryId = json['country_id'];
    manhagId = json['manhag_id'];
    yearId = json['year_id'];
    age = json['age'];
    bio = json['bio'];
    cv = json['cv'];
    average = json['average'];
    rate = json['rate'];
    examsCount = json['exams_count'];
    if (json['subjects'] != null) {
      subjects = [];
      json['subjects'].forEach((v) {
        subjects?.add(Subjects.fromJson(v));
      });
    }
    subject = json['subject'];
  }
  int? id;
  String? name;
  String? email;
  String? nationality;
  int? countryId;
  int? manhagId;
  int? yearId;
  int? age;
  String? bio;
  dynamic cv;
  int? average;
  int? rate;
  int? examsCount;
  List<Subjects>? subjects;
  String? subject;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['nationality'] = nationality;
    map['country_id'] = countryId;
    map['manhag_id'] = manhagId;
    map['year_id'] = yearId;
    map['age'] = age;
    map['bio'] = bio;
    map['cv'] = cv;
    map['average'] = average;
    map['rate'] = rate;
    map['exams_count'] = examsCount;
    if (subjects != null) {
      map['subjects'] = subjects?.map((v) => v.toJson()).toList();
    }
    map['subject'] = subject;
    return map;
  }
}

/// id : 3
/// title : "الرياضيات"
/// year_id : 1
/// term_id : 2
/// subjecttype_id : 2
/// created_at : "2023-05-14T12:02:37.000000Z"
/// updated_at : "2023-05-14T12:02:37.000000Z"
/// manhag_id : 2
/// half_id : 0
/// pic : "1684065757.png"
/// date : "2022-2023"
/// pivot : {"teacher_id":2,"subjects_id":3}

class Subjects {
  Subjects({
    this.id,
    this.title,
    this.yearId,
    this.termId,
    this.subjecttypeId,
    this.createdAt,
    this.updatedAt,
    this.manhagId,
    this.halfId,
    this.pic,
    this.date,
    this.pivot,
  });

  Subjects.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    yearId = json['year_id'];
    termId = json['term_id'];
    subjecttypeId = json['subjecttype_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    manhagId = json['manhag_id'];
    halfId = json['half_id'];
    pic = json['pic'];
    date = json['date'];
    pivot = json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null;
  }
  int? id;
  String? title;
  int? yearId;
  int? termId;
  int? subjecttypeId;
  String? createdAt;
  String? updatedAt;
  int? manhagId;
  int? halfId;
  String? pic;
  String? date;
  Pivot? pivot;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['year_id'] = yearId;
    map['term_id'] = termId;
    map['subjecttype_id'] = subjecttypeId;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['manhag_id'] = manhagId;
    map['half_id'] = halfId;
    map['pic'] = pic;
    map['date'] = date;
    if (pivot != null) {
      map['pivot'] = pivot?.toJson();
    }
    return map;
  }
}

/// teacher_id : 2
/// subjects_id : 3

class Pivot {
  Pivot({
    this.teacherId,
    this.subjectsId,
  });

  Pivot.fromJson(dynamic json) {
    teacherId = json['teacher_id'];
    subjectsId = json['subjects_id'];
  }
  int? teacherId;
  int? subjectsId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['teacher_id'] = teacherId;
    map['subjects_id'] = subjectsId;
    return map;
  }
}

/// name : "Mohamed"
/// first_name : "aaaaa"
/// last_name : "dddddd"
/// phone : "012125459885"
/// nationality : "Egyptian"
/// country_id : 1
/// manhag_id : 1
/// term_id : 2
/// subject_type_id : 2
/// score : 0

class User {
  User({
    this.name,
    this.firstName,
    this.lastName,
    this.phone,
    this.nationality,
    this.countryId,
    this.manhagId,
    this.termId,
    this.subjectTypeId,
    this.score,
  });

  User.fromJson(dynamic json) {
    name = json['name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phone = json['phone'];
    nationality = json['nationality'];
    countryId = json['country_id'];
    manhagId = json['manhag_id'];
    termId = json['term_id'];
    subjectTypeId = json['subject_type_id'];
    score = json['score'];
  }
  String? name;
  String? firstName;
  String? lastName;
  String? phone;
  String? nationality;
  int? countryId;
  int? manhagId;
  int? termId;
  int? subjectTypeId;
  int? score;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['phone'] = phone;
    map['nationality'] = nationality;
    map['country_id'] = countryId;
    map['manhag_id'] = manhagId;
    map['term_id'] = termId;
    map['subject_type_id'] = subjectTypeId;
    map['score'] = score;
    return map;
  }
}
