import 'package:drosak_managment_app/core/resources/assets_values_manager.dart';
import 'package:drosak_managment_app/core/resources/colors_manager.dart';
import 'package:drosak_managment_app/core/resources/const_value.dart';
import 'package:drosak_managment_app/core/resources/font_manager.dart';
import 'package:drosak_managment_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widget/custom_app_bar_education_stage.dart';

class CustomItemStage extends StatelessWidget {
  const CustomItemStage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
            right: 2.h,
            top: -20.h,
            // left: -10.h,
            child: CircleAvatar(
              child: Text(
                "1",
                style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              backgroundColor: ColorsManager.kPrimaryColor,
            )),
        Container(
            child: Padding(
              padding: EdgeInsets.only(
                  right: 22.w, top: 6.h, bottom: 6.h, left: 10.w),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "الصف الاول الاعدادي",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16.sp,
                                fontFamily: FontName.geDinerOne,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 3.w,
                                ),
                                Expanded(
                                  child: Text(
                                    "تلك الصف هو الصف الاعدادي وفي ثلاث طلاب مثلاتلك الصف هو الصف الاعدادي وفي ثلاث طلاب مثلاتلك الصف هو الصف الاعدادي وفي ثلاث طلاب مثلا",
                                    style: TextStyle(
                                        fontSize: 10.sp,
                                        fontFamily: FontName.geDinerOne,
                                        color: Colors.white
                                            .withOpacity(0.6)),
                                  ),
                                ),
                              ],
                            ),
                          ]),
                    ),
                    SizedBox(
                      width: 7.w,
                    ),
                    ClipRRect(
                      child: Image.asset(
                        AssetsValuesManager.kTestImage,
                        width: 64.w,
                        height: 64.h,
                      ),
                    ),
                  ]),
            ),
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(
                  color: ColorsManager.kPrimaryColor,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                      color: ColorsManager.kPrimaryColor,
                      blurRadius: 5,
                      blurStyle: BlurStyle.outer,
                      spreadRadius: 1,
                      offset: Offset(0, 0))
                ]),
            margin: EdgeInsets.symmetric(horizontal: 16.w)),
      ],
    );
  }
}
