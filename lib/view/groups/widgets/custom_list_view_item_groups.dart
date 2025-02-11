import 'package:drosak_managment_app/model/group/group_info_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../model/education_stage/item_stage_model.dart';
import 'custom_item_group.dart';

class CustomListViewItemGroups extends StatelessWidget {
  const CustomListViewItemGroups({
    super.key,
    required this.outPutDataListItemsGroupModel,
    required this.deleteFun,
    required this.editFun,
    //required this.onRefresh
  });
  final Stream<List<GroupInfoModel>> outPutDataListItemsGroupModel;
  final void Function(ItemStageModel itemStageModel) deleteFun;
  final void Function(ItemStageModel itemStageModel) editFun;
  //final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: outPutDataListItemsGroupModel,
      builder: (context, snapshot) => Expanded(
        child: snapshot.connectionState == ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(),
              )
            :
            //  RefreshIndicator(
            //     onRefresh: () async {
            //       onRefresh();
            //     },
            //     child:

            ListView.separated(
                itemBuilder: (context, index) =>
                    index == snapshot.data!.length
                    ? SizedBox(
                        height: 24.h,
                      )
                    :
                    CustomItemGroup(
                      groupInfoModel: snapshot.data![index],
                      deleteFun: deleteFun,
                      editFun: editFun,
                    ),
                separatorBuilder: (context, index) => SizedBox(
                      height: 24.h,
                    ),
                itemCount: snapshot.data!.length +1),
      ),
    );
  }
}
