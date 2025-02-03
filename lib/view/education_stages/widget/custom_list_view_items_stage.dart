import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../model/education_stage/item_stage_model.dart';
import 'custom_item_stage.dart';

class CustomListViewItemsStage extends StatelessWidget {
  const CustomListViewItemsStage(
      {super.key, required this.outPutDataListItemsStageModel});
  final Stream<List<ItemStageModel>> outPutDataListItemsStageModel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder<List<ItemStageModel>>(
        stream: outPutDataListItemsStageModel,
        builder: (context, snapshot) {
          return snapshot.connectionState == ConnectionState.waiting
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.separated(
                  itemBuilder: (context, index) =>
                      index == snapshot.data!.length
                          ? SizedBox(
                              height: 24.h,
                            )
                          : CustomItemStage(
                              itemStageModel: snapshot.data![index],
                            ),
                  separatorBuilder: (context, index) => SizedBox(
                        height: 24.h,
                      ),
                  itemCount: snapshot.data!.length + 1);
        },
      ),
    );
  }
}
