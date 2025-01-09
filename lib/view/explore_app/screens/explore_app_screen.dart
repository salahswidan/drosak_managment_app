import 'package:drosak_managment_app/core/resources/assets_values_manager.dart';
import 'package:drosak_managment_app/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/resources/font_manager.dart';
import '../widget/body_explore_screen.dart';
import '../widget/custom_app_bar_explore_screen.dart';

class ExploreAppScreen extends StatelessWidget {
  const ExploreAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: ColorsManager.kBlackColor,
        appBar: CustomAppBarExploreScreen(),
        body: BodyExploreScreen(),
      ),
    );
  }
}
