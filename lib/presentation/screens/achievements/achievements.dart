import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tawjihi_quiz/presentation/components/loadinganderror.dart';
import 'package:tawjihi_quiz/presentation/screens/achievements/cubit/achievements_cubit.dart';
import 'package:tawjihi_quiz/presentation/screens/achievements/widgets/achievements_card.dart';
import 'package:tawjihi_quiz/core/values/colors.dart';

import '../../../core/utils/utils.dart';
import '../../components/text_widget.dart';
import '../achievements_details/achievements_details.dart';

class Achievements extends StatefulWidget {
  const Achievements({super.key});

  @override
  State<Achievements> createState() => _AchievementsState();
}

class _AchievementsState extends State<Achievements>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: containerColor,
        child: Stack(children: [
          Container(
            height: 0.3.sh,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(20.r), right: Radius.circular(20.r)),
              gradient: const LinearGradient(colors: gradientButton),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Utils.backWidget(context),
                  TextWidget(
                    title: "انجازاتى",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                  SizedBox(width: 32.w),
                ],
              ),
            ),
          ),
          BlocConsumer<AchievementsCubit, AchievementsState>(
            listener: (context, state) {},
            builder: (context, state) {
              AchievementsCubit cubit = AchievementsCubit.get(context);
              return Padding(
                padding: EdgeInsets.only(top: 0.2.sh, left: 16.w, right: 16.w),
                child: Column(children: [
                  AchievementsCard(
                    headerCard: true,
                    subject: "نسبة الانجاز العامة",
                    teacherName: cubit.achievementsModel?.data?.level ?? "",
                    percentHeaderCard:
                        cubit.achievementsModel?.data?.total != null
                            ? cubit.achievementsModel!.data!.total!
                            : 0,
                    percentCard: null,
                    questionTotal: null,
                    questionResult: null,
                  ),
                  Expanded(
                      child: RefreshIndicator(
                    onRefresh: () async => cubit.getAchievements(),
                    child: LoadingAndError(
                      isError: state is ErrorAchievementsState,
                      errorMessage:
                          state is ErrorAchievementsState ? state.error : null,
                      isLoading: state is LoadingAchievementsState,
                      function: () async => cubit.getAchievements(),
                      child: cubit.achievementsModel?.data?.subjects != null &&
                              cubit
                                  .achievementsModel!.data!.subjects!.isNotEmpty
                          ? ListView.separated(
                              separatorBuilder: (context, index) =>
                                  SizedBox(height: 8.h),
                              itemBuilder: (context, index) => GestureDetector(
                                onTap: () {
                                  Utils.openScreen(
                                      context,
                                      AchievementsDetails(
                                          id: cubit.achievementsModel!.data!
                                              .subjects![index].subjectId!));
                                },
                                child: AchievementsCard(
                                  subject: cubit.achievementsModel!.data!
                                          .subjects![index].subject ??
                                      "",
                                  teacherName: cubit.achievementsModel!.data!
                                          .subjects![index].teacherName ??
                                      "",
                                  questionTotal: cubit.achievementsModel!.data!
                                          .subjects![index].total ??
                                      0,
                                  questionResult: cubit.achievementsModel!.data!
                                          .subjects![index].result ??
                                      0,
                                  percentCard: cubit.achievementsModel!.data!
                                          .subjects![index].percent ??
                                      0,
                                  percentHeaderCard: null,
                                ),
                              ),
                              itemCount: cubit
                                  .achievementsModel!.data!.subjects!.length,
                            )
                          : const Center(
                              child: TextWidget(title: "لا يوجد بيانات سايقة "),
                            ),
                    ),
                  ))
                ]),
              );
            },
          )
        ]),
      ),
    );
  }
}
