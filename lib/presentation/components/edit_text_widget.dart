import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tawjihi_quiz/core/values/colors.dart';
import 'package:tawjihi_quiz/presentation/components/text_widget.dart';

class EditTextWidget extends StatelessWidget {
  final String? hintText, label, errorText;
  final TextInputType type;
  final bool password;
  final bool expanded;
  final Color activeBorderColor, borderColor, backgroundColor;
  final bool floatingHint;
  final int? maxLines;
  final int? minLines;
  final void Function()? onTap;
  final TextAlign textalign;
  final int? maxLengh;
  final TextDirection? textdirection;
  final EdgeInsetsDirectional? contentPadding;
  final double borderRadius;
  final Widget? prefixIcon, suffixIcon, suffixWidget, prefixWidget;
  final TextEditingController? controller;
  final InputDecoration? inputDecoration;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String?>? onSaved;
  final String? Function(String?)? validator;

  const EditTextWidget(
      {this.onChanged,
      this.onSaved,
      this.validator,
      this.onTap,
      this.password = false,
      this.expanded = false,
      this.floatingHint = true,
      this.type = TextInputType.text,
      this.hintText = "",
      this.label,
      this.textalign = TextAlign.start,
      this.maxLengh,
      this.errorText,
      this.controller,
      this.activeBorderColor = borderMainColor,
      this.borderRadius = 8.0,
      this.borderColor = borderMainColor,
      this.backgroundColor = Colors.white,
      this.maxLines = 1,
      this.minLines = 1,
      this.prefixIcon,
      this.suffixIcon,
      this.suffixWidget,
      this.prefixWidget,
      this.inputDecoration,
      this.contentPadding,
      this.textdirection,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: maxLengh,
      controller: controller,
      maxLines: maxLines,
      minLines: minLines,
      autofocus: !floatingHint,
      expands: expanded,
      textAlign: textalign,
      textDirection: textdirection,
      decoration: inputDecoration ??
          InputDecoration(
              contentPadding: contentPadding,
              filled: true,
              fillColor: backgroundColor,
              prefixIcon: prefixIcon,
              suffix: suffixWidget,
              prefix: prefixWidget,
              suffixIcon: suffixIcon,
              errorText: errorText,
              label: TextWidget(title: label),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: yellow, width: 1.0),
                  borderRadius:
                      BorderRadius.all(Radius.circular(borderRadius))),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: borderColor, width: 1.0),
                  borderRadius:
                      BorderRadius.all(Radius.circular(borderRadius))),
              errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red, width: 1.0),
                  borderRadius:
                      BorderRadius.all(Radius.circular(borderRadius))),
              errorMaxLines: 3,
              labelStyle: const TextStyle(color: primaryColor),
              hintStyle: TextStyle(color: primaryColor, fontSize: 12.sp),
              hintText: hintText),
      keyboardType: type,
      obscureText: password,
      onChanged: onChanged,
      onSaved: onSaved,
      validator: validator,
    );
  }
}
