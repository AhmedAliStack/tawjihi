import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tawjihi_quiz/presentation/screens/messages/widgets/item_of_messages.dart';
import 'package:tawjihi_quiz/core/values/colors.dart';
import '../../../core/utils/utils.dart';
import '../../components/text_widget.dart';
import '../base/base_stateless.dart';

class Messages extends StatelessWidget {
  const Messages({super.key});

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
                  title: "الرسائل",
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
                  top: 32.w, bottom: 0, right: 24.w, left: 24.w),
              itemBuilder: (context, index) => ItemOfMessages(),
              itemCount: 10,
            ),
          )
        ],
      ),
    );
  }
}
