import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tawjihi_quiz/core/values/colors.dart';

// enum SnakState { success, failed }

class OverLays {
  // static Future dialog(BuildContext context,
  //     {required Widget child,
  //     RouteSettings? routeSettings,
  //     EdgeInsets? insetPadding,
  //     AlignmentGeometry? alignment,
  //     Color? backgroundColor}) {
  //   return showDialog(
  //       context: context,
  //       routeSettings: routeSettings,
  //       builder: (context) => Dialog(
  //             backgroundColor: backgroundColor,
  //             insetPadding: insetPadding,
  //             alignment: alignment,
  //             child: child,
  //           ));
  // }
  static toast({required String text, bool error = false}) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 3,
        backgroundColor: primaryColor,
        textColor: error ? Colors.red : Colors.white,
        fontSize: 16.0);
  }
}
