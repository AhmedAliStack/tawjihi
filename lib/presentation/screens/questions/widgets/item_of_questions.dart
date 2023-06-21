// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../components/text_widget.dart';

class ItemOfQuestions extends StatelessWidget {
  final bool correct;
  final String title;

  const ItemOfQuestions({
    Key? key,
    this.correct = false,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(37.r),
        ),
        border: Border.all(color: const Color(0xff93D774)),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Expanded(
          child: TextWidget(
            title: title,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        correct
            ? Image.asset("assets/icons/correct_circle.png",
                width: 24.w, height: 24.w, fit: BoxFit.fill)
            : Image.asset("assets/icons/wrong_circle.png",
                width: 24.w, height: 24.w, fit: BoxFit.fill),
      ]),
    );
  }
}
