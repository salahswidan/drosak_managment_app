import 'package:dots_indicator/dots_indicator.dart';
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

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CustomBottomNavBarOnboardingScreen(
          dotsCount: ConstListValues.listOnBoardingModel.length,
          currentDot: 1,
        ),
        body: CustomPageViewOnBoardingScreen());
  }
}
