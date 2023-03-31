import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tawjihi_quiz/presentation/components/text_widget.dart';
import '../../core/values/colors.dart';

class DropdownWidget extends StatelessWidget {
  final List<dynamic>? items;
  final List<DropdownMenuItem<dynamic>>? customeItems;
  final dynamic selectedItem;
  final Widget? customSelectedItem;
  final Function(dynamic)? onItemSelected;
  final TextStyle? dropdownMenuTextStyle;
  final TextStyle? dropdownButtonTextStyle;
  final double? buttonBorderRaduis;
  final bool buttonElevation;
  final double buttonHeight;
  final double buttonWidth;
  final String buttonTexthint;
  final Color? buttonTexthintColor;
  final double? buttonTexthintFontSize;
  final FontWeight? buttonTexthintFontWeight;
  final Color? iconEnabledColor;
  final EdgeInsetsGeometry? buttonPadding;
  final TextEditingController? textEditingController;
  final bool enableSearch;

  const DropdownWidget({
    Key? key,
    required this.buttonTexthint,
    this.items,
    this.customeItems,
    this.customSelectedItem,
    this.selectedItem,
    this.onItemSelected,
    this.dropdownButtonTextStyle,
    this.dropdownMenuTextStyle,
    this.buttonBorderRaduis,
    this.buttonElevation = true,
    this.buttonHeight = 50,
    this.buttonWidth = 160,
    this.textEditingController,
    this.enableSearch = false,
    this.buttonTexthintColor,
    this.buttonTexthintFontSize,
    this.buttonTexthintFontWeight,
    this.buttonPadding,
    this.iconEnabledColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        isExpanded: true,
        hint: customSelectedItem ??
            Row(
              children: [
                Expanded(
                  child: Text(
                    //selectedItem ?? "Select_Service".tr(),
                    selectedItem ?? buttonTexthint,
                    style: dropdownButtonTextStyle ??
                        TextStyle(
                            fontSize: buttonTexthintFontSize ?? 14.sp,
                            color: buttonTexthintColor ?? Colors.grey,
                            fontWeight:
                                buttonTexthintFontWeight ?? FontWeight.w400),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
        items: customeItems ??
            items
                ?.map((item) => DropdownMenuItem<dynamic>(
                      value: item,
                      child: customSelectedItem != null
                          ? Row(mainAxisSize: MainAxisSize.min, children: [
                              SizedBox(width: 8.w),
                              Icon(
                                Icons.flag_outlined,
                                color: borderMainColor,
                                size: 30.w,
                              ),
                              SizedBox(width: 4.w),
                              Container(
                                height: 8.h,
                                width: 2.w,
                                color: borderMainColor,
                              ),
                              SizedBox(width: 8.w),
                              TextWidget(
                                title: item,
                              )
                            ])
                          : Text(
                              item,
                              style: dropdownMenuTextStyle ??
                                  const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: primaryColor,
                                  ),
                              overflow: TextOverflow.ellipsis,
                            ),
                    ))
                .toList(),
        value: selectedItem,
        onChanged: onItemSelected,
        icon: Icon(
          Icons.keyboard_arrow_down,
          color: iconEnabledColor ?? mauveColor,
        ),
        iconSize: 24.w,
        iconEnabledColor: primaryColor,
        iconDisabledColor: Colors.grey,
        buttonHeight: buttonHeight,
        buttonWidth: buttonWidth,
        buttonPadding: buttonPadding ??
            const EdgeInsetsDirectional.only(start: 14, end: 14),
        buttonDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: borderMainColor),
          color: Colors.white,
        ),
        buttonElevation: buttonElevation ? 1 : 0,
        itemHeight: 40,
        itemPadding: const EdgeInsets.only(left: 16, right: 16),
        dropdownMaxHeight: 200,
        dropdownWidth: 0.9.sw,
        dropdownPadding: null,
        dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(buttonBorderRaduis ?? 8.r),
          color: Colors.white,
        ),
        dropdownElevation: 1,
        scrollbarRadius: const Radius.circular(40),
        scrollbarThickness: 6,
        scrollbarAlwaysShow: true,
        offset: const Offset(0, 0),
        searchController: textEditingController,
        searchInnerWidgetHeight: 50,
        searchInnerWidget: enableSearch
            ? Padding(
                padding: const EdgeInsets.only(
                  top: 8,
                  bottom: 4,
                  right: 8,
                  left: 8,
                ),
                child: TextFormField(
                  controller: textEditingController,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 8,
                    ),
                    hintText: 'بحث',
                    hintStyle: const TextStyle(fontSize: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              )
            : const SizedBox(),
        searchMatchFn: (item, searchValue) {
          return (item.value.toString().contains(searchValue));
        },
        //This to clear the search value when you close the menu
        onMenuStateChange: (isOpen) {
          if (!isOpen) {
            textEditingController?.clear();
          }
        },
      ),
    );
  }
}
