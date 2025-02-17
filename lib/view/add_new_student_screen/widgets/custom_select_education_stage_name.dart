import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multiple_stream_builder/multiple_stream_builder.dart';
import '../../../core/resources/colors_manager.dart';
import '../../../core/resources/const_value.dart';
import '../../../core/resources/font_manager.dart';
import '../../../model/education_stage/item_stage_model.dart';

class CustomSelectEducationStageNameAddNewGroup extends StatelessWidget {
  const CustomSelectEducationStageNameAddNewGroup(
      {super.key,
      required this.onChange,
      required this.outPutDataListItemStageModel,
      this.initialItem, required this.outPutDataInitiaItem});
  final Function(ItemStageModel?)? onChange;
  final Stream<List<ItemStageModel>> outPutDataListItemStageModel;
  final Stream<ItemStageModel> outPutDataInitiaItem;
  final ItemStageModel? initialItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Divider(
            thickness: 1,
          ),
        ),
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            ConstValue.kChooseEducationStage,
            style: TextStyle(
                fontFamily: FontName.geDinerOne,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
        SizedBox(
          height: 12.h,
        ),
        StreamBuilder2<List<ItemStageModel>, ItemStageModel>(
          streams: StreamTuple2(outPutDataListItemStageModel, outPutDataInitiaItem),
          builder: (context, snapshots) => snapshots.snapshot1.connectionState ==
                  ConnectionState.waiting
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : CustomDropdown<ItemStageModel>.search(
                  hintText: ConstValue.kChooseEducationStage,
                  items: snapshots.snapshot1.data,
                  noResultFoundText: ConstValue.kNoFoundThisEducationStageName,
                  initialItem:snapshots.snapshot2.data,
                  listItemBuilder: (context, item, isSelected, onItemSelect) =>
                      ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      item.stageName,
                      style: TextStyle(color: Colors.black, fontSize: 14.sp),
                    ),
                    subtitle: item.desc.isEmpty
                        ? Text(
                            "",
                            style: TextStyle(color: Colors.black),
                          )
                        : Text(item.desc),
                    leading: CircleAvatar(
                        radius: 10.r,
                        backgroundColor: ColorsManager.kPrimaryColor,
                        child: Text(item.id.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.sp,
                            ))),
                  ),
                  onChanged: onChange,
                  itemsListPadding: EdgeInsets.zero,
                  headerBuilder: (context, selectedItem, enabled) =>
                      Row(children: [
                    CircleAvatar(
                        radius: 10.r,
                        backgroundColor: ColorsManager.kPrimaryColor,
                        child: Text(selectedItem.id.toString(),
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: Colors.white,
                            ))),
                    SizedBox(
                      width: 15.w,
                    ),
                    Expanded(
                        child: Text(
                      selectedItem.stageName,
                      style: TextStyle(color: Colors.black, fontSize: 14.sp),
                    )),
                  ]),
                ),
        ),
        SizedBox(
          height: 16.h,
        ),
      ],
    );
  }
}
