import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resources/colors_manager.dart';
import '../../../core/resources/const_value.dart';

class CustomBottomNavBarOnboardingScreen extends StatelessWidget {
  const CustomBottomNavBarOnboardingScreen({
    super.key,
    required this.dotsCount,
    required this.currentDot,
  });
  final int dotsCount;
  final int currentDot;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      height: 39.h,
      color: ColorsManager.kPrimaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: ConstValue.kSkip,
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: DotsIndicator(
              dotsCount: dotsCount,
              position: currentDot,
              decorator: DotsDecorator(
                  activeColor: Colors.white,
                  color: Colors.white.withOpacity(0.3)),
            ),
          ),
          CustomText(
            text: ConstValue.kNext,
          ),
        ],
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: Colors.white,
          fontFamily: "ge_diner_one",
          fontWeight: FontWeight.w500,
          fontSize: 15.sp),
    );
  }
}
