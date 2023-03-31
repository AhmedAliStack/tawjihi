import 'package:flutter/material.dart';

class BaseStateless extends StatelessWidget {
  final Widget body;
  final Widget? bottomNavBar;
  final Widget? floatingButton;
  final Color? backgroundColor;
  final AppBar? appBar;
  final bool? extendBody;
  final bool? resizeToAvoidBottomInset;

  const BaseStateless(
      {Key? key,
      required this.body,
      this.appBar,
      this.bottomNavBar,
      this.floatingButton,
      this.extendBody,
      this.resizeToAvoidBottomInset,
      this.backgroundColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: resizeToAvoidBottomInset ?? true,
      appBar: appBar,
      extendBody: extendBody ?? false,
      floatingActionButton: floatingButton,
      body: SafeArea(child: body),
      backgroundColor: backgroundColor,
      bottomNavigationBar: bottomNavBar,
    );
  }
}
