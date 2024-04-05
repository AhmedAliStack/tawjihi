import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tawjihi_quiz/presentation/components/loadinganderror.dart';
import 'package:tawjihi_quiz/presentation/screens/subject_details/cubit/subject_details_cubit.dart';
import 'package:tawjihi_quiz/presentation/screens/teachers/widgets/item_of_teachers.dart';
import 'package:tawjihi_quiz/translations/locale_keys.g.dart';
import '../../../core/utils/utils.dart';
import '../../../core/values/colors.dart';
import '../../components/text_widget.dart';
import '../exams_by_teacher/exams_by_teacher.dart';

class SubjectDetails extends StatelessWidget {
  final int id;
  final String subjectTitle;
  const SubjectDetails(
      {super.key, required this.id, required this.subjectTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: containerColor,
      body: Stack(children: [
        Container(
          height: 0.25.sh,
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
              children: [
                Utils.backWidget(context),
                SizedBox(
                  width: 32.w,
                ),
                TextWidget(
                  title: subjectTitle,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                )
              ],
            ),
          ),
        ),
        Column(
          children: [
            // Padding(
            //   padding: EdgeInsets.only(bottom: 8.h, left: 16.w, right: 16.w),
            //   child: Card(
            //     shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(15.r)),
            //     margin: EdgeInsets.only(top: 0.20.sh),
            //     child: ListTile(
            //       leading: Container(
            //         padding: EdgeInsets.all(8.w),
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(13.r),
            //           color: borderMainColor,
            //         ),
            //         child: Image.asset(
            //           'assets/icons/fillter.png',
            //           width: 24.w,
            //           height: 24.w,
            //           fit: BoxFit.contain,
            //         ),
            //       ),
            //       title: TextFormField(
            //         decoration: const InputDecoration(
            //             hintText: 'البحث', border: InputBorder.none),
            //         // onChanged: onSearchTextChanged,
            //       ),
            //       trailing: IconButton(
            //         icon: Icon(
            //           Icons.search,
            //           color: const Color(0xffD4D4D4),
            //           size: 30.w,
            //         ),
            //         onPressed: () {
            //           // onSearchTextChanged('');
            //           // controller.clear();
            //         },
            //       ),
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 0.25.sh,
            ),
            Expanded(
              child: BlocProvider(
                create: (context) =>
                SubjectDetailsCubit()..getDetailsSubject(id),
                child: BlocConsumer<SubjectDetailsCubit, SubjectDetailsState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    SubjectDetailsCubit cubit =
                    SubjectDetailsCubit.get(context);
                    return LoadingAndError(
                      isError: state is ErrorSubjectDetailsState,
                      errorMessage: state is ErrorSubjectDetailsState
                          ? state.error
                          : null,
                      isLoading: state is LoadingSubjectDetailsState,
                      function: () async => cubit.getDetailsSubject(id),
                      child: cubit.subjectDetails != null &&
                          cubit.subjectDetails!.isNotEmpty
                          ? RefreshIndicator(
                        onRefresh: () async =>
                            cubit.getDetailsSubject(id),
                        child: ListView.separated(
                          padding: EdgeInsets.all(16.w),
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 16.w),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () => Utils.openScreen(
                                  context,
                                  ExamsByTeacher(
                                    id: cubit.subjectDetails![index].id!,
                                    rate: cubit
                                        .subjectDetails![index].rate
                                        .toString(),
                                    teacherName: cubit
                                        .subjectDetails![index]
                                        .name ??
                                        "",
                                  )),
                              child: ItemOfTeachers(
                                cardColor: Colors.white,
                                cardData: cubit.subjectDetails![index],
                              ),
                            );
                          },
                          itemCount: cubit.subjectDetails!.length,
                        ),
                      )
                          : const Center(
                              child: TextWidget(title: LocaleKeys.no_techers),
                            ),
                    );
                  },
                ),
              ),
            ),
          ],
        )
      ]),
    );
  }
}