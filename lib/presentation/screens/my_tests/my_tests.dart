import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tawjihi_quiz/domain/models/achievements_model.dart';
import 'package:tawjihi_quiz/presentation/components/loadinganderror.dart';
import 'package:tawjihi_quiz/presentation/screens/achievements/cubit/achievements_cubit.dart';
import 'package:tawjihi_quiz/presentation/screens/achievements_details/achievements_details.dart';
import 'package:tawjihi_quiz/translations/locale_keys.g.dart';
import '../../../core/utils/utils.dart';
import '../../../core/values/colors.dart';
import '../../components/text_widget.dart';

class MyTests extends StatelessWidget {
  const MyTests({super.key});

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
                    title: LocaleKeys.my_tests.tr(),
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: BlocProvider(
              create: (context) => AchievementsCubit()..getAchievements(),
              child: BlocConsumer<AchievementsCubit, AchievementsState>(
                listener: (context, state) {},
                builder: (context, state) {
                  AchievementsCubit cubit = AchievementsCubit.get(context);
                  return LoadingAndError(
                    isLoading: state is LoadingAchievementsState,
                    isError: state is ErrorAchievementsState,
                    errorMessage:
                        state is ErrorAchievementsState ? state.error : null,
                    function: () async => cubit.getAchievements(),
                    child: cubit.achievementsModel?.data?.subjects == null ||
                            cubit.achievementsModel!.data!.subjects!.isEmpty
                        ? RefreshIndicator(
                            onRefresh: () async => cubit.getAchievements(),
                            child: SingleChildScrollView(
                                physics: const AlwaysScrollableScrollPhysics(),
                                child: Padding(
                                  padding: EdgeInsets.only(top: 0.2.sh),
                                  child: TextWidget(
                                      title: LocaleKeys.no_tests.tr()),
                                )),
                          )
                        : RefreshIndicator(
                            onRefresh: () async => cubit.getAchievements(),
                            child: ListView.separated(
                              padding: EdgeInsets.all(16.w),
                              separatorBuilder: (context, index) =>
                                  SizedBox(height: 8.w),
                              itemBuilder: (context, index) {
                                Subjects subjects = cubit
                                    .achievementsModel!.data!.subjects![index];
                                return GestureDetector(
                                  onTap: () {
                                    Utils.openScreen(
                                        context,
                                        AchievementsDetails(
                                          id: subjects.subjectId!,
                                          myTestTitle:
                                              "${LocaleKeys.test.tr()} ${subjects.subject}",
                                        ));
                                  },
                                  child: Container(
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
                                          borderRadius:
                                              BorderRadius.circular(20.r),
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
                                        title: "${LocaleKeys.test.tr()} ${subjects.subject}",
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                      trailing: const Icon(
                                        Icons.arrow_forward_ios,
                                        color: mauveColor,
                                      ),
                                    ),
                                  ),
                                );
                              },
                              itemCount: cubit.achievementsModel?.data
                                      ?.subjects!.length ??
                                  0,
                            ),
                          ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
