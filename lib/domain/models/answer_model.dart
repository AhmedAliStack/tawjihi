class AnswerModel {
  String? key;
  String? value;

  AnswerModel({this.key, this.value});

  AnswerModel.fromJson(Map<String, dynamic> json) {
    key = json['key'].toString();
    value = json['value'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['key'] = key;
    data['value'] = value;
    return data;
  }
}
