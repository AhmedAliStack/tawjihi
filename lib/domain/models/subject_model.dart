/// status : 200
/// data : [{"id":2,"title":"الفيزياء","year_id":1,"term_id":2,"image":"http://www.tawjihiquiz.com/uploaded/subjects/1684065723.png"}]

class SubjectModel {
  SubjectModel({
    this.status,
    this.data,
  });

  SubjectModel.fromJson(dynamic json) {
    status = json['status'];
    if (json['data'] != null) {
      data = [];
      json['data']['data'].forEach((v) {
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
/// title : "الفيزياء"
/// year_id : 1
/// term_id : 2
/// image : "http://www.tawjihiquiz.com/uploaded/subjects/1684065723.png"

class Data {
  Data({
    this.id,
    this.title,
    this.yearId,
    this.termId,
    this.image,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    yearId = json['year_id'];
    termId = json['term_id'];
    image = json['image'];
  }
  int? id;
  String? title;
  int? yearId;
  int? termId;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['year_id'] = yearId;
    map['term_id'] = termId;
    map['image'] = image;
    return map;
  }
}
