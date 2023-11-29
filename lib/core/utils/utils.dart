import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tawjihi_quiz/core/utils/statics.dart';
import 'package:tawjihi_quiz/core/values/colors.dart';
import 'package:tawjihi_quiz/data/local/local_hive.dart';
import 'package:tawjihi_quiz/domain/models/all_lists_model.dart';
import 'package:tawjihi_quiz/domain/models/user_model.dart';
import 'package:tawjihi_quiz/services_locator.dart';
import '../../presentation/components/text_widget.dart';

class Utils {
  static String token = '';
  static UserModel userModel = UserModel();

  static List<Countries> countries = [];
  static List<Manhags> manhags = [];
  static List<Terms> terms = [];
  static List<Types> subjectType = [];

  static void openScreen(BuildContext? context, Widget screen,
      {bool replacment = false, bool remove = false}) {
    if (context == null) {
      return;
    }

    if (remove) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => screen),
        (route) => false,
      );
    } else if (replacment) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => screen));
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
    }
  }

  static Widget backWidget(BuildContext context,
      {VoidCallback? onBack, bool? authScreensBack}) {
    return GestureDetector(
        onTap: () {
          if (onBack != null) {
            return onBack.call();
          } else {
            Navigator.pop(context);
          }
        },
        child: authScreensBack != null
            ? Container(
                width: 40.w,
                height: 40.w,
                decoration: BoxDecoration(
                  color: borderMainColor,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(
                  Icons.arrow_back_outlined,
                  color: mauveColor,
                  size: 20.w,
                ),
              )
            : Image.asset(
                'assets/icons/main_back_icon.png',
                width: 40.w,
                height: 40.w,
                fit: BoxFit.contain,
              ));
  }

  static Future<dynamic> successDialog(
      {required BuildContext context, required String title, Widget? screen}) {
    return showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.white,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0.r)),
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 32.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                  alignment: AlignmentDirectional.topCenter,
                  child: GestureDetector(
                      onTap: () => screen != null
                          ? Utils.openScreen(context, screen)
                          : Navigator.pop(context),
                      child: Container(
                          padding: EdgeInsets.all(12.0.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0.r),
                              color: borderMainColor),
                          child: const Icon(
                            Icons.clear,
                            color: mauveColor,
                          )))),
              SizedBox(height: 16.h),
              Image.asset(
                "assets/images/reset_pass.png",
                width: 175.w,
                height: 160.w,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 32.h),
              TextWidget(
                title: title,
                fontSize: 24.sp,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Future<AllListsModel?> getAllListModel() async {
    try {
      final jsonAllList =
          await locator<DataManager>().getData(Statics.allLists);
      final lists = AllListsModel.fromJson(jsonAllList);
      countries = lists.data?.countries ?? [];
      manhags = lists.data?.manhags ?? [];
      terms = lists.data?.terms ?? [];
      subjectType = lists.data?.types ?? [];
      return lists;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  static Future<UserModel?> getUser() async {
    try {
      final jsonUser = await locator<DataManager>().getData(Statics.user);
      final user = UserModel.fromJson(jsonUser);
      userModel = user;
      token = user.token ?? '';
      return user;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  static Future<ImageSource?> showImageSource(BuildContext context) async {
    if (Platform.isIOS) {
      return showCupertinoModalPopup<ImageSource>(
          context: context,
          builder: (context) => CupertinoActionSheet(
                actions: [
                  CupertinoActionSheetAction(
                    child: const Text('Camera'),
                    onPressed: () =>
                        Navigator.of(context).pop(ImageSource.camera),
                  ), // CupertinoActionSheetAction
                  CupertinoActionSheetAction(
                    child: const Text('Gallery'),
                    onPressed: () =>
                        Navigator.of(context).pop(ImageSource.gallery),
                  ), // CupertinoActionSheetAction
                ],
              ));
    } else {
      return showModalBottomSheet(
          context: context,
          builder: (context) =>
              Column(mainAxisSize: MainAxisSize.min, children: [
                ListTile(
                  leading: const Icon(Icons.camera_alt),
                  title: const Text('Camera'),
                  onTap: () => Navigator.of(context).pop(ImageSource.camera),
                ), // ListTile
                ListTile(
                  leading: const Icon(Icons.image),
                  title: const Text('Gallery'),
                  onTap: () => Navigator.of(context).pop(ImageSource.gallery),
                ) // ListTile
              ]));
    }
  }
}
