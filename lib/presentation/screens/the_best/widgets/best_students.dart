import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:tawjihi_quiz/core/values/colors.dart';
import 'package:tawjihi_quiz/presentation/components/loadinganderror.dart';
import 'package:tawjihi_quiz/presentation/components/text_widget.dart';
import 'package:tawjihi_quiz/presentation/screens/the_best/cubit/the_best_cubit.dart';

class BestStudents extends StatelessWidget {
  const BestStudents({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TheBestCubit, TheBestState>(
      listener: (context, state) {},
      builder: (context, state) {
        TheBestCubit cubit = TheBestCubit.get(context);
        return Expanded(
          child: LoadingAndError(
            isLoading: state is LoadingTheBestStudentsState,
            errorMessage: state is ErrorTheBestState ? state.error : null,
            isError: State is ErrorTheBestState,
            child: cubit.bestModel?.data?.students != null &&
                    cubit.bestModel!.data!.students!.isNotEmpty
                ? Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(16.w),
                          child: Row(children: [
                            Expanded(
                              child: TextWidget(
                                title: "الاسم",
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              width: 2.w,
                              height: 16.w,
                              color: borderMainColor,
                            ),
                            Expanded(
                              child: TextWidget(
                                title: "المرتبة",
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              width: 2.w,
                              height: 16.w,
                              color: borderMainColor,
                            ),
                            Expanded(
                              child: TextWidget(
                                title: "نسبة التفعيل",
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                                textAlign: TextAlign.center,
                              ),
                            )
                          ]),
                        ),
                        const Divider(color: borderMainColor, thickness: 2),
                        Expanded(
                          child: RefreshIndicator(
                            onRefresh: () async =>
                                cubit.getBestStudents(listonly: true),
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              itemBuilder: (context, index) =>
                                  Column(children: [
                                Padding(
                                  padding: EdgeInsets.all(16.0.w),
                                  child: Row(children: [
                                    Expanded(
                                      child: TextWidget(
                                        title: cubit.bestModel!.data!
                                            .students![index].name,
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w500,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Expanded(
                                      child: TextWidget(
                                        title: (index + 1).toString(),
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w500,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Expanded(
                                        child: GradientText(
                                            "${cubit.bestModel!.data!.students![index].avgRate}%",
                                            style: TextStyle(
                                              fontSize: 13.0.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            textAlign: TextAlign.center,
                                            colors: gradientButton))
                                  ]),
                                ),
                                const Divider(
                                    color: borderMainColor, thickness: 2),
                              ]),
                              itemCount:
                                  cubit.bestModel!.data!.students!.length,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                : RefreshIndicator(
                    onRefresh: () async =>
                        cubit.getBestStudents(listonly: true),
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 64.h),
                          child: const TextWidget(
                            title: "لا يوجد حتى الاّن",
                          ),
                        ),
                      ),
                    ),
                  ),
          ),
        );
      },
    );
  }
}
