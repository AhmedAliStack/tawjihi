// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/values/colors.dart';
import '../../../components/dropdown_widget.dart';
import '../../../components/text_widget.dart';

class CustomDropDown extends StatelessWidget {
  CustomDropDown(
      {Key? key,
      required this.title,
      required this.dropdownItems,
      required this.dropdownValue,
      required this.onItemSelected,
      this.validator,
      required this.icon})
      : super(key: key);
  final String title;
  final List<String> dropdownItems;
  final String? dropdownValue;
  final Function(dynamic)? onItemSelected;
  final String? Function(dynamic)? validator;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: DropdownWidget(
        buttonPadding: EdgeInsetsDirectional.only(end: 16.w),
        customSelectedItem: Row(mainAxisSize: MainAxisSize.min, children: [
          SizedBox(width: 8.w),
          Icon(
            icon,
            color: borderMainColor,
            size: 24.w,
          ),
          SizedBox(width: 8.w),
          Container(
            height: 8.h,
            width: 2.w,
            color: borderMainColor,
          ),
          SizedBox(width: 8.w),
          TextWidget(
            title: title,
          )
        ]),
        buttonTexthint: title,
        items: dropdownItems,
        selectedItem: dropdownValue,
        buttonBorderRaduis: 16.r,
        onItemSelected: onItemSelected,
        validator: validator,
        buttonElevation: false,
        icon: icon,
      ),
    );
  }
}
