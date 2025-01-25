import 'package:drosak_managment_app/model/education_stage/item_stage_model.dart';
import 'package:flutter/material.dart';
import '../../view/education_stages/widget/custom_add_new_education_stage.dart';

class EducationStageController {
  List<ItemStageModel> listItemStageModel = [];
  TextEditingController controllerAddNewEducationalStage =
      TextEditingController();
  void openBottomSheet({required BuildContext context}) {
    showModalBottomSheet(
        context: context,
        builder: (context) => CustomAddNewEducationStage(controllerAddNewEducationalStage: controllerAddNewEducationalStage)
        );
  }
  void addToNewEducationalStageToDB() {
    
  }
}
