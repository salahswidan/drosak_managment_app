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
            height: 39.h,
            decoration: BoxDecoration(
              color: Colors.green,
            )),
        body: CustomPageViewOnBoardingScreen());
  }
}
