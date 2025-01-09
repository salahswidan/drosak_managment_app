
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resources/colors_manager.dart';

class CustomShadowConainerExploreScreen extends StatelessWidget {
  const CustomShadowConainerExploreScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: -16.h,
      left: -16.h,
      child: Container(
        width: 32.w,
        height: 32.h,
        decoration: BoxDecoration(
            color: ColorsManager.kBlackColor,
            borderRadius: BorderRadius.all(Radius.circular(13)),
            boxShadow: [
              BoxShadow(
                  color: ColorsManager.kBlackColor,
                  blurRadius: 15,
                  blurStyle: BlurStyle.outer,
                  spreadRadius: 1,
                  offset: Offset(0, 0))
            ]),
      ),
    );
  }
}
