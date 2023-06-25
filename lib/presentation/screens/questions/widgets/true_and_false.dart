import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tawjihi_quiz/presentation/screens/questions/cubit/questions_cubit.dart';
import 'package:tawjihi_quiz/presentation/screens/questions/widgets/item_of_questions.dart';

class TrueAndFalse extends StatelessWidget {
  const TrueAndFalse({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuestionsCubit, QuestionsState>(
      listener: (context, state) {},
      builder: (context, state) {
        QuestionsCubit cubit = QuestionsCubit.get(context);
        return Column(children: [
          GestureDetector(
              onTap: () {
                cubit.click ? null : cubit.trueOrFalseChange(value: "1");
              },
              child: ItemOfQuestions(
                title: "صح",
                correct: cubit.click == false
                    ? null
                    : cubit.questionsModel!.questions![cubit.questionNumber]
                                .answer ==
                            "1"
                        ? true
                        : false,
              )),
          SizedBox(height: 16.h),
          GestureDetector(
              onTap: () {
                cubit.click ? null : cubit.trueOrFalseChange(value: "0");
              },
              child: ItemOfQuestions(
                title: "خطأ",
                correct: cubit.click == false
                    ? null
                    : cubit.questionsModel!.questions![cubit.questionNumber]
                                .answer ==
                            "0"
                        ? true
                        : false,
              )),
        ]);
      },
    );
  }
}
