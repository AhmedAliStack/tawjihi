import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:tawjihi_quiz/presentation/screens/exam_description/exam_description.dart';
import 'package:tawjihi_quiz/presentation/screens/exams_by_teacher/cubit/exams_by_teacher_cubit.dart';
import 'package:tawjihi_quiz/presentation/screens/subscrib_code/subscrib_code.dart';
import 'package:tawjihi_quiz/translations/locale_keys.g.dart';
import '../../../core/utils/utils.dart';
import '../../../core/values/colors.dart';
import '../../components/text_widget.dart';
import 'package:tawjihi_quiz/domain/models/exams_by_teacher_model.dart'
    as exams;

class ExamsByTeacher extends StatefulWidget {
  final String teacherName;
  final String rate;
  final int id;
  const ExamsByTeacher(
      {super.key,
      required this.teacherName,
      required this.rate,
      required this.id});

  @override
  State<ExamsByTeacher> createState() => _ExamsByTeacherState();
}

class _ExamsByTeacherState extends State<ExamsByTeacher> {
  late ExamsByTeacherCubit cubit;
  @override
  void initState() {
    cubit = ExamsByTeacherCubit.get(context);
    cubit.pagingController.addPageRequestListener((pageKey) async {
      await cubit.getExams(id: widget.id, page: pageKey);
    });
    super.initState();
  }

  @override
  void dispose() {
    cubit.pagingController = PagingController(firstPageKey: 1);
    cubit.pagingController.removePageRequestListener((pageKey) async {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 0.4.sw,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10.r),
                  bottomRight: Radius.circular(10.r),
                ),
                gradient: const LinearGradient(colors: gradientButton)),
            child: Padding(
              padding: EdgeInsetsDirectional.only(start: 16.w, top: 16.h),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Utils.backWidget(context),
                  SizedBox(
                    width: 26.w,
                  ),
                  Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              child: TextWidget(
                                title: widget.teacherName,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8.w, vertical: 4.h),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(19.r),
                                    color: Colors.white),
                                child: Row(children: [
                                  GradientText(widget.rate,
                                      style: TextStyle(
                                        fontSize: 12.0.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      colors: gradientButton),
                                  SizedBox(width: 4.w),
                                  const Icon(Icons.star_rounded,
                                      color: Color(0xffFB966E)),
                                ]))
                          ],
                        ),
                        SizedBox(height: 8.h),
                        // TextWidget(
                        //     title: " (الاول الاعدادى)",
                        //     fontSize: 12.sp,
                        //     fontWeight: FontWeight.w500,
                        //     color: Colors.white)
                      ])
                ],
              ),
            ),
          ),
          SizedBox(height: 16.h),
          Expanded(
            child: BlocConsumer<ExamsByTeacherCubit, ExamsByTeacherState>(
              listener: (context, state) {},
              builder: (context, state) {
                return RefreshIndicator(
                  onRefresh: () async {
                    cubit.pagingController.refresh();
                  },
                  child: PagedListView<int, exams.Data>(
                    padding:
                        EdgeInsets.only(bottom: 16.h, right: 8.w, left: 8.w),
                    pagingController: cubit.pagingController,
                    builderDelegate: PagedChildBuilderDelegate<exams.Data>(
                        noItemsFoundIndicatorBuilder: (context) => Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextWidget(
                                  title: LocaleKeys.no_available_tests.tr(),
                                  color: secondaryColor,
                                  fontWeight: FontWeight.bold,
                                )
                              ],
                            ),
                        itemBuilder: (context, item, index) {
                          return GestureDetector(
                            onTap: () => cubit.activeExam == 0
                                ? Utils.openScreen(
                                    context,
                                    SubscribCode(
                                      teacherName: widget.teacherName,
                                      rate: widget.rate,
                                      id: widget.id,
                                      data: item,
                                    ),
                                    replacment: true)
                                : Utils.openScreen(
                                    context,
                                    ExamDescription(
                                      examId: item.id!,
                                      examTitle: item.title ?? "",
                                      time: int.tryParse(item.time ?? "0") ?? 0,
                                    )),
                            child: ExamCard(
                              title: item.title ?? "",
                            ),
                          );
                        }),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ExamCard extends StatelessWidget {
  final String title;
  const ExamCard({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.r),
        color: Colors.white,
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: borderMainColor,
          ),
          child: Image.asset(
            'assets/icons/my_tests.png',
            width: 30.w,
            height: 30.w,
            fit: BoxFit.contain,
          ),
        ),
        title: TextWidget(
          title: title,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: mauveColor,
        ),
      ),
    );
  }
}
