import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tawjihi_quiz/presentation/screens/converstions/cubit/converstions_cubit.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/values/colors.dart';
import '../../../components/text_widget.dart';
import '../../chat/chat.dart';

class ItemOfConverstions extends StatelessWidget {
  final ConverstionsCubit cubit;
  final int index;
  const ItemOfConverstions({
    super.key,
    required this.cubit,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final data = cubit.converstionsModel!.data![index];
    String dateTimeString = data.lastMessage?.createdAt ?? "";
    //2023-07-11 05:37:th
    DateTime dateTime = DateTime.parse(dateTimeString.substring(0, 16));
    String timeString = DateFormat('hh:mm a').format(dateTime);
    return GestureDetector(
      onTap: () => Utils.openScreen(
        context,
        Chat(
          teacherId: data.teacher?.id ?? 0,
          chatId: data.id ?? 0,
          image: data.teacher?.image ?? "",
          name: data.teacher?.name ?? "",
        ),
      ),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Row(
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Image.network(
                data.teacher?.image ?? "",
                width: 60.w,
                height: 60.w,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => Image.asset(
                  'assets/images/teacher.png',
                  width: 60.w,
                  height: 60.w,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextWidget(
                            title: data.teacher?.name,
                          ),
                        ),
                        SizedBox(
                          width: 16.w,
                        ),
                        TextWidget(
                          title: timeString,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w300,
                          color: const Color(0xff1F1F1F),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextWidget(
                            title: data.lastMessage?.message,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w300,
                            color: const Color(0xff848484),
                            maxLines: 1,
                          ),
                        ),
                        SizedBox(width: 16.w),
                        data.lastMessage?.isRead == 1
                            ? const SizedBox()
                            : Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: yellow.withOpacity(0.25),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(12.0.w),
                                  child: TextWidget(
                                    title: "1",
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                      ],
                    )
                  ]),
            )
          ],
        ),
      ]),
    );
  }
}
