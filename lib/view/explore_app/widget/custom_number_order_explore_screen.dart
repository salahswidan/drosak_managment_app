
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resources/colors_manager.dart';
import '../../../core/resources/font_manager.dart';

class CustomNumberOrderExploreScreen extends StatelessWidget {
  const CustomNumberOrderExploreScreen({
    super.key, required this.number,
  });
    final int number;


  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: -10.h,
        left: -10.h,
        child: CircleAvatar(
          child: Text(
            number.toString(),
            style: TextStyle(
                fontFamily: FontName.geDinerOne,
                color: Colors.white,
                fontWeight: FontWeight.w500),
          ),
          radius: 10.r,
          backgroundColor: ColorsManager.kPrimaryColor,
        ));
  }
}
