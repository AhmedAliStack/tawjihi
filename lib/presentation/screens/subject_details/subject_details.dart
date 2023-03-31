import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/utils.dart';
import '../../../core/values/colors.dart';
import '../../components/text_widget.dart';
import '../teacher_tests/teacher_tests.dart';
import '../teacher_info/teacher_info.dart';
import '../teachers/widgets/item_of_teachers.dart';

class SubjectDetails extends StatelessWidget {
  const SubjectDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: containerColor,
      body: Stack(children: [
        Container(
          height: 0.25.sh,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10.r),
                bottomRight: Radius.circular(10.r),
              ),
              gradient: LinearGradient(colors: gradientButton)),
          child: Padding(
            padding: EdgeInsetsDirectional.only(start: 16.w, top: 16.h),
            child: Row(
              children: [
                Utils.backWidget(context),
                SizedBox(
                  width: 32.w,
                ),
                TextWidget(
                  title: "الرياضيات",
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                )
              ],
            ),
          ),
        ),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 8.h, left: 16.w, right: 16.w),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.r)),
                margin: EdgeInsets.only(top: 0.20.sh),
                child: ListTile(
                  leading: Container(
                    padding: EdgeInsets.all(8.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13.r),
                      color: borderMainColor,
                    ),
                    child: Image.asset(
                      'assets/icons/fillter.png',
                      width: 24.w,
                      height: 24.w,
                      fit: BoxFit.contain,
                    ),
                  ),
                  title: TextFormField(
                    decoration: new InputDecoration(
                        hintText: 'اكتب بحثك هنا', border: InputBorder.none),
                    // onChanged: onSearchTextChanged,
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Color(0xffD4D4D4),
                      size: 30.w,
                    ),
                    onPressed: () {
                      // onSearchTextChanged('');
                      // controller.clear();
                    },
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.all(16.w),
                separatorBuilder: (context, index) => SizedBox(height: 16.w),
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () =>
                          Utils.openScreen(context, const TeacherTests()),
                      child: ItemOfTeachers(
                        card: Colors.white,
                      ));
                },
                itemCount: 10,
              ),
            ),
          ],
        )
      ]),
    );
  }
}
