import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tawjihi_quiz/core/values/colors.dart';
import 'package:tawjihi_quiz/presentation/components/loadinganderror.dart';
import 'package:tawjihi_quiz/presentation/screens/profile/cubit/profile_cubit.dart';
import 'package:tawjihi_quiz/presentation/screens/sign_up/widgets/custom_drop_down.dart';
import '../../../core/utils/utils.dart';
import '../../components/button_widget.dart';
import '../../components/text_widget.dart';
import '../base/base_stateless.dart';
import '../sign_up/widgets/custom_edit_text.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});
  @override
  Widget build(BuildContext context) {
    return BaseStateless(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Utils.backWidget(context,
                  authScreensBack: true, onBack: () => Navigator.pop(context)),
              TextWidget(
                title: "تعديل بياناتى",
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              SizedBox(width: 32.w),
            ],
          ),
          SizedBox(height: 16.h),
          Expanded(
            child: BlocProvider(
              create: (context) => ProfileCubit()..getAll(),
              child: BlocConsumer<ProfileCubit, ProfileState>(
                listener: (context, state) {
                  if (state is SuccessProfileState) {
                    Utils.successDialog(
                      context: context,
                      title: "تم الحفظ بنجاح",
                    ).then((value) => Navigator.pop(context));
                  }
                },
                builder: (context, state) {
                  ProfileCubit cubit = ProfileCubit.get(context);
                  return LoadingAndError(
                    isError: state is ErrorProfileState,
                    isLoading: state is LoadingProfileState,
                    errorMessage:
                        state is ErrorProfileState ? state.error : null,
                    function: () async => cubit.updateProfile(),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Stack(
                              alignment: AlignmentDirectional.topEnd,
                              children: [
                                CircleAvatar(
                                  radius: 50.r,
                                  backgroundColor: Colors.transparent,
                                  backgroundImage: const AssetImage(
                                      'assets/images/gradient_circle.png'),
                                  child: CircleAvatar(
                                    radius: 45.r,
                                    child: Container(
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.network(
                                        Utils.userModel.user?.image ?? '',
                                        width: 100.w,
                                        height: 100.w,
                                        fit: BoxFit.fill,
                                        errorBuilder:
                                            (context, error, stackTrace) =>
                                                Image.asset(
                                          'assets/images/teacher.png',
                                          width: 100.w,
                                          height: 100.w,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(8.w),
                                  decoration: const BoxDecoration(
                                    gradient:
                                        LinearGradient(colors: gradientButton),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.camera_alt_rounded,
                                    color: Colors.white,
                                    size: 16.w,
                                  ),
                                )
                              ]),
                          SizedBox(height: 16.h),
                          CustomEditText(
                            img: "assets/icons/profile-circle.png",
                            label: "الاسم",
                            controller: cubit.firstNameControler,
                          ),
                          SizedBox(height: 16.w),
                          CustomEditText(
                            img: "assets/icons/profile-circle.png",
                            label: "اسم العائلة",
                            controller: cubit.lastNameControler,
                          ),
                          SizedBox(height: 16.w),
                          CustomEditText(
                            icon: Icons.email_outlined,
                            label: "البريد الالكتروني",
                            controller: cubit.emailControler,
                            type: TextInputType.emailAddress,
                          ),
                          SizedBox(height: 16.w),
                          CustomEditText(
                            icon: Icons.phone_outlined,
                            label: "الهاتف الجوال",
                            controller: cubit.phoneControler,
                            type: TextInputType.phone,
                          ),
                          SizedBox(height: 16.w),
                          CustomEditText(
                            img: "assets/icons/building.png",
                            label: "الجنسية",
                            controller: cubit.nationalityControler,
                          ),
                          SizedBox(height: 16.w),
                          CustomDropDown(
                            title: "اختر البد",
                            icon: Icons.flag_outlined,
                            onItemSelected: (value) {
                              cubit.changeSelectedItemDropDown(
                                  value: value, numer: 1);
                            },
                            dropdownItems:
                                Utils.countries.map((e) => e.name!).toList(),
                            dropdownValue: cubit.country,
                          ),
                          SizedBox(height: 16.w),
                          CustomDropDown(
                            title: "المنهج",
                            icon: Icons.school,
                            onItemSelected: (value) {
                              cubit.changeSelectedItemDropDown(
                                  value: value, numer: 2);
                            },
                            dropdownItems:
                                Utils.manhags.map((e) => e.title!).toList(),
                            dropdownValue: cubit.manhag,
                          ),
                          SizedBox(height: 16.w),
                          CustomDropDown(
                            title: "الصف",
                            icon: Icons.school,
                            onItemSelected: (value) {
                              cubit.changeSelectedItemDropDown(
                                  value: value, numer: 3);
                            },
                            dropdownItems:
                                Utils.terms.map((e) => e.title!).toList(),
                            dropdownValue: cubit.term,
                          ),
                          SizedBox(height: 16.w),
                          CustomDropDown(
                            title: "القسم",
                            icon: Icons.school,
                            onItemSelected: (value) {
                              cubit.changeSelectedItemDropDown(
                                  value: value, numer: 4);
                            },
                            dropdownItems:
                                Utils.subjectType.map((e) => e.title!).toList(),
                            dropdownValue: cubit.subjectType,
                          ),
                          SizedBox(height: 16.w),
                          CustomEditText(
                            img: "assets/icons/lock.png",
                            label: "رقم المرور",
                            controller: cubit.passwordController,
                            type: TextInputType.visiblePassword,
                          ),
                          SizedBox(height: 64.h),
                          ButtonWidget(
                              title: "حفظ",
                              fontSize: 16.sp,
                              onTap: () {
                                cubit.updateProfile();
                                // Utils.successDialog(
                                //   context: context,
                                //   title: "تم الحفظ بنجاح",
                                // ).then((value) => Navigator.pop(context));
                              }),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ]),
      ),
    );
  }
}
