import 'package:drosak_managment_app/model/education_stage/item_stage_model.dart';
import 'package:flutter/material.dart';
import '../../../controller/education_stage/education_stage_controller.dart';
import '../widget/custom_app_bar_education_stage.dart';
import '../widget/custom_list_view_items_stage.dart';

class EducationStagesScreen extends StatefulWidget {
  const EducationStagesScreen({super.key});

  @override
  State<EducationStagesScreen> createState() => _EducationStagesScreenState();
}

class _EducationStagesScreenState extends State<EducationStagesScreen> {
  late EducationStageController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = EducationStageController();
  }

  @override
  void dispose() {
    _controller.disposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Column(
          children: [
            CustomAppBarEductionStages(
              outPutDataListItemsStageModel: _controller.outPutDataListItemsStageModel,
              onPressedAdd: () {
              _controller.openBottomSheet(
                context: context,
              );
            }, onPressedSearch: () {
              _controller.showCustomSearch(context);
            }),
            CustomListViewItemsStage(
                outPutDataListItemsStageModel:
                    _controller.outPutDataListItemsStageModel,
                deleteFun: _controller.deleteItemStage,
                editFun: (itemStageModel) {
                  _controller.editItemStage(itemStageModel, context);
                }),
          ],
        ),
      ),
    );
  }
}
