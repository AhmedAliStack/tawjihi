import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tawjihi_quiz/presentation/components/loadinganderror.dart';
import 'package:tawjihi_quiz/presentation/screens/notifications/cubit/notifications_cubit.dart';
import 'package:tawjihi_quiz/presentation/screens/notifications/widgets/item_of_notifications.dart';
import 'package:tawjihi_quiz/core/values/colors.dart';
import '../../components/text_widget.dart';
import '../base/base_stateless.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BaseStateless(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(
                start: 16.w, top: 32.h, end: 16.w, bottom: 16.h),
            child: Center(
              child: TextWidget(
                title: "التنبيهات",
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
          Expanded(
            child: BlocConsumer<NotificationsCubit, NotificationsState>(
              listener: (context, state) {},
              builder: (context, state) {
                NotificationsCubit cubit = NotificationsCubit.get(context);
                return LoadingAndError(
                  isLoading: state is LoadingNotificationsState,
                  isError: state is ErrorNotificationsState,
                  errorMessage:
                      state is ErrorNotificationsState ? state.error : null,
                  function: () => cubit.getNotifications(),
                  child: cubit.notificationsModel?.data != null &&
                          cubit.notificationsModel!.data!.isNotEmpty
                      ? RefreshIndicator(
                          onRefresh: () async {
                            await cubit.getNotifications();
                          },
                          child: ListView.separated(
                            separatorBuilder: (context, index) => const Divider(
                              color: borderMainColor,
                            ),
                            padding: EdgeInsets.only(
                                top: 16.w,
                                bottom: 16.h,
                                right: 24.w,
                                left: 24.w),
                            itemBuilder: (context, index) =>
                                ItemOfNotifications(
                                    title: cubit.notificationsModel
                                            ?.data?[index].message ??
                                        ""),
                            itemCount: cubit.notificationsModel!.data!.length,
                          ),
                        )
                      : RefreshIndicator(
                          onRefresh: () async {
                            await cubit.getNotifications();
                          },
                          child: SingleChildScrollView(
                            physics: const AlwaysScrollableScrollPhysics(),
                            child: Padding(
                              padding: EdgeInsets.only(top: 0.3.sh),
                              child: const TextWidget(
                                title: "لا يوجد إشعارات",
                              ),
                            ),
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
