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
                cubit.trueOrFalseClick
                    ? null
                    : cubit.trueOrFalseChange(field1: "1");
              },
              child: ItemOfQuestions(
                title: "صح",
                correct: cubit.trueOrFalse == null
                    ? null
                    : cubit.trueOrFalse == 1
                        ? true
                        : false,
              )),
          SizedBox(height: 16.h),
          GestureDetector(
              onTap: () {
                cubit.trueOrFalseClick
                    ? null
                    : cubit.trueOrFalseChange(field2: "0");
              },
              child: ItemOfQuestions(
                title: "خطأ",
                correct: cubit.trueOrFalse == null
                    ? null
                    : cubit.trueOrFalse == 2
                        ? true
                        : false,
              )),
        ]);
      },
    );
  }
}
