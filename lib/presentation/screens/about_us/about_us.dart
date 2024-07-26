import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tawjihi_quiz/core/utils/utils.dart';
import 'package:tawjihi_quiz/presentation/components/loadinganderror.dart';
import 'package:tawjihi_quiz/presentation/components/text_widget.dart';
import 'package:tawjihi_quiz/presentation/screens/about_us/cubit/about_us_cubit.dart';
import 'package:tawjihi_quiz/presentation/screens/base/base_stateless.dart';
import 'package:tawjihi_quiz/translations/locale_keys.g.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseStateless(
        body: BlocConsumer<AboutUsCubit, AboutUsState>(
      listener: (context, state) {},
      builder: (context, state) {
        AboutUsCubit cubit = AboutUsCubit.get(context);
        return Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 32.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Utils.backWidget(context, authScreensBack: true),
                  TextWidget(
                    title: LocaleKeys.about.tr(),
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  SizedBox(width: 32.w),
                ],
              ),
              SizedBox(height: 16.h),
              Expanded(
                child: LoadingAndError(
                  isLoading: state is LoadingAboutUsState,
                  isError: state is ErrorAboutUsState,
                  errorMessage: state is ErrorAboutUsState ? state.error : null,
                  function: () async => cubit.getAboutUs(),
                  child: SingleChildScrollView(
                    child: Text(cubit.aboutUs ?? ""),
                  ),
                ),
              )
            ],
          ),
        );
      },
    ));
  }
}
