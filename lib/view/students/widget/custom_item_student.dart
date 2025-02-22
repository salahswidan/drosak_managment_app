import 'dart:io';
import 'package:drosak_managment_app/core/resources/colors_manager.dart';
import 'package:drosak_managment_app/core/resources/const_value.dart';
import 'package:drosak_managment_app/core/resources/font_manager.dart';
import 'package:drosak_managment_app/model/student/student_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/resources/assets_values_manager.dart';

class CustomItemStudent extends StatelessWidget {
  const CustomItemStudent({
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
    return Stack(
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
                  right: 22.w, top: 6.h, bottom: 6.h, left: 10.w),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Row(
                                children: [
                                  CustomEditAndDeletePopMenuButton(
                                      deleteFun: deleteFun,
                                      studentModel: studentModel,
                                      editFun: editFun),
                                  Expanded(
                                    child: Text(
                                      studentModel.name,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16.sp,
                                        fontFamily: FontName.geDinerOne,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 6.w,
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Image.file(
                                      errorBuilder:
                                          (context, error, stackTrace) =>
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
                                ],
                              ),
                            ),
                            RichText(
                                text: TextSpan(
                              children: [
                                TextSpan(
                                  text: studentModel.educationStageName,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13.sp,
                                    fontFamily: FontName.geDinerOne,
                                    color: Colors.white,
                                  ),
                                ),
                                TextSpan(
                                  text: ' / ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.sp,
                                    fontFamily: FontName.geDinerOne,
                                    color: Colors.red,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                                TextSpan(
                                  text: studentModel.groupName,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13.sp,
                                    fontFamily: FontName.geDinerOne,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            )),
                            SizedBox(
                              height: 12.h,
                            ),
                            Table(
                              border: TableBorder.all(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(14.r)),
                                color: Colors.white,
                              ),
                              children: [
                                const TableRow(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 4, vertical: 4),
                                      child: Center(
                                        child: Text(
                                          ConstValue.kDay,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 4, vertical: 4),
                                      child: Center(
                                        child: Text(
                                          ConstValue.kTime,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 4, vertical: 4),
                                      child: Center(
                                        child: Text(
                                          ConstValue.kMS,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ],
                                  decoration: BoxDecoration(
                                      color: ColorsManager.kPrimaryColor,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(14),
                                        topRight: Radius.circular(14),
                                      )),
                                ),
                                for (int i = 0;
                                    i <
                                        studentModel
                                            .listAppointmentModel!.length;
                                    i++)
                                  TableRow(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4, vertical: 10),
                                        child: Center(
                                          child: Text(
                                            studentModel
                                                .listAppointmentModel![i].day,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontFamily:
                                                    FontName.geDinerOne),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4, vertical: 10),
                                        child: Center(
                                          child: Text(
                                            studentModel
                                                .listAppointmentModel![i].time,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontFamily:
                                                    FontName.geDinerOne),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4, vertical: 10),
                                        child: Center(
                                          child: Text(
                                            studentModel
                                                .listAppointmentModel![i].ms,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontFamily:
                                                    FontName.geDinerOne),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                              ],
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
                                    studentModel.note,
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
                  ]),
            )),
      ],
    );
  }
}

class CustomEditAndDeletePopMenuButton extends StatelessWidget {
  const CustomEditAndDeletePopMenuButton({
    super.key,
    required this.deleteFun,
    required this.studentModel,
    required this.editFun,
  });

  final void Function(StudentModel itemStageModel) deleteFun;
  final StudentModel studentModel;
  final void Function(StudentModel itemStageModel) editFun;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) => [
        PopupMenuItem(
          child: Text(
            ConstValue.kDelete,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
              fontFamily: FontName.geDinerOne,
            ),
          ),
          onTap: () {
            deleteFun(studentModel);
          },
        ),
        PopupMenuItem(
          child: Text(
            ConstValue.kEdit,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
              fontFamily: FontName.geDinerOne,
            ),
          ),
          onTap: () {
            editFun(studentModel);
          },
        ),
      ],
      child: const Icon(
        Icons.more_vert,
        color: Colors.white,
      ),
    );
  }
}
