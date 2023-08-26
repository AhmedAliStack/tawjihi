// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:tawjihi_quiz/core/values/colors.dart';
import 'package:tawjihi_quiz/presentation/components/loadinganderror.dart';
import 'package:tawjihi_quiz/presentation/screens/achievements_details/cubit/achievements_details_cubit.dart';
import 'package:tawjihi_quiz/presentation/screens/achievements_details/widgets/item_of_details.dart';
import 'package:tawjihi_quiz/presentation/screens/questions_review/questions_review.dart';

import '../../../core/utils/utils.dart';
import '../../components/text_widget.dart';
import '../achievements/widgets/achievements_card.dart';

class AchievementsDetails extends StatelessWidget {
  final int id;
  final String? myTestTitle;
  const AchievementsDetails({
    Key? key,
    required this.id,
    this.myTestTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            AchievementsDetailsCubit()..getAchievementsDetails(id),
        child: BlocConsumer<AchievementsDetailsCubit, AchievementsDetailsState>(
          listener: (context, state) {},
          builder: (context, state) {
            AchievementsDetailsCubit cubit =
                AchievementsDetailsCubit.get(context);
            return LoadingAndError(
              isError: state is ErrorAchievementsDetailsState,
              errorMessage:
                  state is ErrorAchievementsDetailsState ? state.error : null,
              isLoading: state is LoadingAchievementsDetailsState,
              function: () async => cubit.getAchievementsDetails(id),
              child: Container(
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
                              title: myTestTitle ??
                                  " الانجاز فى اختبارات ${cubit.achievementsDetailsModel?.data?.subject}",
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: 0.2.sh, left: 16.w, right: 16.w),
                    child: Column(children: [
                      myTestTitle != null
                          ? const SizedBox()
                          : AchievementsCard(
                              headerCard: true,
                              subject: "نسبة الانجاز العامة",
                              teacherName:
                                  cubit.achievementsDetailsModel?.data?.level ??
                                      "",
                              percentHeaderCard:
                                  cubit.achievementsDetailsModel?.data?.total ??
                                      0,
                              percentCard: null,
                              questionResult: null,
                              questionTotal: null,
                            ),
                      Expanded(
                          child: RefreshIndicator(
                        onRefresh: () async => cubit.getAchievementsDetails(id),
                        child: cubit.achievementsDetailsModel?.data?.exams !=
                                    null &&
                                cubit.achievementsDetailsModel!.data!.exams!
                                    .isNotEmpty
                            ? ListView.separated(
                                separatorBuilder: (context, index) =>
                                    SizedBox(height: 8.h),
                                itemBuilder: (context, index) =>
                                    GestureDetector(
                                  onTap: () {
                                    myTestTitle == null
                                        ? null
                                        : Utils.openScreen(
                                            context,
                                            QuestionsReview(
                                                examTitle: cubit
                                                    .achievementsDetailsModel!
                                                    .data!
                                                    .exams![index]
                                                    .exam!,
                                                resultId: cubit
                                                    .achievementsDetailsModel!
                                                    .data!
                                                    .exams![index]
                                                    .resultId!));
                                  },
                                  child: ItemOfDetails(
                                    index: index,
                                    title: cubit.achievementsDetailsModel?.data
                                            ?.exams?[index].exam ??
                                        "",
                                    percent: cubit.achievementsDetailsModel
                                            ?.data?.exams?[index].percent ??
                                        0,
                                  ),
                                ),
                                itemCount: cubit.achievementsDetailsModel!.data!
                                    .exams!.length,
                              )
                            : const Center(
                                child: TextWidget(title: "لا يوجد اختبارات"),
                              ),
                      ))
                    ]),
                  )
                ]),
              ),
            );
          },
        ),
      ),
    );
  }
}
