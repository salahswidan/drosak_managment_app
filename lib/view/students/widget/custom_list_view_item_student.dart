import 'package:drosak_managment_app/model/group/group_info_model.dart';
import 'package:drosak_managment_app/view/students/widget/custom_item_student.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../model/education_stage/item_stage_model.dart';
import '../../groups/widgets/custom_item_group.dart';

class CustomListViewItemStudent extends StatelessWidget {
  const CustomListViewItemStudent(
      {super.key,
      required this.outPutDataListItemsStudentModel,
      required this.deleteFun,
      required this.editFun,
      required this.onRefresh});
  final Stream<List<GroupInfoModel>> outPutDataListItemsStudentModel;
  final void Function(GroupInfoModel groupInfoModel) deleteFun;
  final void Function(GroupInfoModel groupInfoModel) editFun;
  final void Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: outPutDataListItemsStudentModel,
      builder: (context, snapshot) => Expanded(
        child: RefreshIndicator(
          onRefresh: () async {
            onRefresh();
          },
          child: snapshot.connectionState == ConnectionState.waiting
              ? SizedBox()
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
                          : CustomItemStudent(
                              groupInfoModel: snapshot.data![index],
                              deleteFun: deleteFun,
                              editFun: editFun,
                            ),
                  separatorBuilder: (context, index) => SizedBox(
                        height: 24.h,
                      ),
                  itemCount: snapshot.data!.length + 1),
        ),
      ),
    );
  }
}
