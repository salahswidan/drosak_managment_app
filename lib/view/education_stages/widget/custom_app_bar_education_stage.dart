

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resources/colors_manager.dart';
import '../../../core/resources/const_value.dart';
import '../../../core/resources/font_manager.dart';

class CustomAppBarEductionStages extends StatelessWidget {
  const CustomAppBarEductionStages({
    super.key, required this.onPressedAdd, required this.onPressedSearch,
  });
  final VoidCallback onPressedAdd;
  final VoidCallback onPressedSearch;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.bottomCenter,
      height: 75.h,
      width: double.infinity,
      color: ColorsManager.kPrimaryColor,
      padding: EdgeInsets.only(right: 15.w, left: 15.w, top: 24.h),
      child: Row(
        children: [
          Text(
            ConstValue.kEducationalStages,
            style: TextStyle(
                color: Colors.white,
                fontSize: 15.sp,
                fontFamily: FontName.geDinerOne,
                fontWeight: FontWeight.bold),
          ),
          Spacer(),
          IconButton(
            icon: const Icon(
              Icons.add_circle_outline,
              size: 30,
              color: Colors.white,
            ),
            onPressed:onPressedAdd,
          ),
          IconButton(
            icon: const Icon(
              Icons.search,
              size: 30,
              color: Colors.white,
            ),
            onPressed: onPressedSearch,
          ),
        ],
      ),
    );
  }
}
