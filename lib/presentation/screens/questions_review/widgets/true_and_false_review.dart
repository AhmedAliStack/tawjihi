import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tawjihi_quiz/domain/models/result_model.dart';
import 'package:tawjihi_quiz/presentation/screens/questions/widgets/item_of_questions.dart';
import 'package:tawjihi_quiz/presentation/screens/questions_review/cubit/questions_review_cubit.dart';

class TrueAndFalseReview extends StatelessWidget {
  const TrueAndFalseReview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuestionsReviewCubit, QuestionsReviewState>(
      listener: (context, state) {},
      builder: (context, state) {
        QuestionsReviewCubit cubit = QuestionsReviewCubit.get(context);
        Answers answer =
            cubit.resultModel!.data!.answers![cubit.questionNumber];
        return Column(children: [
          ItemOfQuestions(
            title: "صح",
            correct: answer.answer == "1"
                ? answer.correctAnswer == answer.answer
                    ? true
                    : false
                : answer.correctAnswer == "1"
                    ? true
                    : null,
          ),
          SizedBox(height: 16.h),
          ItemOfQuestions(
            title: "خطأ",
            correct: answer.answer == "0"
                ? answer.correctAnswer == answer.answer
                    ? true
                    : false
                : answer.correctAnswer == "0"
                    ? true
                    : null,
          ),
        ]);
      },
    );
  }
}
