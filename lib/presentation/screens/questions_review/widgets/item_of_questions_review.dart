// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../components/text_widget.dart';

class ItemOfQuestionsReview extends StatelessWidget {
  final bool? correct;
  final String title;
  final bool more;

  const ItemOfQuestionsReview({
    Key? key,
    this.correct,
    required this.title,
    this.more = false,
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
        border: Border.all(
            color: more
                ? Colors.purple
                : correct == null
                    ? Colors.grey
                    : correct!
                        ? const Color(0xff93D774)
                        : const Color(0xffD40E0E)),
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
        correct == null
            ? const SizedBox()
            : correct!
                ? Image.asset("assets/icons/correct_circle.png",
                    width: 24.w, height: 24.w, fit: BoxFit.fill)
                : Image.asset("assets/icons/wrong_circle.png",
                    width: 24.w, height: 24.w, fit: BoxFit.fill),
      ]),
    );
  }
}
