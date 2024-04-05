import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tawjihi_quiz/core/values/colors.dart';
import 'package:tawjihi_quiz/presentation/components/dropdown_widget.dart';
import 'package:tawjihi_quiz/presentation/components/loadinganderror.dart';
import 'package:tawjihi_quiz/presentation/screens/profile/cubit/profile_cubit.dart';
import 'package:tawjihi_quiz/translations/locale_keys.g.dart';
import '../../../core/utils/utils.dart';
import '../../components/button_widget.dart';
import '../../components/text_widget.dart';
import '../base/base_stateless.dart';
import '../settings/cubit/settings_cubit.dart';
import '../sign_up/widgets/custom_edit_text.dart';
import '../teachers/cubit/my_teacher_cubit.dart';

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
                title: LocaleKeys.edit_data,
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
                    MyTeacherCubit.get(context).getMyTeachers();
                    SettingsCubit.get(context)
                        .emit(UpdateSuccessUserDataState());
                    Utils.successDialog(
                      context: context,
                      title: LocaleKeys.saved,
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
                          GestureDetector(
                            onTap: () async {
                              final source =
                                  await Utils.showImageSource(context);
                              if (source == null) return;
                              cubit.pickImage(source);
                            },
                            child: Stack(
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
                                      gradient: LinearGradient(
                                          colors: gradientButton),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.camera_alt_rounded,
                                      color: Colors.white,
                                      size: 16.w,
                                    ),
                                  )
                                ]),
                          ),
                          state is LoadingImageState
                              ? const LinearProgressIndicator()
                              : const SizedBox(),
                          SizedBox(height: 16.h),
                          CustomEditText(
                            img: "assets/icons/profile-circle.png",
                            label: LocaleKeys.name,
                            controller: cubit.firstNameControler,
                          ),
                          SizedBox(height: 16.w),
                          CustomEditText(
                            img: "assets/icons/profile-circle.png",
                            label: LocaleKeys.family,
                            controller: cubit.lastNameControler,
                          ),
                          SizedBox(height: 16.w),
                          CustomEditText(
                            icon: Icons.email_outlined,
                            label: LocaleKeys.email,
                            controller: cubit.emailControler,
                            type: TextInputType.emailAddress,
                          ),
                          SizedBox(height: 16.w),
                          CustomEditText(
                            icon: Icons.phone_outlined,
                            label: LocaleKeys.phone,
                            controller: cubit.phoneControler,
                            type: TextInputType.phone,
                          ),
                          SizedBox(height: 16.w),
                          CustomEditText(
                            img: "assets/icons/building.png",
                            label: LocaleKeys.nationality,
                            controller: cubit.nationalityControler,
                          ),
                          SizedBox(height: 16.w),
                          DropdownWidget(
                              buttonTexthint: LocaleKeys.choose_country,
                              buttonWidth: double.infinity,
                              customSelectedItem: Text(
                                cubit.country?.name ?? LocaleKeys.choose_country,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: primaryColor,
                                ),
                                //overflow: TextOverflow.ellipsis,
                              ),
                              buttonElevation: false,
                              customeItems: Utils.countries
                                  .map((item) => DropdownMenuItem<dynamic>(
                                        value: item,
                                        child: Text(
                                          item.name ?? "",
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: primaryColor,
                                          ),
                                          // overflow: TextOverflow.ellipsis,
                                        ),
                                      ))
                                  .toList(),
                              dropdownButtonTextStyle: TextStyle(
                                fontSize: 14.sp,
                              ),
                              dropdownMenuTextStyle: TextStyle(fontSize: 14.sp),
                              onItemSelected: (value) {
                                cubit.changeSelectedItemDropDown(
                                    value: value, numer: 1);
                              }),
                          SizedBox(height: 16.w),
                          DropdownWidget(
                              buttonTexthint: LocaleKeys.choose_material,
                              buttonWidth: double.infinity,
                              customSelectedItem: Text(
                                cubit.manhag?.title ?? LocaleKeys.choose_material,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: primaryColor,
                                ),
                                //overflow: TextOverflow.ellipsis,
                              ),
                              buttonElevation: false,
                              customeItems: Utils.manhags
                                  .map((item) => DropdownMenuItem<dynamic>(
                                        value: item,
                                        child: Text(
                                          item.title ?? "",
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: primaryColor,
                                          ),
                                          // overflow: TextOverflow.ellipsis,
                                        ),
                                      ))
                                  .toList(),
                              dropdownButtonTextStyle: TextStyle(
                                fontSize: 14.sp,
                              ),
                              dropdownMenuTextStyle: TextStyle(fontSize: 14.sp),
                              onItemSelected: (value) {
                                cubit.changeSelectedItemDropDown(
                                    value: value, numer: 2);
                              }),
                          SizedBox(height: 16.w),
                          DropdownWidget(
                              buttonTexthint: LocaleKeys.choose_class,
                              buttonWidth: double.infinity,
                              customSelectedItem: Text(
                                cubit.term?.title ?? LocaleKeys.choose_class,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: primaryColor,
                                ),
                                //overflow: TextOverflow.ellipsis,
                              ),
                              buttonElevation: false,
                              customeItems: Utils.terms
                                  .map((item) => DropdownMenuItem<dynamic>(
                                        value: item,
                                        child: Text(
                                          item.title ?? "",
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: primaryColor,
                                          ),
                                          // overflow: TextOverflow.ellipsis,
                                        ),
                                      ))
                                  .toList(),
                              dropdownButtonTextStyle: TextStyle(
                                fontSize: 14.sp,
                              ),
                              dropdownMenuTextStyle: TextStyle(fontSize: 14.sp),
                              onItemSelected: (value) {
                                cubit.changeSelectedItemDropDown(
                                    value: value, numer: 3);
                              }),
                          SizedBox(height: 16.w),
                          DropdownWidget(
                              buttonTexthint: LocaleKeys.choose_section,
                              buttonWidth: double.infinity,
                              customSelectedItem: Text(
                                cubit.subjectType?.title ?? LocaleKeys.choose_section,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: primaryColor,
                                ),
                                //overflow: TextOverflow.ellipsis,
                              ),
                              buttonElevation: false,
                              customeItems: Utils.subjectType
                                  .map((item) => DropdownMenuItem<dynamic>(
                                        value: item,
                                        child: Text(
                                          item.title ?? "",
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: primaryColor,
                                          ),
                                          // overflow: TextOverflow.ellipsis,
                                        ),
                                      ))
                                  .toList(),
                              dropdownButtonTextStyle: TextStyle(
                                fontSize: 14.sp,
                              ),
                              dropdownMenuTextStyle: TextStyle(fontSize: 14.sp),
                              onItemSelected: (value) {
                                cubit.changeSelectedItemDropDown(
                                    value: value, numer: 4);
                              }),
                          SizedBox(height: 16.w),
                          CustomEditText(
                            img: "assets/icons/lock.png",
                            label:LocaleKeys.password,
                            controller: cubit.passwordController,
                            type: TextInputType.visiblePassword,
                          ),
                          SizedBox(height: 64.h),
                          ButtonWidget(
                              title: LocaleKeys.save,
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
