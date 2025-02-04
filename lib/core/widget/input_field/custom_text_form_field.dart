import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../resources/colors_manager.dart';
import '../../resources/font_manager.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      this.hintText,
      this.validator,
      required this.controller,
      this.onSubmitted,
      this.maxLines = 1});
  final String? hintText;
  final TextEditingController controller;
  final ValueChanged<String>? onSubmitted;
  final int? maxLines;
  final FormFieldValidator<String>? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        textAlign: TextAlign.right,
        controller: controller,
        validator: validator,
        onFieldSubmitted: onSubmitted,
        maxLines: maxLines,
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
