import 'package:drosak_managment_app/core/resources/colors_manager.dart';
import 'package:drosak_managment_app/core/resources/font_manager.dart';
import 'package:drosak_managment_app/model/education_stage/item_stage_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomItemStage extends StatelessWidget {
  const CustomItemStage({
    super.key, required this.itemStageModel,
  });
  final ItemStageModel itemStageModel;
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
                itemStageModel.id.toString(),
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
                              itemStageModel.stageName,
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
                                    itemStageModel.desc,
                                    style: TextStyle(
                                        fontSize: 10.sp,
                                        fontFamily: FontName.geDinerOne,
                                        color: Colors.white.withOpacity(0.6)),
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
                        itemStageModel.image,
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
