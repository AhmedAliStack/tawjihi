import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tawjihi_quiz/presentation/components/loadinganderror.dart';
import 'package:tawjihi_quiz/presentation/screens/teachers/cubit/my_teacher_cubit.dart';
import 'package:tawjihi_quiz/presentation/screens/teachers/widgets/item_of_teachers.dart';
import 'package:tawjihi_quiz/translations/locale_keys.g.dart';
import '../../../core/utils/utils.dart';
import '../../components/text_widget.dart';
import '../teacher_info/teacher_info.dart';

class MyTeachers extends StatefulWidget {
  const MyTeachers({super.key});

  @override
  State<MyTeachers> createState() => _MyTeachersState();
}

class _MyTeachersState extends State<MyTeachers>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              height: 0.3.sw,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xffF8F8F8),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10.r),
                  bottomRight: Radius.circular(10.r),
                ),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.only(
                    start: 16.w, top: 16.h, end: 16.w),
                child: Center(
                  child: TextWidget(
                    title: LocaleKeys.my_teachers,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Expanded(
              child: BlocConsumer<MyTeacherCubit, MyTeacherState>(
                listener: (context, state) {},
                builder: (context, state) {
                  MyTeacherCubit cubit = MyTeacherCubit.get(context);
                  return LoadingAndError(
                    isLoading: state is LoadingMyTeacherState,
                    isError: state is ErrorMyTeacherState,
                    errorMessage:
                        state is ErrorMyTeacherState ? state.error : null,
                    function: () => cubit.getMyTeachers(),
                    child: cubit.myTeachersModel?.data != null &&
                            cubit.myTeachersModel!.data!.isNotEmpty
                        ? RefreshIndicator(
                            onRefresh: () async {
                              cubit.getMyTeachers();
                            },
                            child: ListView.separated(
                              padding: EdgeInsets.all(16.w),
                              separatorBuilder: (context, index) =>
                                  SizedBox(height: 8.w),
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                    onTap: () => Utils.openScreen(
                                        context,
                                        Teacherinfo(
                                            teacherData: cubit.myTeachersModel
                                                ?.data![index])),
                                    child: ItemOfTeachers(
                                      cardData:
                                          cubit.myTeachersModel!.data![index],
                                    ));
                              },
                              itemCount: cubit.myTeachersModel!.data!.length,
                            ),
                          )
                        : const Center(
                            child: TextWidget(
                            title: LocaleKeys.no_teachers,
                          )),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
