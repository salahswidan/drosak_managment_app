import 'package:drosak_managment_app/core/database/sqlflite/education_stage_operation.dart';
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
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Column(
          children: [
            CustomAppBarEductionStages(onPressedAdd: () {
              _controller.openBottomSheet(
                context: context,
              );
            }, onPressedSearch: () {
              setState(() {});
            }),
            CustomListViewItemsStage(
              outPutDataListItemsStageModel: _controller.outPutDataListItemsStageModel,
            )
          ],
        ),
      ),
    );
  }
}
