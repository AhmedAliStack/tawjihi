// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tawjihi_quiz/domain/models/answer_model.dart';
import 'package:tawjihi_quiz/domain/models/result_model.dart';
import 'package:tawjihi_quiz/presentation/screens/questions/widgets/item_of_questions.dart';
import 'package:tawjihi_quiz/presentation/screens/questions_review/cubit/questions_review_cubit.dart';

class OneChooseReview extends StatelessWidget {
  const OneChooseReview({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuestionsReviewCubit, QuestionsReviewState>(
      listener: (context, state) {},
      builder: (context, state) {
        QuestionsReviewCubit cubit = QuestionsReviewCubit.get(context);
        List<AnswerModel>? answers = [];
        cubit.resultModel!.data!.answers![cubit.questionNumber].question!.answer
            .forEach((element) {
          answers.add(AnswerModel.fromJson(element));
        });
        Answers answer =
            cubit.resultModel!.data!.answers![cubit.questionNumber];

        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return ItemOfQuestions(
              title: answers[index].value.toString(),

              /// بتشوف اول حاجه القيمة اللى انت كنت مجاوبها هل هي بتساوى القيمة الفعليه للعنصر لو بتساوية هتشوف القيمة دي هي الاجابة الصح رجع صح لو غلط رجع غلط
              /// لكن لو الاجابه ليست صحيحه بتشوف قيمة العنصر اللى انت واقف عليه هل هي الاجابه الصح لو تمام يبقا رجع ترو غير كدا يبقا متعملش حاجه ورجع null
              correct: answer.answer == answers[index].value
                  ? answer.correctAnswer == answer.answer
                      ? true
                      : false
                  : answer.correctAnswer == answers[index].value
                      ? true
                      : null,
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(height: 8.h);
          },
          itemCount: answers.length,
        );
      },
    );
  }
}
