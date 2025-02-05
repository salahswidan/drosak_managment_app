import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../model/education_stage/item_stage_model.dart';
import '../custom_item_stage.dart';


class CustomListSearchEducationStageScreen extends StatelessWidget {
  const CustomListSearchEducationStageScreen(
      {super.key, required this.getSearchItemsStage, required this.deleteFun, required this.editFun});
  final Future<List<ItemStageModel>> getSearchItemsStage;
  final void Function(ItemStageModel itemStageModel) deleteFun;
  final void Function(ItemStageModel itemStageModel) editFun;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ItemStageModel>>(
      future: getSearchItemsStage,
      builder: (context, snapshot) {
        return snapshot.connectionState == ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
              mainAxisSize: MainAxisSize.min,
              children:[ 
                SizedBox(height: 24.h,),
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) =>
                        index == snapshot.data!.length
                            ? SizedBox(
                                height: 24.h,
                              )
                            : CustomItemStage(
                              editFun: editFun,
                              deleteFun:deleteFun ,
                                itemStageModel: snapshot.data![index],
                              ),
                    separatorBuilder: (context, index) => SizedBox(
                          height: 24.h,
                        ),
                    itemCount: snapshot.data!.length + 1),
                ),
           ] );
      },
    );
  }
}
