
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../resources/colors_manager.dart';
import '../../resources/const_value.dart';
import '../../resources/font_manager.dart';

class CustomMaterialButton extends StatelessWidget {
  const CustomMaterialButton({
    super.key, required this.onPressed, required this.text,
  });
  final VoidCallback onPressed;
  final String text ;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r)),
      padding:
          EdgeInsets.symmetric(vertical: 10.h, horizontal: 40.w),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
            color: Colors.white,
            fontFamily: FontName.geDinerOne,
            fontSize: 16.sp,
            fontWeight: FontWeight.bold),
      ),
      color: ColorsManager.kPrimaryColor,
    );
  }
}
