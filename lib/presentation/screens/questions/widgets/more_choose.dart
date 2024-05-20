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
        if(cubit.questionsModel!.questions![cubit.questionNumber].questionType=="2"){
          cubit.questionsModel!.questions![cubit.questionNumber].answer
              .forEach((element) {
            answers.add(AnswerModel.fromJson(element));
          });
        }

        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                cubit.click
                    ? null
                    : cubit.morechooseTrue(
                        field: index,
                        value1: answers[index].value.toString(),
                        key1: answers[index].key,
                      );
              },
              child: ItemOfQuestions(
                title: answers[index].value.toString(),
                more: cubit.more.contains(index) && cubit.click == false,
                correct: cubit.click == false
                    ? null
                    : answers[index].key != null
                        ? true
                        : false,
              ),
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
