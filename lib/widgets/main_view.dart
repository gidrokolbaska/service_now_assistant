import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_now_assistant/controllers/responsive_controller.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final ResponsiveController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => PageTransitionSwitcher(
        duration: Duration(milliseconds: 600),
        transitionBuilder: (Widget child, Animation<double> primaryAnimation,
            Animation<double> secondaryAnimation) {
          return FadeThroughTransition(
            fillColor: const Color(0xff000000),
            animation: primaryAnimation,
            secondaryAnimation: secondaryAnimation,
            child: child,
          );
        },
        child: controller.pageList[controller.selectedPageIndex.value],
      ),
    );
  }
}
