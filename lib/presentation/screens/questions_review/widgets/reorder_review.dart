// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tawjihi_quiz/domain/models/answer_model.dart';
import 'package:tawjihi_quiz/domain/models/result_model.dart';
import 'package:tawjihi_quiz/presentation/screens/questions/widgets/item_of_questions.dart';
import 'package:tawjihi_quiz/presentation/screens/questions_review/cubit/questions_review_cubit.dart';

class ReOrderReview extends StatelessWidget {
  const ReOrderReview({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuestionsReviewCubit, QuestionsReviewState>(
      listener: (context, state) {},
      builder: (context, state) {
        QuestionsReviewCubit cubit = QuestionsReviewCubit.get(context);
        List<String> answers = [];
        List<String> correctAnswers = [];
        cubit.resultModel!.data!.answers![cubit.questionNumber].question!
            .answer['answer']
            .forEach((element) {
          answers.add(element);
        });
        cubit.resultModel!.data!.answers![cubit.questionNumber].question!
            .answer['correct_answer']
            .forEach((element) {
          correctAnswers.add(element);
        });


        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return ItemOfQuestions(
              title: answers[index].toString(),

              /// بتشوف اول حاجه القيمة اللى انت كنت مجاوبها هل هي بتساوى القيمة الفعليه للعنصر لو بتساوية هتشوف القيمة دي هي الاجابة الصح رجع صح لو غلط رجع غلط
              /// لكن لو الاجابه ليست صحيحه بتشوف قيمة العنصر اللى انت واقف عليه هل هي الاجابه الصح لو تمام يبقا رجع ترو غير كدا يبقا متعملش حاجه ورجع null
              correct: correctAnswers[index] == answers[index]
              // correctAnswers[index] == answers[index]
              //     ? answer.correctAnswer == answer.answer
              //         ? true
              //         : false
              //     :  correctAnswers[index] == answers[index]
              //         ? true
              //         : null,
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