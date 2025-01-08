import 'package:drosak_managment_app/core/resources/assets_values_manager.dart';
import 'package:drosak_managment_app/core/resources/colors_manager.dart';
import 'package:drosak_managment_app/core/resources/const_value.dart';
import 'package:drosak_managment_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widget/custom_item_on_boarding_screen.dart';
import '../widget/custom_page_view_on_boarding_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          height: 39.h,
          color: ColorsManager.kPrimaryColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                ConstValue.kSkip,
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "ge_diner_one",
                    fontWeight: FontWeight.w500,
                    fontSize: 15.sp),
              ),
              Text(
                ConstValue.kNext,
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "ge_diner_one",
                    fontWeight: FontWeight.w500,
                    fontSize: 15.sp),
              ),
            ],
          ),
        ),
        body: CustomPageViewOnBoardingScreen());
  }
}
