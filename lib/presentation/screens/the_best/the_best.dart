import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:tawjihi_quiz/core/values/colors.dart';
import 'package:tawjihi_quiz/presentation/components/button_widget.dart';
import 'package:tawjihi_quiz/presentation/components/loadinganderror.dart';
import 'package:tawjihi_quiz/presentation/screens/the_best/cubit/the_best_cubit.dart';
import 'package:tawjihi_quiz/presentation/screens/the_best/widgets/best_students.dart';
import 'package:tawjihi_quiz/presentation/screens/the_best/widgets/best_teachers.dart';
import '../../../core/utils/utils.dart';
import '../../components/text_widget.dart';

class TheBest extends StatelessWidget {
  const TheBest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<TheBestCubit, TheBestState>(
        listener: (context, state) {},
        builder: (context, state) {
          TheBestCubit cubit = TheBestCubit.get(context);
          return Container(
            width: double.infinity,
            height: double.infinity,
            color: containerColor,
            child: Stack(children: [
              Container(
                height: 0.3.sh,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.r),
                      bottomRight: Radius.circular(20.r)),
                  gradient: const LinearGradient(colors: gradientButton),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    children: [
                      Utils.backWidget(context),
                      SizedBox(width: 16.w),
                      Expanded(
                        child: TextWidget(
                          title: "الاكثر تميزا",
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              LoadingAndError(
                isError: state is ErrorTheBestState,
                errorMessage: state is ErrorTheBestState ? state.error : null,
                isLoading: state is LoadingTheBestState,
                function: () async => cubit.getBestStudents(),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 0.2.sh,
                    left: 16.w,
                    right: 16.w,
                  ),
                  child: Column(children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 32.w,
                        horizontal: 8.w
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.r),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Row(children: [
                              Container(
                                padding: EdgeInsets.all(16.w),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(colors: [
                                    Color(0xffFF6267),
                                    Color(0xffFA4348)
                                  ]),
                                ),
                                child: Image.asset(
                                  'assets/icons/ranking.png',
                                  width: 24.w,
                                  height: 24.w,
                                  fit: BoxFit.fill,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 8.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const TextWidget(
                                    title: "ترتيبى العام",
                                    color: Colors.black,
                                  ),
                                  GradientText(
                                      cubit.bestModel?.data?.studentOrder
                                              .toString() ??
                                          "",
                                      style: TextStyle(
                                        fontSize: 16.0.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      colors: gradientButton)
                                ],
                              ),
                            ]),
                          ),
                          Expanded(
                            child: Row(children: [
                              Container(
                                padding: EdgeInsets.all(16.w),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(colors: [
                                    Color(0xffF89A32),
                                    Color(0xffFA4348)
                                  ]),
                                ),
                                child: Image.asset(
                                  'assets/icons/rate.png',
                                  width: 24.w,
                                  height: 24.w,
                                  fit: BoxFit.fill,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 8.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const TextWidget(
                                    title: "نسبة التفاعل",
                                    color: Colors.black,
                                  ),
                                  GradientText(
                                      cubit.bestModel?.data?.activity ?? "",
                                      style: TextStyle(
                                        fontSize: 16.0.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      colors: gradientButton)
                                ],
                              )
                            ]),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.w),
                    Container(
                      padding: EdgeInsets.all(20.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.r),
                        color: Colors.white,
                      ),
                      child: Row(children: [
                        Expanded(
                          child: ButtonWidget(
                            onTap: () => cubit.changeButton(0),
                            height: 45.w,
                            title: "ترتيب الطلاب",
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                            textColor:
                                cubit.type == 0 ? Colors.white : secondaryColor,
                            backgroundButtonColor:
                                cubit.type == 0 ? null : Colors.white,
                            radius: 16.r,
                          ),
                        ),
                        SizedBox(width: 16.w),
                        Expanded(
                          child: ButtonWidget(
                            onTap: () => cubit.changeButton(1),
                            height: 45.w,
                            title: "ترتيب المعلمين",
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                            textColor:
                                cubit.type == 1 ? Colors.white : secondaryColor,
                            backgroundButtonColor:
                                cubit.type == 1 ? null : Colors.white,
                            radius: 16.r,
                          ),
                        )
                      ]),
                    ),
                    SizedBox(height: 16.w),
                    cubit.type == 0
                        ? const BestStudents()
                        : const BestTeachers()
                  ]),
                ),
              )
            ]),
          );
        },
      ),
    );
  }
}
