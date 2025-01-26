import 'package:drosak_managment_app/core/database/sqlflite/education_stage_operation.dart';
import 'package:drosak_managment_app/core/resources/assets_values_manager.dart';
import 'package:drosak_managment_app/model/education_stage/item_stage_model.dart';
import 'package:flutter/material.dart';
import '../../view/education_stages/widget/custom_add_new_education_stage.dart';

class EducationStageController {
  List<ItemStageModel> listItemStageModel = [];
  TextEditingController controllerNameEducationalStage =
      TextEditingController();
  TextEditingController controllerDescraptinEducationalStage =
      TextEditingController();
  void openBottomSheet({required BuildContext context}) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) => CustomAddNewEducationStage(
            onPressed: () {
              addToNewEducation();
            },
            controllerDescraptinEducationalStage:
                controllerDescraptinEducationalStage,
            controllerNameEducationalStage: controllerNameEducationalStage));
  }

  void addToNewEducation() async {
    EducationStageOperation educationStageOperation = EducationStageOperation();
  bool inserted =await  educationStageOperation.insertEducationDetails(
      ItemStageModel(
        id: 0,
        stageName: controllerNameEducationalStage.text,
        desc: controllerDescraptinEducationalStage.text,
        image: AssetsValuesManager.assetsImagesPlaceholderSvg,
      ),
    );
    print(inserted);
  }
}
