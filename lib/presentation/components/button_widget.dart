import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/values/colors.dart';
import 'text_widget.dart';

class ButtonWidget extends StatelessWidget {
  String title;
  double width, height, radius;
  double? fontSize;
  FontWeight? fontWeight;
  Widget? child;
  Color? backgroundButtonColor;
  Color textColor, borderColor, inkColor;
  void Function()? onTap;
  bool withBorder;
  Gradient? gradient;

  ButtonWidget({
    Key? key,
    this.title = "OK",
    this.width = 88.0,
    this.height = 62.0,
    this.onTap,
    this.child,
    this.fontSize,
    this.fontWeight,
    this.textColor = Colors.white,
    this.backgroundButtonColor,
    this.borderColor = borderMainColor,
    this.inkColor = secondaryColor,
    this.withBorder = false,
    this.radius = 12.0,
    this.gradient = const LinearGradient(
      colors: gradientButton,
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
          backgroundColor: MaterialStateProperty.all<Color>(
              backgroundButtonColor ?? Colors.transparent),
          shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius),
                  side: withBorder
                      ? BorderSide(color: borderColor)
                      : const BorderSide(color: Colors.transparent)))),
      onPressed: onTap,
      child: Ink(
        decoration: BoxDecoration(
          // color: inkColor,
          gradient: backgroundButtonColor == null ? gradient : null,
          borderRadius: BorderRadius.all(Radius.circular(radius)),
        ),
        child: Container(
          constraints: BoxConstraints(minWidth: width, minHeight: height),
          // min sizes for Material buttons
          alignment: Alignment.center,
          child: child ??
              TextWidget(
                title: title,
                fontSize: fontSize ?? 16.sp,
                fontWeight: fontWeight,
                textAlign: TextAlign.center,
                color: textColor,
              ),
        ),
      ),
    );
  }
}
