import 'dart:io';
import 'package:drosak_managment_app/core/resources/colors_manager.dart';
import 'package:drosak_managment_app/core/resources/const_value.dart';
import 'package:drosak_managment_app/core/resources/font_manager.dart';
import 'package:drosak_managment_app/model/student/student_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/resources/assets_values_manager.dart';

class CustomItemAudience extends StatelessWidget {
  const CustomItemAudience({
    super.key,
    required this.deleteFun,
    required this.editFun,
    required this.studentModel,
  });
  final StudentModel studentModel;
  final void Function(StudentModel itemStageModel) deleteFun;
  final void Function(StudentModel itemStageModel) editFun;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {},
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
              right: 2.h,
              top: -20.h,
              child: CircleAvatar(
                backgroundColor: ColorsManager.kPrimaryColor,
                child: Text(
                  studentModel.id.toString(),
                  //  itemStageModel.id.toString(),
                  style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              )),
          Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: ColorsManager.kPrimaryColor,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: const [
                    BoxShadow(
                        color: ColorsManager.kPrimaryColor,
                        blurRadius: 5,
                        blurStyle: BlurStyle.outer,
                        spreadRadius: 1,
                        offset: Offset(0, 0))
                  ]),
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              child: Padding(
                padding: EdgeInsets.only(
                    right: 22.w, top: 16.h, bottom: 6.h, left: 10.w),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.file(
                          errorBuilder: (context, error, stackTrace) =>
                              SvgPicture.asset(
                            AssetsValuesManager.kPlaceholderSvg,
                            width: 50.w,
                            height: 50.h,
                          ),
                          File(studentModel.image),
                          width: 64.w,
                          height: 64.h,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        studentModel.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                          fontFamily: FontName.geDinerOne,
                          color: Colors.white,
                        ),
                      ),
                    ]),
              )),
        ],
      ),
    );
  }
}
