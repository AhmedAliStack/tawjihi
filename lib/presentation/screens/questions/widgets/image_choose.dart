// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:tawjihi_quiz/domain/models/answer_model.dart';
import 'package:tawjihi_quiz/presentation/screens/questions/cubit/questions_cubit.dart';

class ImageChoose extends StatelessWidget {
  const ImageChoose({super.key});

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
            return ImageWidget(imageUrl: answers[index].value);
          },
        );
      },
    );
  }
}

class ImageWidget extends StatelessWidget {
  final String? imageUrl;
  const ImageWidget({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: 100.w,
        height: 100.h,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.yellow,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Image.network(
          imageUrl ?? "",
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
