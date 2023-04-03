import 'package:easy_localization/easy_localization.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:tawjihi_quiz/presentation/components/text_widget.dart';
import 'my_loading.dart';

class LoadingAndError extends StatelessWidget {
  const LoadingAndError({
    Key? key,
    this.childError,
    this.childLoading,
    required this.isError,
    required this.isLoading,
    this.function,
    required this.child,
  }) : super(key: key);
  final bool isError;
  final bool isLoading;
  final Widget child;
  final Widget? childError;
  final Widget? childLoading;
  final Function? function;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      if (isError) {
        return SizedBox(
          height: double.infinity,
          child: RefreshIndicator(
            onRefresh: () async {
              function == null ? null : function!();
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: childError ??
                  Material(
                    color: Colors.transparent,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Lottie.asset(
                            "assets/json/error.json",
                            width: 150,
                            height: 150,
                          ),
                          TextWidget(
                            title: 'NoInternetConnection',
                            fontSize: 18,
                            color: Colors.black,
                          ),
                          if (Navigator.canPop(context))
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: TextWidget(
                                  title: "back",
                                  color: Colors.white,
                                ))
                        ],
                      ),
                    ),
                  ),
            ),
          ),
        );
      } else if (isLoading) {
        return childLoading ?? MyLoading.loadingWidget();
      } else {
        return child;
      }
    });
  }
}
