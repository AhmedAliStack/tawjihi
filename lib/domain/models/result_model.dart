/// status : 200
/// data : {"answer_count":2,"total_questions":4,"wrong_count":2,"answers":[{"question":{"id":1,"question":"<p>لماذا</p>","exam_id":1,"answer":null,"feedback":"1684537988.mp3","question_type":"0","type":"صح وخطأ"},"exam":{"id":1,"title":"امتحان الشهر 1","teacher_id":2,"year_id":1,"term_id":2,"subject_id":3,"date":null,"time":"60","random":0,"try":288888,"created_at":"2023-05-19T23:10:42.000000Z","updated_at":"2023-05-19T23:10:42.000000Z","half_id":0,"deleted_at":null,"subject_type_id":2,"start_date":"2023-05-20","start_time":"03:10:00","end_date":"2024-05-22","end_time":"04:11:00"},"answer":"0","correct_answer":"0","result_id":135}]}

class ResultModel {
  ResultModel({
    this.status,
    this.data,
  });

  ResultModel.fromJson(dynamic json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  int? status;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

/// answer_count : 2
/// total_questions : 4
/// wrong_count : 2
/// answers : [{"question":{"id":1,"question":"<p>لماذا</p>","exam_id":1,"answer":null,"feedback":"1684537988.mp3","question_type":"0","type":"صح وخطأ"},"exam":{"id":1,"title":"امتحان الشهر 1","teacher_id":2,"year_id":1,"term_id":2,"subject_id":3,"date":null,"time":"60","random":0,"try":288888,"created_at":"2023-05-19T23:10:42.000000Z","updated_at":"2023-05-19T23:10:42.000000Z","half_id":0,"deleted_at":null,"subject_type_id":2,"start_date":"2023-05-20","start_time":"03:10:00","end_date":"2024-05-22","end_time":"04:11:00"},"answer":"0","correct_answer":"0","result_id":135}]

class Data {
  Data({
    this.answerCount,
    this.totalQuestions,
    this.wrongCount,
    this.answers,
  });

  Data.fromJson(dynamic json) {
    answerCount = json['answer_count'];
    totalQuestions = json['total_questions'];
    wrongCount = json['wrong_count'];
    if (json['answers'] != null) {
      answers = [];
      json['answers'].forEach((v) {
        answers?.add(Answers.fromJson(v));
      });
    }
  }
  int? answerCount;
  int? totalQuestions;
  int? wrongCount;
  List<Answers>? answers;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['answer_count'] = answerCount;
    map['total_questions'] = totalQuestions;
    map['wrong_count'] = wrongCount;
    if (answers != null) {
      map['answers'] = answers?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// question : {"id":1,"question":"<p>لماذا</p>","exam_id":1,"answer":null,"feedback":"1684537988.mp3","question_type":"0","type":"صح وخطأ"}
/// exam : {"id":1,"title":"امتحان الشهر 1","teacher_id":2,"year_id":1,"term_id":2,"subject_id":3,"date":null,"time":"60","random":0,"try":288888,"created_at":"2023-05-19T23:10:42.000000Z","updated_at":"2023-05-19T23:10:42.000000Z","half_id":0,"deleted_at":null,"subject_type_id":2,"start_date":"2023-05-20","start_time":"03:10:00","end_date":"2024-05-22","end_time":"04:11:00"}
/// answer : "0"
/// correct_answer : "0"
/// result_id : 135

class Answers {
  Answers({
    this.question,
    this.exam,
    this.answer,
    this.correctAnswer,
    this.resultId,
  });

  Answers.fromJson(dynamic json) {
    question =
        json['question'] != null ? Question.fromJson(json['question']) : null;
    exam = json['exam'] != null ? Exam.fromJson(json['exam']) : null;
    answer = json['answer'];
    correctAnswer = json['correct_answer'];
    resultId = json['result_id'];
  }
  Question? question;
  Exam? exam;
  dynamic answer;
  dynamic correctAnswer;
  int? resultId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (question != null) {
      map['question'] = question?.toJson();
    }
    if (exam != null) {
      map['exam'] = exam?.toJson();
    }
    map['answer'] = answer;
    map['correct_answer'] = correctAnswer;
    map['result_id'] = resultId;
    return map;
  }
}

/// id : 1
/// title : "امتحان الشهر 1"
/// teacher_id : 2
/// year_id : 1
/// term_id : 2
/// subject_id : 3
/// date : null
/// time : "60"
/// random : 0
/// try : 288888
/// created_at : "2023-05-19T23:10:42.000000Z"
/// updated_at : "2023-05-19T23:10:42.000000Z"
/// half_id : 0
/// deleted_at : null
/// subject_type_id : 2
/// start_date : "2023-05-20"
/// start_time : "03:10:00"
/// end_date : "2024-05-22"
/// end_time : "04:11:00"

class Exam {
  Exam({
    this.id,
    this.title,
    this.teacherId,
    this.yearId,
    this.termId,
    this.subjectId,
    this.date,
    this.time,
    this.random,
    this.tryNumber,
    this.createdAt,
    this.updatedAt,
    this.halfId,
    this.deletedAt,
    this.subjectTypeId,
    this.startDate,
    this.startTime,
    this.endDate,
    this.endTime,
  });

  Exam.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    teacherId = json['teacher_id'];
    yearId = json['year_id'];
    termId = json['term_id'];
    subjectId = json['subject_id'];
    date = json['date'];
    time = json['time'];
    random = json['random'];
    tryNumber = json['try'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    halfId = json['half_id'];
    deletedAt = json['deleted_at'];
    subjectTypeId = json['subject_type_id'];
    startDate = json['start_date'];
    startTime = json['start_time'];
    endDate = json['end_date'];
    endTime = json['end_time'];
  }
  int? id;
  String? title;
  int? teacherId;
  int? yearId;
  int? termId;
  int? subjectId;
  dynamic date;
  String? time;
  int? random;
  int? tryNumber;
  String? createdAt;
  String? updatedAt;
  int? halfId;
  dynamic deletedAt;
  int? subjectTypeId;
  String? startDate;
  String? startTime;
  String? endDate;
  String? endTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['teacher_id'] = teacherId;
    map['year_id'] = yearId;
    map['term_id'] = termId;
    map['subject_id'] = subjectId;
    map['date'] = date;
    map['time'] = time;
    map['random'] = random;
    map['try'] = tryNumber;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['half_id'] = halfId;
    map['deleted_at'] = deletedAt;
    map['subject_type_id'] = subjectTypeId;
    map['start_date'] = startDate;
    map['start_time'] = startTime;
    map['end_date'] = endDate;
    map['end_time'] = endTime;
    return map;
  }
}

/// id : 1
/// question : "<p>لماذا</p>"
/// exam_id : 1
/// answer : null
/// feedback : "1684537988.mp3"
/// question_type : "0"
/// type : "صح وخطأ"

class Question {
  Question({
    this.id,
    this.question,
    this.examId,
    this.answer,
    this.feedback,
    this.questionType,
    this.type,
  });

  Question.fromJson(dynamic json) {
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