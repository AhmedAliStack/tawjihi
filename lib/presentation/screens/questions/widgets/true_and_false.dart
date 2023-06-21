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
        return Column(children: [
          GestureDetector(
              onTap: () {}, child: const ItemOfQuestions(title: "صح")),
          SizedBox(height: 16.h),
          GestureDetector(
              onTap: () {}, child: const ItemOfQuestions(title: "خطأ")),
        ]);
      },
    );
  }
}
