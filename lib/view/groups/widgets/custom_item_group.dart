import 'package:drosak_managment_app/core/resources/colors_manager.dart';
import 'package:drosak_managment_app/core/resources/const_value.dart';
import 'package:drosak_managment_app/core/resources/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../model/group/group_info_model.dart';

class CustomItemGroup extends StatelessWidget {
  const CustomItemGroup({
    super.key,
    required this.deleteFun,
    required this.editFun,
    required this.groupInfoModel,
  });
  final GroupInfoModel groupInfoModel;
  final void Function(GroupInfoModel itemStageModel) deleteFun;
  final void Function(GroupInfoModel itemStageModel) editFun;
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
                groupInfoModel.groupDetails.id.toString(),
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
                                  Expanded(
                                    child: Text(
                                      groupInfoModel.groupDetails.name,
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
                                  PopupMenuButton(
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
                                          deleteFun(groupInfoModel);
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
                                          editFun(groupInfoModel);
                                        },
                                      ),
                                    ],
                                    child: const Icon(
                                      Icons.more_vert,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
                                    i < groupInfoModel.listAppointment.length;
                                    i++)
                                  TableRow(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4, vertical: 10),
                                        child: Center(
                                          child: Text(
                                            groupInfoModel
                                                .listAppointment[i].day,
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
                                            groupInfoModel
                                                .listAppointment[i].time,
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
                                            groupInfoModel
                                                .listAppointment[i].ms,
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
                                    groupInfoModel.groupDetails.desc,
                                    style: TextStyle(
                                        fontSize: 10.sp,
                                        fontFamily: FontName.geDinerOne,
                                        color: Colors.white.withOpacity(0.6)),
                                  ),
                                ),
                                // if (itemStageModel.createdAt != null)
                                //   Text(
                                //     itemStageModel.createdAt!,
                                //     style: TextStyle(
                                //         fontSize: 9.sp,
                                //         fontFamily: FontName.geDinerOne,
                                //         color: Colors.white.withOpacity(0.6)),
                                //   ),
                              ],
                            ),
                          ]),
                    ),
                    SizedBox(
                      width: 7.w,
                    ),
                    // ClipRRect(
                    //   borderRadius: BorderRadius.circular(50),
                    //   child: Image.file(
                    //     errorBuilder: (context, error, stackTrace) =>
                    //         SvgPicture.asset(
                    //       AssetsValuesManager.kPlaceholderSvg,
                    //       width: 50.w,
                    //       height: 50.h,
                    //     ),
                    //     File('itemStageModel.image'),
                    //     width: 64.w,
                    //     height: 64.h,
                    //   ),
                    // ),
                  ]),
            )),
      ],
    );
  }
}
