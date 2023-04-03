/// data : {"user":{"name":"Ahmed Wagdy","first_name":"Ahmed","last_name":"Wagdy","phone":"01445896244","nationality":"saudi","country_id":"1","manhag_id":"1","term_id":"1","updated_at":"2023-04-01T19:41:14.000000Z","created_at":"2023-04-01T19:41:14.000000Z","id":3},"token":"4|N0eOzEcVdzaiO6CGDPRqL1fsAVrgsAqsphwgRgtf"}
/// status : 200

class UserModel {
  UserModel({
    this.data,
    this.status,
  });

  UserModel.fromJson(dynamic json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    status = json['status'];
  }
  Data? data;
  int? status;
}

/// user : {"name":"Ahmed Wagdy","first_name":"Ahmed","last_name":"Wagdy","phone":"01445896244","nationality":"saudi","country_id":"1","manhag_id":"1","term_id":"1","updated_at":"2023-04-01T19:41:14.000000Z","created_at":"2023-04-01T19:41:14.000000Z","id":3}
/// token : "4|N0eOzEcVdzaiO6CGDPRqL1fsAVrgsAqsphwgRgtf"

class Data {
  Data({
    this.user,
    this.token,
  });

  Data.fromJson(dynamic json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }
  User? user;
  String? token;
}

/// name : "Ahmed Wagdy"
/// first_name : "Ahmed"
/// last_name : "Wagdy"
/// phone : "01445896244"
/// nationality : "saudi"
/// country_id : "1"
/// manhag_id : "1"
/// term_id : "1"
/// updated_at : "2023-04-01T19:41:14.000000Z"
/// created_at : "2023-04-01T19:41:14.000000Z"
/// id : 3

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
    this.updatedAt,
    this.createdAt,
    this.id,
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
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }
  String? name;
  String? firstName;
  String? lastName;
  String? phone;
  String? nationality;
  String? countryId;
  String? manhagId;
  String? termId;
  String? updatedAt;
  String? createdAt;
  int? id;
}
