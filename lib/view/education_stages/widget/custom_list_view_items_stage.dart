import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../model/education_stage/item_stage_model.dart';
import 'custom_item_stage.dart';

class CustomListViewItemsStage extends StatelessWidget {
  const CustomListViewItemsStage(
      {super.key,
      required this.outPutDataListItemsStageModel,
      required this.deleteFun,
      required this.editFun, required this.onRefresh});
  final Stream<List<ItemStageModel>> outPutDataListItemsStageModel;
  final void Function(ItemStageModel itemStageModel) deleteFun;
  final void Function(ItemStageModel itemStageModel) editFun;
  final Future<void> Function() onRefresh;

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
              : RefreshIndicator(
                  onRefresh: () async {
                    onRefresh();
                  },
                  child: ListView.separated(
                      itemBuilder: (context, index) =>
                          index == snapshot.data!.length
                              ? SizedBox(
                                  height: 24.h,
                                )
                              : CustomItemStage(
                                  itemStageModel: snapshot.data![index],
                                  deleteFun: deleteFun,
                                  editFun: editFun,
                                ),
                      separatorBuilder: (context, index) => SizedBox(
                            height: 24.h,
                          ),
                      itemCount: snapshot.data!.length + 1),
                );
        },
      ),
    );
  }
}
