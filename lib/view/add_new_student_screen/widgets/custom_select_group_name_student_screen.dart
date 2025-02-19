import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:drosak_managment_app/model/group/group_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multiple_stream_builder/multiple_stream_builder.dart';
import '../../../core/resources/colors_manager.dart';
import '../../../core/resources/const_value.dart';
import '../../../core/resources/font_manager.dart';
import '../../../model/education_stage/item_stage_model.dart';

class CustomSelectGroupNameAddNewGroupScreen extends StatelessWidget {
  const CustomSelectGroupNameAddNewGroupScreen({
    super.key,
    required this.onChange,
    required this.outPutDataListItemGroupsDetails,
    this.initialItem,
    //   required this.outPutDataInitiaItem
  });
  final Function(GroupDetails?)? onChange;
  final Stream<List<GroupDetails>> outPutDataListItemGroupsDetails;
  //final Stream<GroupDetails> outPutDataInitiaItem;
  final GroupDetails? initialItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StreamBuilder<List<GroupDetails>>(
          stream: outPutDataListItemGroupsDetails,
          builder: (context, snapshot) => CustomDropdown<GroupDetails>.search(
            hintText: ConstValue.kChooseGroup,
            items: snapshot.data,
            noResultFoundText: ConstValue.kFirstSelectEducationStageName,
            //   initialItem: snapshot.data,
            listItemBuilder: (context, item, isSelected, onItemSelect) =>
                ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                item.name,
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
            headerBuilder: (context, selectedItem, enabled) => Row(children: [
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
                selectedItem.name,
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
