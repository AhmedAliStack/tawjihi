import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tawjihi_quiz/presentation/components/loadinganderror.dart';
import 'package:tawjihi_quiz/presentation/screens/questions/cubit/questions_cubit.dart';
import 'package:tawjihi_quiz/presentation/screens/questions/widgets/html.dart';
import 'package:tawjihi_quiz/presentation/screens/questions/widgets/image_choose.dart';
import 'package:tawjihi_quiz/presentation/screens/questions/widgets/more_choose.dart';
import 'package:tawjihi_quiz/presentation/screens/questions/widgets/one_choose.dart';
import 'package:tawjihi_quiz/presentation/screens/questions/widgets/reorder_answer.dart';
import 'package:tawjihi_quiz/presentation/screens/questions/widgets/true_and_false.dart';
import '../../../core/utils/utils.dart';
import '../../../core/values/colors.dart';
import '../../components/button_widget.dart';
import '../../components/text_widget.dart';
import '../base/base_stateless.dart';
import '../test_result/test_result.dart';

class QuestionsScreen extends StatelessWidget {
  final String examTitle;
  final int examId;
  final int time;

  const QuestionsScreen(
      {super.key,
      required this.examTitle,
      required this.time,
      required this.examId});

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
              create: (context) => QuestionsCubit()..getQuestions(examId),
              child: BlocConsumer<QuestionsCubit, QuestionsState>(
                listener: (context, state) {
                  if (state is FinishExam) {
                    Utils.openScreen(
                        context,
                        TestResult(
                          resultID: QuestionsCubit.get(context)
                                  .questionsModel
                                  ?.resultId ??
                              0,
                          title: examTitle,
                        ),
                        replacment: true);
                  }
                },
                builder: (context, state) {
                  QuestionsCubit cubit = QuestionsCubit.get(context);

                  return LoadingAndError(
                    isLoading: state is LoadingQuestionsState,
                    isError: state is ErrorQuestionsState,
                    errorMessage:
                        state is ErrorQuestionsState ? state.error : null,
                    child: cubit.questionsModel?.questions == null ||
                            cubit.questionsModel!.questions!.isEmpty
                        ? const Center(
                            child: TextWidget(title: "لا يوجداسئلة حتى الاّن"))
                        : Column(
                            children: [
                              CircularCountDownTimer(
                                duration: time * 60,
                                initialDuration: 0,
                                controller: CountDownController(),
                                width: 90.w,
                                height: 70.h,
                                ringColor: Colors.grey[300]!,
                                ringGradient: null,
                                fillColor: Colors.purpleAccent[100]!,
                                fillGradient: const LinearGradient(
                                    colors: gradientButton),
                                backgroundColor: borderMainColor,
                                backgroundGradient: null,
                                strokeWidth: 6,
                                strokeCap: StrokeCap.round,
                                textStyle: TextStyle(
                                    fontSize: 18.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                                textFormat: CountdownTextFormat.MM_SS,
                                isReverse: true,
                                isReverseAnimation: false,
                                isTimerTextShown: true,
                                autoStart: true,
                                onStart: () {
                                  debugPrint('Countdown Started');
                                },
                                onComplete: () {
                                  Utils.openScreen(
                                      context,
                                      TestResult(
                                        resultID: QuestionsCubit.get(context)
                                                .questionsModel
                                                ?.resultId ??
                                            0,
                                        title: examTitle,
                                      ),
                                      replacment: true);
                                  debugPrint('Countdown Ended');
                                },
                                onChange: (String timeStamp) {
                                  debugPrint('Countdown Changed $timeStamp');
                                },
                                timeFormatterFunction:
                                    (defaultFormatterFunction, duration) {
                                  if (duration.inSeconds == 0) {
                                    return "0";
                                  } else {
                                    return Function.apply(
                                        defaultFormatterFunction, [duration]);
                                  }
                                },
                              ),
                              SizedBox(
                                height: 32.h,
                              ),
                              Text(
                                cubit
                                        .questionsModel!
                                        .questions![cubit.questionNumber]
                                        .type ??
                                    "",
                                style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Expanded(
                                child: SingleChildScrollView(
                                  physics: const BouncingScrollPhysics(),
                                  child: Column(
                                    children: [
                                      cubit
                                                  .questionsModel!
                                                  .questions![
                                                      cubit.questionNumber]
                                                  .questionType ==
                                              "3"
                                          ? ImageWidget(
                                              imageUrl: cubit
                                                  .questionsModel!
                                                  .questions![
                                                      cubit.questionNumber]
                                                  .question!,
                                              correct: false,
                                            )
                                          : HtmlWidget(
                                              htmlData: cubit
                                                  .questionsModel!
                                                  .questions![
                                                      cubit.questionNumber]
                                                  .question!),
                                      SizedBox(
                                        height: 16.h,
                                      ),
                                      cubit.correctOrWrong == null
                                          ? const SizedBox()
                                          : TextWidget(
                                              title: cubit.correctOrWrong!
                                                  ? "اجابة صحيحة"
                                                  : "اجابة خاطئة",
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.w500,
                                              color: cubit.correctOrWrong!
                                                  ? const Color(0xff93D774)
                                                  : const Color(0xffD40E0E),
                                              textAlign: TextAlign.center,
                                            ),
                                      SizedBox(height: 16.h),
                                      cubit.questionsModel?.questions == null ||
                                              cubit.questionsModel!.questions!
                                                  .isEmpty
                                          ? const TextWidget(
                                              title: "لا يوجداسئلة حتى الاّن")
                                          : QuestionWidget(cubit: cubit),
                                      SizedBox(height: 16.h),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          TextWidget(
                                            title: "السؤال",
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xffA647A4),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(width: 4.w),
                                          TextWidget(
                                            title:
                                                "${cubit.questionNumber + 1}/${cubit.questionsModel!.questions!.length}",
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
                                          const Expanded(
                                            child: SizedBox(),
                                          ),
                                          SizedBox(width: 16.w),
                                          Expanded(
                                            child: state is LoadingSendAnswer
                                                ? const Center(
                                                    child:
                                                        CircularProgressIndicator())
                                                : ButtonWidget(
                                                    onTap: () {
                                                      cubit.click
                                                          ? cubit.sendAnswer(
                                                              questionId: cubit
                                                                  .questionsModel!
                                                                  .questions![cubit
                                                                      .questionNumber]
                                                                  .id!)
                                                          : null;
                                                    },
                                                    height: 50.w,
                                                    backgroundButtonColor:
                                                        borderMainColor,
                                                    child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          const TextWidget(
                                                            title: "التالى",
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: Color(
                                                                0xff6D6D6D),
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

  final QuestionsCubit cubit;

  @override
  Widget build(BuildContext context) {
    String? type =
        cubit.questionsModel!.questions![cubit.questionNumber].questionType;
    return Column(
      children: [
        type == "0"
            ? const TrueAndFalse()
            : type == "1" || type == "3"
                ? const OneChoose()
                : type == "2"
                    ? const MoreChoose()
                    : type == "4"
                        ? const ImageChoose()
                        : type == "5"
                            ? const ReorderAnswer()
                            : const TextWidget(title: "لا يوجد اجابات"),
        type == "5"
            ? ButtonWidget(
                title: "تاكيد الترتيب",
                fontSize: 16.sp,
                onTap: () {
                  cubit.click ? null : cubit.reOrder();
                },
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
