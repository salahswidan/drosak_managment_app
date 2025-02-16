import 'package:drosak_managment_app/model/group/group_info_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../model/education_stage/item_stage_model.dart';
import '../../education_stages/widget/custom_item_stage.dart';
import 'custom_item_group.dart';

class CustomListSearchGroupScreen extends StatelessWidget {
  const CustomListSearchGroupScreen (
      {super.key,
      required this.getSearchItemsgroup,
      required this.deleteFun,
      required this.editFun});
  final Future<List<GroupInfoModel>> getSearchItemsgroup;
  final void Function(GroupInfoModel groupInfoModel) deleteFun;
  final void Function(GroupInfoModel groupInfoModel) editFun;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<GroupInfoModel>>(
      future: getSearchItemsgroup,
      builder: (context, snapshot) {
        return snapshot.connectionState == ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Directionality(
                textDirection: TextDirection.rtl,
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  SizedBox(
                    height: 24.h,
                  ),
                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) =>
                            index == snapshot.data!.length
                                ? SizedBox(
                                    height: 24.h,
                                  )
                                : CustomItemGroup(
                              groupInfoModel: snapshot.data![index],
                              deleteFun: deleteFun,
                              editFun: editFun,
                            ),
                        separatorBuilder: (context, index) => SizedBox(
                              height: 24.h,
                            ),
                        itemCount: snapshot.data!.length + 1),
                  ),
                ]),
              );
      },
    );
  }
}
