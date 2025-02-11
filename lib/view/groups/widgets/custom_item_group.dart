import 'package:drosak_managment_app/core/resources/colors_manager.dart';
import 'package:drosak_managment_app/core/resources/const_value.dart';
import 'package:drosak_managment_app/core/resources/font_manager.dart';
import 'package:drosak_managment_app/model/education_stage/item_stage_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../model/group/group_info_model.dart';

class CustomItemGroup extends StatelessWidget {
  const CustomItemGroup({
    super.key,
    // required this.itemStageModel,
    required this.deleteFun,
    required this.editFun,
    required this.groupInfoModel,
  });
  final GroupInfoModel groupInfoModel;
  final void Function(ItemStageModel itemStageModel) deleteFun;
  final void Function(ItemStageModel itemStageModel) editFun;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.startToEnd) {
          //     deleteFun(itemStageModel);

          bool? confirmDelete = await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text(ConstValue.kAreYouSureToDeleteItem),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    child: const Text(ConstValue.kSure)),
                TextButton(
                    onPressed: () {
                      // deleteFun(itemStageModel);
                      Navigator.of(context).pop(false);
                    },
                    child: const Text(ConstValue.kNo)),
              ],
            ),
          );
          return confirmDelete;
        } else if (direction == DismissDirection.endToStart) {
          //   editFun(itemStageModel);
          return false;
        }
        return false;
      },
      // onDismissed: (direction) {

      // },
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: EdgeInsets.all(5.w),
        child: Text(
          ConstValue.kDelete,
          style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
              fontFamily: FontName.geDinerOne),
        ),
      ),
      secondaryBackground: Container(
        color: Colors.green,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(5.w),
        child: Text(
          ConstValue.kEdit,
          style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
              fontFamily: FontName.geDinerOne),
        ),
      ),
      key: ValueKey(groupInfoModel.groupDetails.id),
      //itemStageModel.id

      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
              right: 2.h,
              top: -20.h,
              child: CircleAvatar(
                child: Text(
                  groupInfoModel.groupDetails.id.toString(),
                  //  itemStageModel.id.toString(),
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
                              Center(
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
                                        child: const Center(
                                          child: Text(
                                            ConstValue.kDay,
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 4, vertical: 4),
                                        child: const Center(
                                          child: Text(
                                            ConstValue.kTime,
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 4, vertical: 4),
                                        child: Center(
                                          child: Text(
                                            ConstValue.kMS,
                                            style:
                                                TextStyle(color: Colors.white),
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
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: ColorsManager.kPrimaryColor,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    const BoxShadow(
                        color: ColorsManager.kPrimaryColor,
                        blurRadius: 5,
                        blurStyle: BlurStyle.outer,
                        spreadRadius: 1,
                        offset: Offset(0, 0))
                  ]),
              margin: EdgeInsets.symmetric(horizontal: 16.w)),
        ],
      ),
    );
  }
}
