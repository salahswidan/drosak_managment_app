import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resources/colors_manager.dart';
import '../../../core/resources/const_value.dart';

class CustomBottomNavBarOnboardingScreen extends StatelessWidget {
  const CustomBottomNavBarOnboardingScreen({
    super.key,
    required this.dotsCount,
    this.onPressedNext,
    required this.outputDotIndicator, this.onPressedSkip,
  });
  final int dotsCount;
  final VoidCallback? onPressedNext;
  final VoidCallback? onPressedSkip;
  final Stream<int> outputDotIndicator;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      height: 39.h,
      color: ColorsManager.kPrimaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: onPressedSkip,
            child: CustomText(
              text: ConstValue.kSkip,
            ),
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: StreamBuilder<int>(
              stream: outputDotIndicator,
              builder: (context, snapshot) => DotsIndicator(
                dotsCount: dotsCount,
                position: snapshot.data == null ? 0 : snapshot.data!,
                decorator: DotsDecorator(
                    activeColor: Colors.white,
                    color: Colors.white.withOpacity(0.3)),
              ),
            ),
          ),
          InkWell(
            onTap: onPressedNext,
            child: CustomText(
              text: ConstValue.kNext,
            ),
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
