import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:tawjihi_quiz/core/values/colors.dart';
import 'package:tawjihi_quiz/presentation/components/button_widget.dart';
import 'package:tawjihi_quiz/presentation/components/loadinganderror.dart';
import 'package:tawjihi_quiz/presentation/screens/questions_review/questions_review.dart';
import 'package:tawjihi_quiz/presentation/screens/test_result/cubit/test_result_cubit.dart';
import 'package:tawjihi_quiz/translations/locale_keys.g.dart';
import '../../../core/utils/utils.dart';
import '../../components/text_widget.dart';
import '../base/base_stateless.dart';

class TestResult extends StatelessWidget {
  final int resultID;
  final String title;
  const TestResult({super.key, required this.resultID, required this.title});

  @override
  Widget build(BuildContext context) {
    return BaseStateless(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(
                start: 16.w, top: 32.h, end: 16.w, bottom: 32.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Utils.backWidget(context, authScreensBack: true),
                TextWidget(
                  title: LocaleKeys.test_result,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
                SizedBox(width: 32.w),
              ],
            ),
          ),
          Expanded(
            child: BlocProvider(
              create: (context) => TestResultCubit()..getResult(resultID),
              child: BlocConsumer<TestResultCubit, TestResultState>(
                listener: (context, state) {},
                builder: (context, state) {
                  TestResultCubit cubit = TestResultCubit.get(context);
                  return LoadingAndError(
                    isLoading: state is LoadingTestResultState,
                    isError: state is ErrorTestResultState,
                    errorMessage:
                        state is ErrorTestResultState ? state.error : null,
                    function: () => cubit.getResult(resultID),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 32.w, horizontal: 16.w),
                          margin: EdgeInsets.symmetric(horizontal: 32.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              color: containerColor),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircularPercentIndicator(
                                radius: 40.0,
                                lineWidth: 6.0,
                                animation: true,
                                percent: (cubit
                                            .resultModel?.data?.answerCount ??
                                        0) /
                                    (cubit.resultModel?.data?.totalQuestions ??
                                        0),
                                backgroundWidth: 4.0,
                                center: Text(
                                  "${(cubit.resultModel?.data?.answerCount ?? 0) / (cubit.resultModel?.data?.totalQuestions ?? 0)}%",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500),
                                ),
                                circularStrokeCap: CircularStrokeCap.square,
                                backgroundColor: borderMainColor,
                                rotateLinearGradient: true,
                                linearGradient: const LinearGradient(
                                    colors: gradientButton),
                              ),
                              SizedBox(width: 16.w),
                              Flexible(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextWidget(
                                        title:
                                            "${LocaleKeys.correct_answers} ${cubit.resultModel?.data?.answerCount}",
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xff93D774),
                                      ),
                                      SizedBox(height: 8.h),
                                      TextWidget(
                                        title:
                                            "${LocaleKeys.wrong_answer} ${cubit.resultModel?.data?.wrongCount}",
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xffD40E0E),
                                      ),
                                    ]),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 32.h),
                        Image.asset(
                          "assets/images/test_result.png",
                          width: 170.w,
                          height: 160.w,
                        ),
                        SizedBox(height: 32.w),
                        TextWidget(
                          title: LocaleKeys.test_end_success,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        const Expanded(child: SizedBox()),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0.w),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Expanded(
                  child: ButtonWidget(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const TextWidget(
                  title: LocaleKeys.material_tests,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              )),
              SizedBox(width: 16.w),
              Expanded(
                child: ButtonWidget(
                  onTap: () {
                    Utils.openScreen(
                        context,
                        QuestionsReview(
                          examTitle: title,
                          resultId: resultID,
                        ));
                  },
                  backgroundButtonColor: borderMainColor,
                  child: const TextWidget(
                    title: LocaleKeys.review_test,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff6D6D6D),
                  ),
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
