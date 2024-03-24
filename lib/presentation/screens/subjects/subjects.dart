import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tawjihi_quiz/presentation/components/loadinganderror.dart';
import 'package:tawjihi_quiz/presentation/screens/subjects/cubit/subject_cubit.dart';

import '../../../core/utils/utils.dart';
import '../../../core/values/colors.dart';
import '../../components/text_widget.dart';
import '../subject_details/subject_details.dart';

class Subjects extends StatelessWidget {
  const Subjects({super.key});

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
                children: [
                  Utils.backWidget(context),
                  SizedBox(
                    width: 32.w,
                  ),
                  TextWidget(
                    title: "المواد الدراسية",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w),
            child: BlocProvider<SubjectCubit>(
              create: (context) => SubjectCubit()..getSubject(),
              child: BlocConsumer<SubjectCubit, SubjectState>(
                listener: (context, state) {},
                builder: (context, state) {
                  SubjectCubit cubit = SubjectCubit.get(context);
                  return LoadingAndError(
                    isError: state is ErrorSubjectState,
                    errorMessage: state is ErrorSubjectState ? state.error : null,
                    isLoading: state is LoadingSubjectState,
                    child: cubit.subjectModel?.data != null &&
                            cubit.subjectModel!.data!.isNotEmpty
                        ? RefreshIndicator(
                            onRefresh: () async {
                              cubit.getSubject();
                            },
                            child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                              ),
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () => Utils.openScreen(
                                    context,
                                    SubjectDetails(
                                        id: cubit.subjectModel!.data![index].id!,
                                        subjectTitle: cubit
                                            .subjectModel!.data![index].title!),
                                  ),
                                  child: Container(
                                    height: 100.h,
                                    width: 100.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20.r),
                                        border:
                                            Border.all(color: borderMainColor)),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(16.w),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20.r),
                                              color: borderMainColor,
                                            ),
                                            child: Image.network(
                                              cubit.subjectModel!.data![index]
                                                      .image ??
                                                  "",
                                              width: 30.w,
                                              height: 30.w,
                                              fit: BoxFit.contain,
                                              errorBuilder:
                                                  (context, error, stackTrace) =>
                                                      Image.asset(
                                                'assets/images/teacher.png',
                                                width: 30.w,
                                                height: 30.w,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 16.h),
                                          TextWidget(
                                              title: cubit.subjectModel!
                                                  .data![index].title!,
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w500,
                                              color: primaryColor),
                                        ]),
                                  ),
                                );
                              },
                              itemCount: cubit.subjectModel?.data?.length,
                            ),
                          )
                        : const Center(
                            child: TextWidget(title: "لا يوجد مواد متاحه"),
                          ),
                  );
                },
              ),
            ),
          )),
        ],
      ),
    );
  }
}
