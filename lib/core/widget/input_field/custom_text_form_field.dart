
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../resources/colors_manager.dart';
import '../../resources/font_manager.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key, this.hintText, required this.controller, this.onSubmitted,
  });
  final String? hintText;
  final TextEditingController controller;
  final ValueChanged<String>? onSubmitted;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        textAlign: TextAlign.right,
        controller: controller,
        onFieldSubmitted: onSubmitted,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 14.w),
          hintText: hintText,
          hintStyle: TextStyle(
              color: ColorsManager.kGreyLight,
              fontFamily: FontName.geDinerOne,
              fontSize: 14.sp,
              fontWeight: FontWeight.bold),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
        ));
  }
}
