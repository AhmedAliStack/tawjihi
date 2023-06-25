class AnswerModel {
  dynamic key;
  String? value;

  AnswerModel({this.key, this.value});

  AnswerModel.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    value = json['value'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['key'] = key;
    data['value'] = value;
    return data;
  }
}
