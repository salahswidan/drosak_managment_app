import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/resources/const_value.dart';
import '../../../core/resources/font_manager.dart';
import '../../../model/education_stage/item_stage_model.dart';

class CustomSelectEducationStageNameAddNewGroup extends StatelessWidget {
  const CustomSelectEducationStageNameAddNewGroup(
      {super.key,
      required this.onChange,
      required this.outPutDataListItemStageModel});
  final Function(ItemStageModel?)? onChange;
  final Stream<List<ItemStageModel>> outPutDataListItemStageModel;

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
        StreamBuilder(
          stream: outPutDataListItemStageModel,
          builder: (context, snapshot) => snapshot.connectionState ==
                  ConnectionState.waiting
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : CustomDropdown<ItemStageModel>.search(
                  hintText: ConstValue.kChooseEducationStage,
                  items: snapshot.data,
                  noResultFoundText: ConstValue.kNoFoundThisEducationStageName,
                  //initialItem: 'a',
                  listItemBuilder: (context, item, isSelected, onItemSelect) =>
                      ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      item.stageName,
                    ),
                    subtitle: item.desc.isEmpty
                        ? Text(
                            "null",
                            style: TextStyle(color: Colors.black),
                          )
                        : Text(item.desc),
                    leading: CircleAvatar(child: Text(item.id.toString())),
                  ),
                  onChanged: (p0) {
                    print(p0);
                  },
                ),
        ),
        SizedBox(
          height: 16.h,
        ),
      ],
    );
  }
}
