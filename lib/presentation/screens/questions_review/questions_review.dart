import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tawjihi_quiz/presentation/components/loadinganderror.dart';
import 'package:tawjihi_quiz/presentation/screens/questions/widgets/html.dart';
import 'package:tawjihi_quiz/presentation/screens/questions_review/cubit/questions_review_cubit.dart';
import 'package:tawjihi_quiz/presentation/screens/questions_review/widgets/image_choose_review.dart';
import 'package:tawjihi_quiz/presentation/screens/questions_review/widgets/more_choose_review.dart';
import 'package:tawjihi_quiz/presentation/screens/questions_review/widgets/one_choose_review.dart';
import 'package:tawjihi_quiz/presentation/screens/questions_review/widgets/true_and_false_review.dart';
import 'package:tawjihi_quiz/translations/locale_keys.g.dart';
import '../../../core/utils/utils.dart';
import '../../../core/values/colors.dart';
import '../../components/button_widget.dart';
import '../../components/text_widget.dart';
import '../base/base_stateless.dart';

class QuestionsReview extends StatelessWidget {
  final String examTitle;
  final int resultId;

  const QuestionsReview(
      {super.key, required this.examTitle, required this.resultId});

  @override
  Widget build(BuildContext context) {
    return BaseStateless(
        body: Stack(children: [
      Image.asset(
        "assets/images/question_icons.png",
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(children: [
          Padding(
            padding: EdgeInsetsDirectional.only(top: 32.h, bottom: 32.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Utils.backWidget(context, authScreensBack: true),
                TextWidget(
                  title: examTitle,
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
              create: (context) =>
                  QuestionsReviewCubit()..getQuestionsReview(resultId),
              child: BlocConsumer<QuestionsReviewCubit, QuestionsReviewState>(
                listener: (context, state) {
                  // if (state is FinishExamReview) {
                  //   Utils.openScreen(context, const Home(), remove: true);
                  // }
                },
                builder: (context, state) {
                  QuestionsReviewCubit cubit =
                      QuestionsReviewCubit.get(context);

                  return LoadingAndError(
                    isLoading: state is LoadingQuestionsReviewState,
                    isError: state is ErrorQuestionsReviewState,
                    errorMessage:
                        state is ErrorQuestionsReviewState ? state.error : null,
                    child: cubit.resultModel?.data?.answers == null ||
                            cubit.resultModel!.data!.answers!.isEmpty
                        ? const Center(
                            child: TextWidget(title: LocaleKeys.no_questions))
                        : Column(
                            children: [
                              Expanded(
                                child: SingleChildScrollView(
                                  physics: const BouncingScrollPhysics(),
                                  child: Column(
                                    children: [
                                      HtmlWidget(
                                          htmlData: cubit
                                              .resultModel!
                                              .data!
                                              .answers![cubit.questionNumber]
                                              .question!
                                              .question!),
                                      SizedBox(
                                        height: 16.h,
                                      ),
                                      TextWidget(
                                        title: cubit.isSameMoreChoose != null
                                            ? cubit.isSameMoreChoose!
                                                ? LocaleKeys.correct_ans
                                                : LocaleKeys.wrong_ans
                                            : cubit
                                                        .resultModel!
                                                        .data!
                                                        .answers![cubit
                                                            .questionNumber]
                                                        .answer ==
                                                    cubit
                                                        .resultModel!
                                                        .data!
                                                        .answers![cubit
                                                            .questionNumber]
                                                        .correctAnswer!
                                                ? LocaleKeys.correct_ans
                                                : LocaleKeys.wrong_ans,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w500,
                                        color: cubit
                                                    .resultModel!
                                                    .data!
                                                    .answers![
                                                        cubit.questionNumber]
                                                    .answer ==
                                                cubit
                                                    .resultModel!
                                                    .data!
                                                    .answers![
                                                        cubit.questionNumber]
                                                    .correctAnswer!
                                            ? const Color(0xff93D774)
                                            : const Color(0xffD40E0E),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: 16.h),
                                      cubit
                                                  .resultModel
                                                  ?.data
                                                  ?.answers?[
                                                      cubit.questionNumber]
                                                  .question ==
                                              null
                                          ? const TextWidget(
                                              title: LocaleKeys.no_questions)
                                          : QuestionWidget(cubit: cubit),
                                      SizedBox(height: 8.h),
                                      HtmlWidget(
                                          htmlData: cubit
                                              .resultModel!
                                              .data!
                                              .answers![cubit.questionNumber]
                                              .question!
                                              .feedback!),
                                      SizedBox(height: 8.h),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          TextWidget(
                                            title: LocaleKeys.question,
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xffA647A4),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(width: 4.w),
                                          TextWidget(
                                            title:
                                                "${cubit.questionNumber + 1}/${cubit.resultModel!.data!.answers!.length}",
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16.0.w, vertical: 32.h),
                                        child: Row(children: [
                                          Expanded(
                                            child: ButtonWidget(
                                              onTap: () {
                                                cubit.questionNumber == 0
                                                    ? null
                                                    : cubit
                                                        .decrementQuestionNumber();
                                              },
                                              height: 50.w,
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.arrow_back,
                                                      color: Colors.white,
                                                      size: 25.w,
                                                    ),
                                                    SizedBox(width: 4.w),
                                                    const TextWidget(
                                                      title: LocaleKeys.previous,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.white,
                                                    )
                                                  ]),
                                            ),
                                          ),
                                          SizedBox(width: 16.w),
                                          Expanded(
                                            child: ButtonWidget(
                                              onTap: () {
                                                cubit.incrementQuestionNumber();
                                              },
                                              height: 50.w,
                                              backgroundButtonColor:
                                                  borderMainColor,
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    const TextWidget(
                                                      title: LocaleKeys.next,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Color(0xff6D6D6D),
                                                    ),
                                                    SizedBox(width: 4.w),
                                                    Icon(
                                                      Icons.arrow_forward,
                                                      color: Colors.black,
                                                      size: 25.w,
                                                    ),
                                                  ]),
                                            ),
                                          ),
                                        ]),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                  );
                },
              ),
            ),
          ),
        ]),
      ),
    ]));
  }
}

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({
    super.key,
    required this.cubit,
  });

  final QuestionsReviewCubit cubit;

  @override
  Widget build(BuildContext context) {
    String? type = cubit.resultModel!.data!.answers![cubit.questionNumber]
        .question!.questionType;
    return Column(
      children: [
        type == "0"
            ? const TrueAndFalseReview()
            : type == "1"
                ? const OneChooseReview()
                : type == "2"
                    ? const MoreChooseReview()
                    : type == "3"
                        ? const ImageChooseReview()
                        : const TextWidget(title: LocaleKeys.no_ans),
      ],
    );
  }
}
