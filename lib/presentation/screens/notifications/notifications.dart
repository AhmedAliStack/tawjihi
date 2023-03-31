import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tawjihi_quiz/presentation/screens/notifications/widgets/item_of_notifications.dart';
import 'package:tawjihi_quiz/core/values/colors.dart';
import '../../../core/utils/utils.dart';
import '../../components/text_widget.dart';
import '../base/base_stateless.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseStateless(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(
                start: 16.w, top: 32.h, end: 16.w, bottom: 16.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Utils.backWidget(context, authScreensBack: true),
                TextWidget(
                  title: "التنبيهات",
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
                SizedBox(width: 32.w),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => Divider(
                color: borderMainColor,
              ),
              padding: EdgeInsets.only(
                  top: 16.w, bottom: 16.h, right: 24.w, left: 24.w),
              itemBuilder: (context, index) => ItemOfNotifications(),
              itemCount: 10,
            ),
          )
        ],
      ),
    );
  }
}
