// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:tawjihi_quiz/domain/models/answer_model.dart';
import 'package:tawjihi_quiz/domain/models/result_model.dart';
import 'package:tawjihi_quiz/presentation/screens/questions_review/cubit/questions_review_cubit.dart';

class ImageChooseReview extends StatelessWidget {
  const ImageChooseReview({super.key});

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

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns
            crossAxisSpacing: 10.0, // Spacing between columns
            mainAxisSpacing: 10.0, // Spacing between rows
          ),
          itemCount: answers.length,
          itemBuilder: (BuildContext context, int index) {
            return ImageWidget(
              imageUrl: answers[index].value,
              correct: answer.answer == answers[index].value
                  ? answer.correctAnswer == answer.answer
                      ? true
                      : false
                  : answer.correctAnswer == answers[index].value
                      ? true
                      : null,
            );
          },
        );
      },
    );
  }
}

class ImageWidget extends StatelessWidget {
  final String? imageUrl;
  final bool? correct;

  const ImageWidget({
    Key? key,
    required this.imageUrl,
    this.correct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(8.w),
        width: 100.w,
        height: 100.h,
        decoration: BoxDecoration(
          border: Border.all(
            width: correct == null
                ? 0.5
                : correct!
                    ? 3
                    : 3,
            color: correct == null
                ? Colors.grey
                : correct!
                    ? const Color(0xff93D774)
                    : const Color(0xffD40E0E),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Image.network(
          "http://tawjihiquiz.com/uploaded/questions/$imageUrl",
          width: 50.w,
          height: 50.w,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) => Image.asset(
            'assets/images/teacher.png',
            width: 30.w,
            height: 30.w,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}