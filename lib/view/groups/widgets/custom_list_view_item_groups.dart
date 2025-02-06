import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../model/education_stage/item_stage_model.dart';
import '../../education_stages/widget/custom_item_stage.dart';
import 'custom_item_group.dart';

class CustomListViewItemGroups extends StatelessWidget {
  const CustomListViewItemGroups(
      {super.key,
     // required this.outPutDataListItemsGroupsModel,
      required this.deleteFun,
      required this.editFun,
      //required this.onRefresh
      });
 // final Stream<List<ItemStageModel>> outPutDataListItemsGroupsModel;
  final void Function(ItemStageModel itemStageModel) deleteFun;
  final void Function(ItemStageModel itemStageModel) editFun;
  //final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: 
      // snapshot.connectionState == ConnectionState.waiting
      //     ? Center(
      //         child: CircularProgressIndicator(),
      //       )
      //     : RefreshIndicator(
      //         onRefresh: () async {
      //           onRefresh();
      //         },
      //         child:
       ListView.separated(
                  itemBuilder: (context, index) =>
                      index ==3
                          ? SizedBox(
                              height: 24.h,
                            )
                          : CustomItemGroup(
                              deleteFun: deleteFun,
                              editFun: editFun,
                            ),
                  separatorBuilder: (context, index) => SizedBox(
                        height: 24.h,
                      ),
                  itemCount:3),
            
    );
  }
}
