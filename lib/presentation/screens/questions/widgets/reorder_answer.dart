// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tawjihi_quiz/domain/models/answer_model.dart';
import 'package:tawjihi_quiz/presentation/screens/questions/cubit/questions_cubit.dart';
import 'package:tawjihi_quiz/presentation/screens/questions/widgets/item_of_questions.dart';

class ReorderAnswer extends StatelessWidget {
  const ReorderAnswer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuestionsCubit, QuestionsState>(
      listener: (context, state) {},
      builder: (context, state) {
        QuestionsCubit cubit = QuestionsCubit.get(context);
        if (cubit.reOrderAnswers.isEmpty) {
          cubit
              .questionsModel!.questions![cubit.questionNumber].answer['answer']
              .forEach((element) {
            cubit.reOrderAnswers.add(element);
          });
          cubit.questionsModel!.questions![cubit.questionNumber]
              .answer['correct_answer']
              .forEach((element) {
            cubit.correctAnswers.add(element);
          });
        }

        return ReorderableListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            buildDefaultDragHandles: cubit.click == false,
            onReorder: (int oldIndex, int newIndex) {
              cubit.reorderAnswer(newIndex, oldIndex);
            },
            children: [
              for (int i = 0; i < cubit.reOrderAnswers.length; i++)
                ItemOfQuestions(
                  key: Key(cubit.reOrderAnswers[i]),
                  title: cubit.reOrderAnswers[i],
                  correct: cubit.click == false
                      ? null
                      : cubit.reOrderAnswers[i] == cubit.correctAnswers[i]
                          ? true
                          : false,
                )
            ]);
      },
    );
  }
}
