import 'package:dots_indicator/dots_indicator.dart';
import 'package:drosak_managment_app/controller/on_boaring/on_boarding_controller.dart';
import 'package:drosak_managment_app/core/resources/assets_values_manager.dart';
import 'package:drosak_managment_app/core/resources/colors_manager.dart';
import 'package:drosak_managment_app/core/resources/const_value.dart';
import 'package:drosak_managment_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widget/custom_bottom_nav_bar_on_boarding.dart';
import '../widget/custom_item_on_boarding_screen.dart';
import '../widget/custom_page_view_on_boarding_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late OnBoardingController _controller;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _controller = OnBoardingController(pageController: _pageController);
  }

  @override
  void dispose() {
    _pageController.dispose();
    _controller.disposeController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CustomBottomNavBarOnboardingScreen(
          outputDotIndicator: _controller.outputDotIndicator,
          onPressedNext: () {
            _controller.goNext();
          },
          onPressedSkip: () {
            _controller.skip(context);
          },
          dotsCount: ConstListValues.listOnBoardingModel.length,
        ),
        body: CustomPageViewOnBoardingScreen(
          controller: _pageController,
        ));
  }
}
