/// status : 200
/// data : {"countries":[{"id":1,"name":"Egypt","flag":"null","deleted_at":null,"created_at":"2023-01-07T16:46:31.000000Z","updated_at":"2023-01-07T16:46:31.000000Z"}],"manhags":[{"id":1,"country_id":1,"title":"وزاري","created_at":"2023-01-07T16:46:31.000000Z","updated_at":"2023-01-07T16:46:31.000000Z"}],"terms":[{"id":1,"title":"الصف العاشر","year_id":1,"created_at":"2023-01-07T16:46:31.000000Z","updated_at":"2023-01-07T16:46:31.000000Z"}],"types":[{"id":1,"title":"الفرع العلمي","year_id":null,"term_id":1,"created_at":"2023-01-07T19:10:04.000000Z","updated_at":"2023-01-07T19:10:04.000000Z"}]}

class AllListsModel {
  AllListsModel({
    this.status,
    this.data,
  });

  AllListsModel.fromJson(dynamic json) {
    status = json['status'] ?? 200;
    data = json['data'] != null ? ListData.fromJson(json['data']) : null;
  }
  int? status;
  ListData? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

/// countries : [{"id":1,"name":"Egypt","flag":"null","deleted_at":null,"created_at":"2023-01-07T16:46:31.000000Z","updated_at":"2023-01-07T16:46:31.000000Z"}]
/// manhags : [{"id":1,"country_id":1,"title":"وزاري","created_at":"2023-01-07T16:46:31.000000Z","updated_at":"2023-01-07T16:46:31.000000Z"}]
/// terms : [{"id":1,"title":"الصف العاشر","year_id":1,"created_at":"2023-01-07T16:46:31.000000Z","updated_at":"2023-01-07T16:46:31.000000Z"}]
/// types : [{"id":1,"title":"الفرع العلمي","year_id":null,"term_id":1,"created_at":"2023-01-07T19:10:04.000000Z","updated_at":"2023-01-07T19:10:04.000000Z"}]

class ListData {
  ListData({
    this.countries,
    this.manhags,
    this.terms,
    this.types,
  });

  ListData.fromJson(dynamic json) {
    if (json['countries'] != null) {
      countries = [];
      json['countries'].forEach((v) {
        countries?.add(Countries.fromJson(v));
      });
    }
    if (json['manhags'] != null) {
      manhags = [];
      json['manhags'].forEach((v) {
        manhags?.add(Manhags.fromJson(v));
      });
    }
    if (json['terms'] != null) {
      terms = [];
      json['terms'].forEach((v) {
        terms?.add(Terms.fromJson(v));
      });
    }
    if (json['types'] != null) {
      types = [];
      json['types'].forEach((v) {
        types?.add(Types.fromJson(v));
      });
    }
    if (json['years'] != null) {
      years = [];
      json['years'].forEach((v) {
        years?.add(Years.fromJson(v));
      });
    }
  }
  List<Countries>? countries;
  List<Manhags>? manhags;
  List<Terms>? terms;
  List<Types>? types;
  List<Years>? years;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (countries != null) {
      map['countries'] = countries?.map((v) => v.toJson()).toList();
    }
    if (manhags != null) {
      map['manhags'] = manhags?.map((v) => v.toJson()).toList();
    }
    if (terms != null) {
      map['terms'] = terms?.map((v) => v.toJson()).toList();
    }
    if (types != null) {
      map['types'] = types?.map((v) => v.toJson()).toList();
    }
    if (types != null) {
      map['years'] = years?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 1
/// title : "الفرع العلمي"
/// year_id : null
/// term_id : 1
/// created_at : "2023-01-07T19:10:04.000000Z"
/// updated_at : "2023-01-07T19:10:04.000000Z"

class Types {
  Types({
    this.id,
    this.title,
    this.yearId,
    this.termId,
    this.createdAt,
    this.updatedAt,
  });

  Types.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    yearId = json['year_id'];
    termId = json['term_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? title;
  dynamic yearId;
  int? termId;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['year_id'] = yearId;
    map['term_id'] = termId;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}

/// id : 1
/// title : "الصف العاشر"
/// year_id : 1
/// created_at : "2023-01-07T16:46:31.000000Z"
/// updated_at : "2023-01-07T16:46:31.000000Z"

class Terms {
  Terms({
    this.id,
    this.title,
    this.yearId,
    this.createdAt,
    this.updatedAt,
  });

  Terms.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    yearId = json['year_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? title;
  int? yearId;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['year_id'] = yearId;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}

/// id : 1
/// country_id : 1
/// title : "وزاري"
/// created_at : "2023-01-07T16:46:31.000000Z"
/// updated_at : "2023-01-07T16:46:31.000000Z"

class Manhags {
  Manhags({
    this.id,
    this.countryId,
    this.title,
    this.createdAt,
    this.updatedAt,
  });

  Manhags.fromJson(dynamic json) {
    id = json['id'];
    countryId = json['country_id'];
    title = json['title'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  int? countryId;
  String? title;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['country_id'] = countryId;
    map['title'] = title;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}

/// id : 1
/// name : "Egypt"
/// flag : "null"
/// deleted_at : null
/// created_at : "2023-01-07T16:46:31.000000Z"
/// updated_at : "2023-01-07T16:46:31.000000Z"

class Countries {
  Countries({
    this.id,
    this.name,
    this.flag,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  Countries.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    flag = json['flag'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? name;
  String? flag;
  dynamic deletedAt;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['flag'] = flag;
    map['deleted_at'] = deletedAt;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}

/// id : 1
/// title : "المرحلة الثانوية"
/// created_at : "2023-01-07T16:46:31.000000Z"
/// updated_at : "2023-01-07T16:46:31.000000Z"

class Years {
  Years({
    this.id,
    this.title,
    this.createdAt,
    this.updatedAt,
  });

  Years.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? title;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}
// {
// "id": 2,
// "title": "الصف الثاني عشر",
// "year_id": 1,
// "created_at": "2023-05-14T11:56:14.000000Z",
// "updated_at": "2023-05-14T11:56:14.000000Z",
// "deleted_at": null
// },

class TermsById {
  TermsById({
    this.id,
    this.title,
    this.createdAt,
    this.updatedAt,
  });

  TermsById.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    yearId = json['year_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  int? yearId;
  String? title;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['year_id'] = yearId;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}
