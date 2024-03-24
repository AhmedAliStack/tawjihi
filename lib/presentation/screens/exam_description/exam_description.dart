import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tawjihi_quiz/core/utils/utils.dart';
import 'package:tawjihi_quiz/core/values/colors.dart';
import 'package:tawjihi_quiz/presentation/components/button_widget.dart';
import 'package:tawjihi_quiz/presentation/components/loadinganderror.dart';
import 'package:tawjihi_quiz/presentation/components/text_widget.dart';
import 'package:tawjihi_quiz/presentation/screens/base/base_stateless.dart';
import 'package:tawjihi_quiz/presentation/screens/questions/cubit/questions_cubit.dart';
import 'package:tawjihi_quiz/presentation/screens/questions/questions.dart';
import 'package:tawjihi_quiz/translations/locale_keys.g.dart';

class ExamDescription extends StatelessWidget {
  final int examId;
  final String examTitle;
  final int time;
  const ExamDescription(
      {super.key,
      required this.examId,
      required this.examTitle,
      required this.time});

  @override
  Widget build(BuildContext context) {
    return BaseStateless(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Utils.backWidget(context,
                  authScreensBack: true, onBack: () => Navigator.pop(context)),
              TextWidget(
                title: LocaleKeys.test_instructions.tr(),
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              SizedBox(width: 32.w),
            ],
          ),
          SizedBox(height: 16.h),
          Expanded(
            child: BlocProvider(
              create: (context) => QuestionsCubit()..getQuestions(examId),
              child: BlocConsumer<QuestionsCubit, QuestionsState>(
                listener: (context, state) {},
                builder: (context, state) {
                  QuestionsCubit cubit = QuestionsCubit.get(context);
                  return Expanded(
                    child: LoadingAndError(
                      isError: state is ErrorQuestionsState,
                      isLoading: state is LoadingQuestionsState,
                      errorMessage:
                          state is ErrorQuestionsState ? state.error : null,
                      function: () async => cubit.getQuestions(examId),
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(
                                  top: 16.h, left: 16.w, right: 16.w),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.r),
                                  color: containerColor),
                              child: Column(
                                children: [
                                  Image.asset(
                                    "assets/images/exam_description.png",
                                    width: 200.w,
                                    height: 200.h,
                                    fit: BoxFit.fill,
                                  ),
                                  SizedBox(height: 16.h),
                                  Expanded(
                                    child: SingleChildScrollView(
                                      child: Text(
                                        cubit.questionsModel?.examDescription ??
                                            "",
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: secondaryColor,
                                          height: 1.9,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 16.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: ButtonWidget(
                              title: LocaleKeys.start_now.tr(),
                              fontSize: 16.sp,
                              onTap: () {
                                Utils.openScreen(
                                  context,
                                  QuestionsScreen(
                                    examTitle: examTitle,
                                    time: time,
                                    examId: examId,
                                  ),
                                  replacment: true,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ]),
      ),
    );
  }
}
