import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/values/colors.dart';
import '../../../components/text_widget.dart';
import '../../chat/chat.dart';

class ItemOfMessages extends StatelessWidget {
  const ItemOfMessages({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Utils.openScreen(context, Chat()),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0.w),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: TextWidget(
              title: "3:50",
              fontSize: 12.sp,
              fontWeight: FontWeight.w300,
            ),
          ),
          Row(
            children: [
              Image.asset(
                "assets/images/teacher.png",
                width: 50.w,
                height: 50.w,
                fit: BoxFit.contain,
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        title: "محمد ابراهيم",
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextWidget(
                              title: "مرحبا كيف احوالك ",
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w300,
                              color: const Color(0xff848484),
                              maxLines: 1,
                            ),
                          ),
                          SizedBox(width: 16.w),
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: yellow.withOpacity(0.25),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(12.0.w),
                              child: TextWidget(
                                title: "1",
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      )
                    ]),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
