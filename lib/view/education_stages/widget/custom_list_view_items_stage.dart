
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../model/education_stage/item_stage_model.dart';
import 'custom_item_stage.dart';

class CustomListViewItemsStage extends StatelessWidget {
  final List<ItemStageModel> listItemStageModel;

  const CustomListViewItemsStage({super.key, required this.listItemStageModel});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          itemBuilder: (context, index) => CustomItemStage(
                itemStageModel: listItemStageModel[index],
            
          ),
          separatorBuilder: (context, index) => SizedBox(
                height: 24.h,
              ),
          itemCount: listItemStageModel.length),
    );
  }
}
