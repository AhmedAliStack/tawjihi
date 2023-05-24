/// user : {"id":10,"name":"محمد ابراهيم","image":null,"code":"","created_at":"2023-05-20T19:57:07.000000Z","updated_at":"2023-05-20T19:57:07.000000Z","deleted_at":null,"first_name":"محمد","last_name":"ابراهيم","phone":"01007054552","commercial_reg_num":null,"nationality":"مصرى","country_id":1,"manhag_id":2,"term_id":2,"subject_type_id":null,"device_token":null,"score":0,"email":"mohamed.ebrahem6666@gmail.com","otp":null,"otp_expired_at":null}
/// token : "20|D8PJ9EyL0bUPfDbizRREauN4Xt2KX8lIckXGq9sq"

class UserModel {
  UserModel({
    this.user,
    this.token,
  });

  UserModel.fromJson(dynamic json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }
  User? user;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }
}

/// id : 10
/// name : "محمد ابراهيم"
/// image : null
/// code : ""
/// created_at : "2023-05-20T19:57:07.000000Z"
/// updated_at : "2023-05-20T19:57:07.000000Z"
/// deleted_at : null
/// first_name : "محمد"
/// last_name : "ابراهيم"
/// phone : "01007054552"
/// commercial_reg_num : null
/// nationality : "مصرى"
/// country_id : 1
/// manhag_id : 2
/// term_id : 2
/// subject_type_id : null
/// device_token : null
/// score : 0
/// email : "mohamed.ebrahem6666@gmail.com"
/// otp : null
/// otp_expired_at : null

class User {
  User({
    this.id,
    this.name,
    this.image,
    this.code,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.firstName,
    this.lastName,
    this.phone,
    this.commercialRegNum,
    this.nationality,
    this.countryId,
    this.manhagId,
    this.termId,
    this.subjectTypeId,
    this.deviceToken,
    this.score,
    this.email,
    this.otp,
    this.otpExpiredAt,
  });

  User.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    code = json['code'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phone = json['phone'];
    commercialRegNum = json['commercial_reg_num'];
    nationality = json['nationality'];
    countryId = json['country_id'];
    manhagId = json['manhag_id'];
    termId = json['term_id'];
    subjectTypeId = json['subject_type_id'];
    deviceToken = json['device_token'];
    score = json['score'];
    email = json['email'];
    otp = json['otp'];
    otpExpiredAt = json['otp_expired_at'];
  }
  int? id;
  String? name;
  dynamic image;
  String? code;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  String? firstName;
  String? lastName;
  String? phone;
  dynamic commercialRegNum;
  String? nationality;
  int? countryId;
  int? manhagId;
  int? termId;
  dynamic subjectTypeId;
  dynamic deviceToken;
  int? score;
  String? email;
  dynamic otp;
  dynamic otpExpiredAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['image'] = image;
    map['code'] = code;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['deleted_at'] = deletedAt;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['phone'] = phone;
    map['commercial_reg_num'] = commercialRegNum;
    map['nationality'] = nationality;
    map['country_id'] = countryId;
    map['manhag_id'] = manhagId;
    map['term_id'] = termId;
    map['subject_type_id'] = subjectTypeId;
    map['device_token'] = deviceToken;
    map['score'] = score;
    map['email'] = email;
    map['otp'] = otp;
    map['otp_expired_at'] = otpExpiredAt;
    return map;
  }
}
