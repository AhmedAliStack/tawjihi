// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tawjihi_quiz/domain/models/answer_model.dart';
import 'package:tawjihi_quiz/presentation/screens/questions/cubit/questions_cubit.dart';
import 'package:tawjihi_quiz/presentation/screens/questions/widgets/item_of_questions.dart';

class MoreChoose extends StatelessWidget {
  const MoreChoose({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuestionsCubit, QuestionsState>(
      listener: (context, state) {},
      builder: (context, state) {
        QuestionsCubit cubit = QuestionsCubit.get(context);
        List<AnswerModel>? answers = [];
        cubit.questionsModel!.questions![cubit.questionNumber].answer
            .forEach((element) {
          answers.add(AnswerModel.fromJson(element));
        });
        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return ItemOfQuestions(
              title: answers[index].value.toString(),
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
