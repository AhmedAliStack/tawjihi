import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextWidget extends StatelessWidget {
  final String? title;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final bool isOffer;

  // ignore: use_key_in_widget_constructors
  const TextWidget(
      {required this.title,
      this.fontSize,
      this.fontWeight,
      this.maxLines = 2,
      this.color,
      this.textAlign,
      this.isOffer = false});

  @override
  Widget build(BuildContext context) {
    return Text(
      title ?? "",
      maxLines: maxLines,
      overflow: maxLines == null ? null : TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: fontSize ?? 14.sp,
        fontWeight: fontWeight ?? FontWeight.w400,
        decoration: isOffer ? TextDecoration.lineThrough : null,
        height: 1.2,
        color: color ?? Theme.of(context).textTheme.bodyLarge!.color,
      ),
      textAlign: textAlign,
    );
  }
}
