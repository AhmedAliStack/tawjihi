import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tawjihi_quiz/presentation/components/loadinganderror.dart';
import 'package:tawjihi_quiz/presentation/screens/converstions/cubit/converstions_cubit.dart';
import 'package:tawjihi_quiz/presentation/screens/converstions/widgets/item_of_converstions.dart';
import 'package:tawjihi_quiz/core/values/colors.dart';
import '../../components/text_widget.dart';
import '../base/base_stateless.dart';

class Converstions extends StatelessWidget {
  const Converstions({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseStateless(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(
                start: 16.w, top: 32.h, end: 16.w, bottom: 16.h),
            child: Center(
              child: TextWidget(
                title: "الرسائل",
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
          Expanded(
            child: BlocConsumer<ConverstionsCubit, ConverstionsState>(
              listener: (context, state) {},
              builder: (context, state) {
                ConverstionsCubit cubit = ConverstionsCubit.get(context);
                return LoadingAndError(
                  isLoading: state is LoadingConverstionsState,
                  isError: state is ErrorConverstionsState,
                  errorMessage:
                      state is ErrorConverstionsState ? state.error : null,
                  function: () => cubit.getConverstions(),
                  child: cubit.converstionsModel?.data == null ||
                          cubit.converstionsModel!.data!.isEmpty
                      ? RefreshIndicator(
                          onRefresh: () async {
                            await cubit.getConverstions();
                          },
                          child: SingleChildScrollView(
                            physics: const AlwaysScrollableScrollPhysics(),
                            child: Padding(
                              padding: EdgeInsets.only(top: 0.3.sh),
                              child: const TextWidget(
                                title: "لا يوجد رسائل",
                              ),
                            ),
                          ),
                        )
                      : RefreshIndicator(
                          onRefresh: () async {
                            await cubit.getConverstions();
                          },
                          child: ListView.separated(
                            separatorBuilder: (context, index) => const Divider(
                              color: borderMainColor,
                            ),
                            padding: EdgeInsets.only(
                                top: 16.w, bottom: 0, right: 24.w, left: 24.w),
                            itemBuilder: (context, index) =>
                                ItemOfConverstions(cubit: cubit, index: index),
                            itemCount: cubit.converstionsModel!.data!.length,
                          ),
                        ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
