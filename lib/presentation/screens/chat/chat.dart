// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:tawjihi_quiz/domain/models/chat_model.dart';

import 'package:tawjihi_quiz/presentation/components/loadinganderror.dart';
import 'package:tawjihi_quiz/presentation/screens/chat/cubit/chat_cubit.dart';

import '../../../core/utils/utils.dart';
import '../../../core/values/colors.dart';
import '../../components/text_widget.dart';
import '../base/base_stateless.dart';

class Chat extends StatefulWidget {
  final int teacherId;
  final int chatId;
  final String name;
  final String image;
  const Chat({
    Key? key,
    required this.chatId,
    required this.name,
    required this.image,
    required this.teacherId,
  }) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  TextEditingController msg = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseStateless(
      body: Column(
        children: [
          Container(
            height: 0.25.sw,
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
                  Image.network(
                    widget.image,
                    width: 50.w,
                    height: 50.w,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => Image.asset(
                      'assets/images/teacher.png',
                      width: 50.w,
                      height: 50.w,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  TextWidget(
                    title: widget.name,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: BlocProvider(
              create: (context) => ChatCubit()..getChat(chatId: widget.chatId),
              child: BlocConsumer<ChatCubit, ChatState>(
                listener: (context, state) {},
                builder: (context, state) {
                  ChatCubit cubit = ChatCubit.get(context);
                  return LoadingAndError(
                    isLoading: state is LoadingChatState,
                    isError: state is ErrorChatState,
                    errorMessage: state is ErrorChatState ? state.error : null,
                    function: () => cubit.getChat(chatId: widget.chatId),
                    child: Column(
                      children: [
                        Expanded(
                          child: GroupedListView<Data, DateTime>(
                              reverse: true,
                              order: GroupedListOrder.DESC,
                              useStickyGroupSeparators: false,
                              padding: EdgeInsets.all(8.w),
                              elements: cubit.chatList,
                              groupBy: (message) => DateTime(
                                    DateTime.parse(
                                            message.createdAt!.substring(0, 16))
                                        .year,
                                    DateTime.parse(
                                            message.createdAt!.substring(0, 16))
                                        .month,
                                    DateTime.parse(
                                            message.createdAt!.substring(0, 16))
                                        .day,
                                  ),
                              groupHeaderBuilder: (message) => SizedBox(
                                    height: 40.h,
                                    child: Center(
                                      child: Card(
                                        color: Colors.blue,
                                        child: Padding(
                                          padding: EdgeInsets.all(8.0.w),
                                          child: TextWidget(
                                            title: DateFormat.yMMMd().format(
                                                DateTime.parse(message
                                                    .createdAt!
                                                    .substring(0, 16))),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                              itemBuilder: (context, message) {
                                String dateTimeString = message.createdAt ?? "";
                                //2023-07-11 05:37:th
                                DateTime dateTime = DateTime.parse(
                                    dateTimeString.substring(0, 16));
                                String timeString =
                                    DateFormat('hh:mm a').format(dateTime);
                                return message.sender == 0
                                    ? Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 4.0.w),
                                        child: Row(children: [
                                          Expanded(
                                            child: Container(
                                              padding: EdgeInsets.all(16.w),
                                              decoration: BoxDecoration(
                                                color: containerColor,
                                                borderRadius:
                                                    BorderRadiusDirectional
                                                        .only(
                                                  topEnd: Radius.circular(15.r),
                                                  bottomStart:
                                                      Radius.circular(15.r),
                                                  bottomEnd:
                                                      Radius.circular(15.r),
                                                ),
                                              ),
                                              child: TextWidget(
                                                title: message.message,
                                                fontWeight: FontWeight.w500,
                                                color: secondaryColor,
                                                maxLines: null,
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 16.w),
                                          TextWidget(
                                            title: timeString,
                                            fontSize: 12.sp,
                                            color: Color(0xff505050),
                                          ),
                                        ]),
                                      )
                                    : Row(children: [
                                        TextWidget(
                                          title: timeString,
                                          fontSize: 12.sp,
                                          color: Color(0xff505050),
                                        ),
                                        SizedBox(width: 16.w),
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.all(16.w),
                                            decoration: BoxDecoration(
                                              gradient: const LinearGradient(
                                                  colors: gradientButton),
                                              borderRadius:
                                                  BorderRadiusDirectional.only(
                                                topStart: Radius.circular(15.r),
                                                bottomStart:
                                                    Radius.circular(15.r),
                                                bottomEnd:
                                                    Radius.circular(15.r),
                                              ),
                                            ),
                                            child: TextWidget(
                                              title: message.message,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                              maxLines: null,
                                            ),
                                          ),
                                        ),
                                      ]);
                              }),
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(16.w),
                          color: containerColor,
                          child: Row(children: [
                            Expanded(
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(34.r)),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.only(
                                      start: 16.w, end: 8.w),
                                  child: Row(
                                    children: [
                                      // Image.asset(
                                      //   'assets/icons/chat_asset_upload.png',
                                      //   width: 17.w,
                                      //   height: 17.w,
                                      //   fit: BoxFit.fill,
                                      // ),
                                      // SizedBox(width: 8.w),
                                      Expanded(
                                        child: TextFormField(
                                          controller: msg,
                                          // onChanged: (value) {
                                          //   msg = value;
                                          // },
                                          decoration: new InputDecoration(
                                              hintText: 'الرساله',
                                              border: InputBorder.none),
                                          // onChanged: onSearchTextChanged,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            state is LoadingButton
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : Container(
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: LinearGradient(
                                          colors: gradientButton),
                                    ),
                                    child: IconButton(
                                        onPressed: () {
                                          ChatCubit cubit =
                                              ChatCubit.get(context);

                                          final massage = Data(
                                            sender: 0,
                                            message: msg.text,
                                            createdAt:
                                                DateTime.now().toString(),
                                          );
                                          cubit.chatList.add(massage);
                                          cubit.sendMsg(
                                              senderId: widget.teacherId,
                                              msg: msg.text);
                                          msg.text = "";
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
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
