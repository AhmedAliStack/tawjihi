/// response : 200
/// exam_description : "ومن هنا وجب على المصمم أن يضع نصوصا مؤقتة على التصميم ليظهر للعميل الشكل كاملاً،دور مولد النص العربى أن يوفر على المصمم عناء البحث عن نص بديل لا علاقة له بالموضوع الذى يتحدث عنه التصميم فيظهر بشكل لا يليق."
/// questions : [{"id":1,"question":"<p>لماذا</p>","exam_id":1,"answer":"0","feedback":"1684537988.mp3","question_type":"0","type":"صح وخطأ"},{"id":2,"question":"<p>ماهو&nbsp;</p>","exam_id":1,"answer":[{"key":"1","value":"1"},{"value":"2"},{"value":"3"},{"value":"4"}],"feedback":"<p><a href=\"https://youtu.be/33x6XFyWXo8\" onclick=\"window.open(this.href, '', 'resizable=no,status=no,location=no,toolbar=no,menubar=no,fullscreen=no,scrollbars=no,dependent=no'); return false;\">click here&nbsp;</a></p>","question_type":"1","type":"اختياري"},{"id":3,"question":"<p>where is&nbsp;</p>","exam_id":1,"answer":[{"key":"0","value":"1"},{"value":"2"},{"key":"2","value":"3"},{"value":"4"}],"feedback":"<p>is there any answer&nbsp;</p>","question_type":"2","type":"اكثر من اختيار"},{"id":4,"question":"<p>which is&nbsp;</p>","exam_id":1,"answer":[{"value":"1684538409.png"},{"key":1,"value":"1684538409.png"},{"value":"1684538409.png"},{"value":"1684538409.png"}],"feedback":"<p>saDFdafdafda</p>","question_type":"3","type":"سؤال صوره"}]
/// result_id : 16
/// meta : {"total":4,"current_page":1}

class QuestionsModel {
  QuestionsModel({
    this.response,
    this.examDescription,
    this.questions,
    this.resultId,
    this.meta,
  });

  QuestionsModel.fromJson(dynamic json) {
    response = json['response'];
    examDescription = json['exam_description'];
    if (json['questions'] != null) {
      questions = [];
      json['questions'].forEach((v) {
        questions?.add(Questions.fromJson(v));
      });
    }
    resultId = json['result_id'];
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }
  int? response;
  String? examDescription;
  List<Questions>? questions;
  int? resultId;
  Meta? meta;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['response'] = response;
    map['exam_description'] = examDescription;
    if (questions != null) {
      map['questions'] = questions?.map((v) => v.toJson()).toList();
    }
    map['result_id'] = resultId;
    if (meta != null) {
      map['meta'] = meta?.toJson();
    }
    return map;
  }
}

/// total : 4
/// current_page : 1

class Meta {
  Meta({
    this.total,
    this.currentPage,
  });

  Meta.fromJson(dynamic json) {
    total = json['total'];
    currentPage = json['current_page'];
  }
  int? total;
  int? currentPage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total'] = total;
    map['current_page'] = currentPage;
    return map;
  }
}

/// id : 1
/// question : "<p>لماذا</p>"
/// exam_id : 1
/// answer : "0"
/// feedback : "1684537988.mp3"
/// question_type : "0"
/// type : "صح وخطأ"

class Questions {
  Questions({
    this.id,
    this.question,
    this.examId,
    this.answer,
    this.feedback,
    this.questionType,
    this.type,
  });

  Questions.fromJson(dynamic json) {
    id = json['id'];
    question = json['question'];
    examId = json['exam_id'];
    answer = json['answer'];
    feedback = json['feedback'];
    questionType = json['question_type'];
    type = json['type'];
  }
  int? id;
  String? question;
  int? examId;
  dynamic answer;
  String? feedback;
  String? questionType;
  String? type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['question'] = question;
    map['exam_id'] = examId;
    map['answer'] = answer;
    map['feedback'] = feedback;
    map['question_type'] = questionType;
    map['type'] = type;
    return map;
  }
}
