// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tawjihi_quiz/domain/models/answer_model.dart';
import 'package:tawjihi_quiz/domain/models/result_model.dart';
import 'package:tawjihi_quiz/presentation/screens/questions_review/cubit/questions_review_cubit.dart';
import 'package:tawjihi_quiz/presentation/screens/questions_review/widgets/item_of_questions_review.dart';

class MoreChooseReview extends StatelessWidget {
  const MoreChooseReview({
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
        List<String> correctsAnswers = answer.correctAnswer!.split(',');
        List<String> myAnswers = answer.answer!.split(',');

        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return ItemOfQuestionsReview(
              title: answers[index].value.toString(),
              correct: myAnswers.contains(answers[index].value)
                  ? correctsAnswers.contains(answers[index].value)
                      ? true
                      : false
                  : correctsAnswers.contains(answers[index].value)
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
