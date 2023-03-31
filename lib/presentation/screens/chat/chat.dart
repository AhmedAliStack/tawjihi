import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/utils.dart';
import '../../../core/values/colors.dart';
import '../../components/text_widget.dart';
import '../base/base_stateless.dart';

class Chat extends StatefulWidget {
  Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  List<String> chatList = [];
  TextEditingController msg = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseStateless(
      body: Column(
        children: [
          Container(
            height: 0.3.sw,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xffF8F8F8),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10.r),
                bottomRight: Radius.circular(10.r),
              ),
            ),
            child: Padding(
              padding:
                  EdgeInsetsDirectional.only(start: 16.w, top: 16.h, end: 16.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Utils.backWidget(context, authScreensBack: true),
                  SizedBox(width: 32.w),
                  Container(
                    padding: EdgeInsets.all(16.w),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(colors: gradientButton),
                    ),
                    child: Image.asset(
                      'assets/icons/message_active.png',
                      width: 24.w,
                      height: 24.w,
                      fit: BoxFit.fill,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const TextWidget(
                        title: "الدعم الفنى",
                        color: Colors.black,
                      ),
                      SizedBox(height: 8.h),
                      TextWidget(
                        title: "محمد الزيات",
                        fontSize: 12.sp,
                        color: secondaryColor.withOpacity(0.5),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 8.h),
                itemBuilder: (context, index) => Row(children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(16.w),
                          decoration: BoxDecoration(
                            color: containerColor,
                            borderRadius: BorderRadiusDirectional.only(
                              topEnd: Radius.circular(15.r),
                              bottomStart: Radius.circular(15.r),
                              bottomEnd: Radius.circular(15.r),
                            ),
                          ),
                          child: TextWidget(
                            title: chatList[index],
                            fontWeight: FontWeight.w500,
                            color: secondaryColor,
                            maxLines: null,
                          ),
                        ),
                      ),
                      SizedBox(width: 16.w),
                      TextWidget(
                        title: "10:30 AM",
                        fontSize: 12.sp,
                        color: Color(0xff505050),
                      ),
                    ]),
                separatorBuilder: (context, index) => Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            padding: EdgeInsets.all(8.w),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(colors: gradientButton),
                            ),
                            child: Image.asset(
                              'assets/icons/message_active.png',
                              width: 24.w,
                              height: 24.w,
                              fit: BoxFit.fill,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                itemCount: chatList.length),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16.w),
            color: containerColor,
            child: Row(children: [
              Expanded(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(34.r)),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(start: 16.w, end: 8.w),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/icons/chat_asset_upload.png',
                          width: 17.w,
                          height: 17.w,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: TextFormField(
                            controller: msg,
                            // onChanged: (value) {
                            //   msg = value;
                            // },
                            decoration: new InputDecoration(
                                hintText: 'الرساله', border: InputBorder.none),
                            // onChanged: onSearchTextChanged,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(colors: gradientButton),
                  ),
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          if (msg.text.isNotEmpty) {
                            chatList.add(msg.text);
                            msg.text = "";
                          }
                        });
                      },
                      icon: Icon(
                        Icons.send,
                        color: Colors.white,
                      ))),
            ]),
          )
        ],
      ),
    );
  }
}
