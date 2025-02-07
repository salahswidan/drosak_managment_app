import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resources/const_value.dart';
import '../../../core/resources/font_manager.dart';
import '../../../model/education_stage/item_stage_model.dart';

class CustomSelectEducationStageNameAddNewGroup extends StatelessWidget {
  const CustomSelectEducationStageNameAddNewGroup(
      {super.key, required this.listItemsStageModel, required this.onChange});
  final List<ItemStageModel> listItemsStageModel;
  final Function(ItemStageModel?)? onChange;

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
        CustomDropdown<ItemStageModel>.search(
          hintText: ConstValue.kChooseEducationStage,
          items: listItemsStageModel,
          noResultFoundText: ConstValue.kNoFoundThisEducationStageName,
          //initialItem: 'a',
          onChanged: onChange,
        ),
        SizedBox(
          height: 16.h,
        ),
      ],
    );
  }
}
