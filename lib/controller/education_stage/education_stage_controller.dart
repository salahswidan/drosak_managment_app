import 'dart:async';

import 'package:drosak_managment_app/core/database/sqlflite/education_stage_operation.dart';
import 'package:drosak_managment_app/model/education_stage/item_stage_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../view/education_stages/widget/custom_add_new_education_stage.dart';

class EducationStageController {
  List<ItemStageModel> listItemStageModel = [];
  TextEditingController controllerNameEducationalStage =
      TextEditingController();
  TextEditingController controllerDescraptinEducationalStage =
      TextEditingController();
  String? pathImage;
  late StreamController<List<ItemStageModel>> controllerListItemsStageModel;
  late Sink<List<ItemStageModel>> inputDataListItemsStageModel;
  late Stream<List<ItemStageModel>> outPutDataListItemsStageModel;
  EducationStageController() {
    init();
  }
  void initControllers(){
    controllerListItemsStageModel = StreamController();
    inputDataListItemsStageModel = controllerListItemsStageModel.sink;
    outPutDataListItemsStageModel = controllerListItemsStageModel.stream;
    inputDataListItemsStageModel.add(listItemStageModel);

  }
  void disposeControllers(){
    controllerListItemsStageModel.close();
    inputDataListItemsStageModel.close();
  }
  init() async {
    initControllers();
    EducationStageOperation educationStageOperation = EducationStageOperation();
    listItemStageModel = await educationStageOperation.getAllEducationData();
        inputDataListItemsStageModel.add(listItemStageModel);

  }

  void pickImageFromGallary() async {
    final ImagePicker picker = ImagePicker();
    var image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) pathImage = image.path;
  }

  void pickImageFromCamera() async {
    final ImagePicker picker = ImagePicker();
    var image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) pathImage = image.path;
  }

  void openBottomSheet({required BuildContext context}) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) => CustomAddNewEducationStage(
            onPressedDeleteImage: () {
              pathImage = null;
              print(pathImage);
            },
            pathImage: pathImage,
            onPressedPickImage: () {
              pickImageFromGallary();
            },
            onPressedAdd: () {
              addToNewEducation();
            },
            controllerDescraptinEducationalStage:
                controllerDescraptinEducationalStage,
            controllerNameEducationalStage: controllerNameEducationalStage));
  }

  void addToNewEducation() async {
    EducationStageOperation educationStageOperation = EducationStageOperation();
    print(pathImage);
    bool inserted = await educationStageOperation.insertEducationDetails(
      ItemStageModel(
        id: 0,
        stageName: controllerNameEducationalStage.text,
        desc: controllerDescraptinEducationalStage.text,
        image: pathImage == null ? "" : pathImage!,
      ),
    );
    print(inserted);
  }
}
