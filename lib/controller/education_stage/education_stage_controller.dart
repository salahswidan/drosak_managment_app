import 'dart:async';
import 'dart:io';
import 'package:drosak_managment_app/core/database/sqlflite/education_stage_operation.dart';
import 'package:drosak_managment_app/model/education_stage/item_stage_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import '../../core/widget/dialog/show_custom_dialog_choose_image_opations.dart';
import '../../core/widget/search/custom_search_delgate_education_stage_screen.dart';
import '../../view/education_stages/widget/custom_add_new_education_stage.dart';
import '../../view/education_stages/widget/search/custom_list_search_education_stage_screen.dart';

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
  Future<void> onRefresh() async {
    listItemStageModel.clear();
    inputDataListItemsStageModel.add(listItemStageModel);
    getAllItemList();

    await Future.delayed(Duration(seconds: 1));
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

  void deleteItemStage(ItemStageModel itemStageModel) async {
    EducationStageOperation educationStageOperation = EducationStageOperation();
    bool update = await educationStageOperation.softDelete(itemStageModel);
    listItemStageModel
        .removeWhere((element) => element.id == itemStageModel.id);
  }

  void editItemStage(
      ItemStageModel itemStageModel, BuildContext context) async {
    controllerNameEducationalStage.text = itemStageModel.stageName;
    controllerDescraptinEducationalStage.text = itemStageModel.desc;
    pathImage = itemStageModel.image;
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          inputPathImage.add(pathImage);

          return CustomAddNewEducationStage(
              edit: true,
              formKey: formKey,
              outPutPathImage: outPutPathImage,
              onPressedDeleteImage: () {
                pathImage = null;
                inputPathImage.add(pathImage);
              },
              onPressedPickImage: () {
                () {
                  showCustomDialogChooseImage(
                    context: context,
                    onPressedPickImageByGallery: () {
                      pickImage(ImageSource.gallery);
                      Navigator.pop(context);
                    },
                    onPressedPickImageByCamera: () {
                      pickImage(ImageSource.camera);
                      Navigator.pop(context);
                    },
                  );
                };
              },
              onPressedAdd: () async {
                if (formKey.currentState!.validate() == true) {
                  ItemStageModel newItem = ItemStageModel(
                    id: itemStageModel.id,
                    image: pathImage == null ? "" : pathImage!,
                    stageName: controllerNameEducationalStage.text,
                    desc: controllerDescraptinEducationalStage.text,
                  );
                  bool edit = await editEducation(newItem);
                  print(edit);
                  if (edit == true) {
                    Navigator.pop(context);
                    int indexEditModel =
                        listItemStageModel.indexOf(itemStageModel);

                    if (indexEditModel >= 0) {
                      listItemStageModel[indexEditModel] = newItem;
                    } else {
                      Navigator.pop(context);
                    }

                    inputDataListItemsStageModel.add(listItemStageModel);
                    controllerDescraptinEducationalStage.clear();
                    controllerNameEducationalStage.clear();
                    pathImage = null;
                  }
                }
              },
              controllerDescraptinEducationalStage:
                  controllerDescraptinEducationalStage,
              controllerNameEducationalStage: controllerNameEducationalStage);
        });
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
    controllerDescraptinEducationalStage.clear();
    controllerNameEducationalStage.clear();
    pathImage = null;
    inputPathImage.add(pathImage);
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
              showCustomDialogChooseImage(
                context: context,
                onPressedPickImageByGallery: () {
                  pickImage(ImageSource.gallery);
                  Navigator.pop(context);
                },
                onPressedPickImageByCamera: () {
                  pickImage(ImageSource.camera);
                  Navigator.pop(context);
                },
              );
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

  Future<bool> editEducation(ItemStageModel itemStageModel) async {
    EducationStageOperation educationStageOperation = EducationStageOperation();
    bool updated = await educationStageOperation.editEducationStage(
      itemStageModel,
    );
    return updated;
  }

  void showCustomSearch(BuildContext context) {
    showSearch(
        context: context,
        delegate: CustomSearchDelegated(myBuildResult: (String query) {
          EducationStageOperation educationStageOperation =
              EducationStageOperation();
          return query == ''
              ? SizedBox()
              : CustomListSearchEducationStageScreen(
                  getSearchItemsStage:
                      educationStageOperation.getSearchWord(searchWord: query),
                  deleteFun: (itemStageModel) {
                    deleteItemStage(itemStageModel);
                  },
                  editFun: (itemStageModel) {
                    editItemStage(itemStageModel, context);
                  },
                );
        })).then((value) => getAllItemList());
  }
}
