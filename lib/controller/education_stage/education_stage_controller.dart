import 'dart:async';
import 'dart:io';

import 'package:drosak_managment_app/core/database/sqlflite/education_stage_operation.dart';
import 'package:drosak_managment_app/core/resources/colors_manager.dart';
import 'package:drosak_managment_app/core/resources/const_value.dart';
import 'package:drosak_managment_app/core/resources/font_manager.dart';
import 'package:drosak_managment_app/model/education_stage/item_stage_model.dart';
import 'package:drosak_managment_app/view/education_stages/widget/custom_list_view_items_stage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import '../../view/education_stages/widget/custom_add_new_education_stage.dart';
import '../../view/education_stages/widget/search/custom_search_delgate_education_stage_screen.dart';

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
  late StreamController<String?> controllerPathImage;
  late Sink<String?> inputPathImage;
  late Stream<String?> outPutPathImage;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  EducationStageController() {
    init();
  }
  void initControllers() {
    controllerListItemsStageModel = StreamController();
    inputDataListItemsStageModel = controllerListItemsStageModel.sink;
    outPutDataListItemsStageModel =
        controllerListItemsStageModel.stream.asBroadcastStream();
    inputDataListItemsStageModel.add(listItemStageModel);
    controllerPathImage = StreamController();
    inputPathImage = controllerPathImage.sink;
    outPutPathImage = controllerPathImage.stream.asBroadcastStream();
    inputPathImage.add(pathImage);
  }

  void disposeControllers() {
    controllerListItemsStageModel.close();
    inputDataListItemsStageModel.close();
    controllerPathImage.close();
    inputPathImage.close();
    controllerDescraptinEducationalStage.dispose();
    controllerNameEducationalStage.dispose();
  }

  init() async {
    initControllers();
    getAllItemList();
  }

  void getAllItemList() async {
    EducationStageOperation educationStageOperation = EducationStageOperation();
    listItemStageModel = await educationStageOperation.getAllEducationData();
    inputDataListItemsStageModel.add(listItemStageModel);
  }

  void pickImage(ImageSource imageSource) async {
    final ImagePicker picker = ImagePicker();
    var image = await picker.pickImage(source: imageSource);
    if (image != null) {
      pathImage = image.path;
      saveImagesOfMyApp(image);
    }
    inputPathImage.add(pathImage);
  }

  void saveImagesOfMyApp(XFile image) async {
    Directory directory = await getApplicationDocumentsDirectory();
    var directoryPath = directory.path;
    var finalPath = "$directoryPath/${image.name}";
    File fileImage = await File(image.path).copy(finalPath);
    pathImage = fileImage.path;
  }

  void openBottomSheet({required BuildContext context}) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) => CustomAddNewEducationStage(
            formKey: formKey,
            outPutPathImage: outPutPathImage,
            onPressedDeleteImage: () {
              pathImage = null;
              inputPathImage.add(pathImage);
            },
            onPressedPickImage: () {
              showCustomDialogChooseImage(context);
            },
            onPressedAdd: () async {
              if (formKey.currentState!.validate() == true) {
                bool inserted = await addToNewEducation();
                if (inserted == true) {
                  Navigator.pop(context);
                  listItemStageModel.add(ItemStageModel(
                      id: listItemStageModel.length + 1,
                      image: pathImage == null ? "" : pathImage!,
                      stageName: controllerNameEducationalStage.text,
                      desc: controllerDescraptinEducationalStage.text));
                  inputDataListItemsStageModel.add(listItemStageModel);
                  controllerDescraptinEducationalStage.clear();
                  controllerNameEducationalStage.clear();
                  pathImage = null;
                }
              }
            },
            controllerDescraptinEducationalStage:
                controllerDescraptinEducationalStage,
            controllerNameEducationalStage: controllerNameEducationalStage));
  }

  Future<bool> addToNewEducation() async {
    EducationStageOperation educationStageOperation = EducationStageOperation();
    bool inserted = await educationStageOperation.insertEducationDetails(
      ItemStageModel(
        id: 0,
        stageName: controllerNameEducationalStage.text,
        desc: controllerDescraptinEducationalStage.text,
        image: pathImage == null ? "" : pathImage!,
      ),
    );
    return inserted;
  }

  void showCustomDialogChooseImage(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
              title:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                IconButton.filled(
                  iconSize: 50,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorsManager.kPrimaryColor,
                  ),
                  onPressed: () {
                    pickImage(ImageSource.gallery);
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.image),
                ),
                SizedBox(
                  width: 30.w,
                ),
                IconButton.filled(
                  iconSize: 50,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorsManager.kPrimaryColor,
                  ),
                  onPressed: () {
                    pickImage(ImageSource.camera);
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.camera_alt),
                ),
              ]),
              icon: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton.filled(
                    iconSize: 10,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.close,
                      size: 20.0,
                      color: Colors.white,
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                  ),
                  const Text(
                    ConstValue.kChooseFrom,
                    style: TextStyle(
                        fontFamily: FontName.geDinerOne,
                        fontWeight: FontWeight.w900,
                        fontSize: 15),
                  ),
                ],
              ),
            ));
  }

  void showCustomSearch(BuildContext context) {
    showSearch(
        context: context, delegate: CustomSearchDelegatedEducationStage());
  }
}
