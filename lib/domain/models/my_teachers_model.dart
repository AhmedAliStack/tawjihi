/// status : 200
/// data : [{"id":2,"name":"محمد علي","email":"mohammad@gmail.com","nationality":"jordan","country_id":2,"manhag_id":2,"year_id":1,"age":30,"bio":"مدرس متخصص بتدريس الياضيات بخبرة تتجاوز 10 سنوات و نتائج طلاب مبهرة في الثانوية","cv":null,"average":0,"rate":null,"exams_count":1,"subjects":[{"id":3,"title":"الرياضيات","year_id":1,"term_id":2,"subjecttype_id":2,"created_at":"2023-05-14T12:02:37.000000Z","updated_at":"2023-05-14T12:02:37.000000Z","manhag_id":2,"half_id":0,"pic":"1684065757.png","date":"2022-2023","pivot":{"teacher_id":2,"subjects_id":3}}],"subject":"الرياضيات"},{"id":3,"name":"مروان احمد","email":"marwan@em.com","nationality":"jordan","country_id":2,"manhag_id":2,"year_id":1,"age":30,"bio":"مدرس متخصص في تدريس الفيزياء للفرع العلمي","cv":null,"average":0,"rate":null,"exams_count":0,"subjects":[{"id":2,"title":"الفيزياء","year_id":1,"term_id":2,"subjecttype_id":2,"created_at":"2023-05-14T12:02:03.000000Z","updated_at":"2023-05-14T12:02:03.000000Z","manhag_id":2,"half_id":0,"pic":"1684065723.png","date":"2022-2023","pivot":{"teacher_id":3,"subjects_id":2}}],"subject":"الفيزياء"},{"id":4,"name":"اسامة احمد","email":"osama@em.com","nationality":"jordan","country_id":2,"manhag_id":2,"year_id":1,"age":30,"bio":"مدرس متخصص في تدريس اللغة الفرنسية للفرع الفندقي","cv":null,"average":0,"rate":null,"exams_count":0,"subjects":[{"id":8,"title":"فرنسي","year_id":1,"term_id":2,"subjecttype_id":4,"created_at":"2023-05-14T12:04:24.000000Z","updated_at":"2023-05-14T12:04:24.000000Z","manhag_id":2,"half_id":0,"pic":"1684065864.jpg","date":"2022-2023","pivot":{"teacher_id":4,"subjects_id":8}}],"subject":"فرنسي"},{"id":5,"name":"سعد سالم","email":"saad@em.com","nationality":"jordan","country_id":2,"manhag_id":2,"year_id":1,"age":30,"bio":"مدرس متخصص في تدريس اللغة العربية لجميع الفروع","cv":null,"average":0,"rate":null,"exams_count":0,"subjects":[{"id":6,"title":"عربي","year_id":1,"term_id":2,"subjecttype_id":2,"created_at":"2023-05-14T12:03:44.000000Z","updated_at":"2023-05-14T12:03:44.000000Z","manhag_id":2,"half_id":0,"pic":"1684065824.jpg","date":"2022-2023","pivot":{"teacher_id":5,"subjects_id":6}},{"id":7,"title":"عربي","year_id":1,"term_id":2,"subjecttype_id":3,"created_at":"2023-05-14T12:04:03.000000Z","updated_at":"2023-05-14T12:04:03.000000Z","manhag_id":2,"half_id":0,"pic":"1684065843.jpg","date":"2022-2023","pivot":{"teacher_id":5,"subjects_id":7}},{"id":9,"title":"عربي","year_id":1,"term_id":2,"subjecttype_id":4,"created_at":"2023-05-14T12:04:39.000000Z","updated_at":"2023-05-14T12:04:39.000000Z","manhag_id":2,"half_id":0,"pic":"1684065879.jpg","date":"2022-2023","pivot":{"teacher_id":5,"subjects_id":9}},{"id":10,"title":"عربي","year_id":1,"term_id":2,"subjecttype_id":5,"created_at":"2023-05-14T12:05:16.000000Z","updated_at":"2023-05-14T12:05:16.000000Z","manhag_id":2,"half_id":0,"pic":"1684065916.jpg","date":"2022-2023","pivot":{"teacher_id":5,"subjects_id":10}}],"subject":"عربي"}]

class MyTeachersModel {
  MyTeachersModel({
    this.status,
    this.data,
  });

  MyTeachersModel.fromJson(dynamic json) {
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

/// id : 2
/// name : "محمد علي"
/// email : "mohammad@gmail.com"
/// nationality : "jordan"
/// country_id : 2
/// manhag_id : 2
/// year_id : 1
/// age : 30
/// image
/// bio : "مدرس متخصص بتدريس الياضيات بخبرة تتجاوز 10 سنوات و نتائج طلاب مبهرة في الثانوية"
/// cv : null
/// average : 0
/// rate : null
/// exams_count : 1
/// subjects : [{"id":3,"title":"الرياضيات","year_id":1,"term_id":2,"subjecttype_id":2,"created_at":"2023-05-14T12:02:37.000000Z","updated_at":"2023-05-14T12:02:37.000000Z","manhag_id":2,"half_id":0,"pic":"1684065757.png","date":"2022-2023","pivot":{"teacher_id":2,"subjects_id":3}}]
/// subject : "الرياضيات"

class Data {
  Data({
    this.id,
    this.name,
    this.email,
    this.nationality,
    this.countryId,
    this.manhagId,
    this.yearId,
    this.age,
    this.image,
    this.phone,
    this.studentCount,
    this.bio,
    this.cv,
    this.average,
    this.rate,
    this.examsCount,
    this.subjects,
    this.subject,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    nationality = json['nationality'];
    countryId = json['country_id'];
    manhagId = json['manhag_id'];
    yearId = json['year_id'];
    age = json['age'];
    image = json['image'];
    phone = json['phone'];
    studentCount = json['student_count'];
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
  String? image;
  int? phone;
  int? studentCount;
  String? bio;
  dynamic cv;
  int? average;
  dynamic rate;
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
    map['image'] = image;
    map['phone'] = phone;
    map['student_count'] = studentCount;
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
