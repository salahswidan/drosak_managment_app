import 'dart:async';
import 'dart:io';
import 'package:drosak_managment_app/core/database/sqlflite/groups_operation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import '../../core/database/sqlflite/education_stage_operation.dart';
import '../../core/resources/const_value.dart';
import '../../core/widget/dialog/show_custom_dialog_choose_image_opations.dart';
import '../../model/education_stage/item_stage_model.dart';
import '../../model/group/appointment_model.dart';
import '../../model/group/group_details.dart';

class AddNewStudentScreenController {
  late StreamController<String?> controllerPathImage;
  late Sink<String?> inputPathImage;
  late Stream<String?> outPutPathImage;
  String status = ConstValue.kAddNewStudent;
  String? pathImage;

  TextEditingController controllerStudentNote = TextEditingController();
  TextEditingController controllerStudentName = TextEditingController();
  GlobalKey<FormState> formStateStudentDetails = GlobalKey<FormState>();
  /////////
  ItemStageModel? selectedEducationalStage;
  GroupDetails? selectedGroupDetails;

  late StreamController<List<ItemStageModel>> controllerListItemStageModel;
  late Sink<List<ItemStageModel>> inputDataListItemStageModel;
  late Stream<List<ItemStageModel>> outPutDataListItemStageModel;
  List<ItemStageModel> listItemStageModel = [];

  late StreamController<List<GroupDetails>> controllerListItemGroupDetails;
  late Sink<List<GroupDetails>> inputDataListItemGroupDetails;
  late Stream<List<GroupDetails>> outPutDataListItemGroupDetails;

  late StreamController<List<AppointmentModel>> controllerListAppointment;
  late Sink<List<AppointmentModel>> inPutDataAppointment;
  late Stream<List<AppointmentModel>> outPutDataAppointment;

  late StreamController<ItemStageModel> _controllerInitiaItemSelectedStage;
  late Sink<ItemStageModel> _inPutDataInitiaItemSelectedStage;
  late Stream<ItemStageModel> outPutDataInitiaItemSelectedStage;

  late StreamController<GroupDetails?> _controllerInitiaItemSelectedGroup;
  late Sink<GroupDetails?> _inPutDataInitiaItemSelectedGroup;
  late Stream<GroupDetails?> outPutDataInitiaItemSelectedGroup;

  BuildContext context;
  AddNewStudentScreenController(this.context) {
    start();
  }

  void start() async {
    await initControllers();
    initAllData();
  }

  Future<void> initControllers() async {
    // init stram image student
    controllerPathImage = StreamController();
    inputPathImage = controllerPathImage.sink;
    outPutPathImage = controllerPathImage.stream.asBroadcastStream();
    // init stram List Group Details
    controllerListItemGroupDetails = StreamController();
    inputDataListItemGroupDetails = controllerListItemGroupDetails.sink;
    outPutDataListItemGroupDetails =
        controllerListItemGroupDetails.stream.asBroadcastStream();

    controllerListItemStageModel = StreamController();
    inputDataListItemStageModel = controllerListItemStageModel.sink;
    outPutDataListItemStageModel =
        controllerListItemStageModel.stream.asBroadcastStream();
    //  init stram of initial selected group stage
    _controllerInitiaItemSelectedGroup = StreamController();
    _inPutDataInitiaItemSelectedGroup = _controllerInitiaItemSelectedGroup.sink;
    outPutDataInitiaItemSelectedGroup =
        _controllerInitiaItemSelectedGroup.stream.asBroadcastStream();

    controllerListAppointment = StreamController();
    inPutDataAppointment = controllerListAppointment.sink;
    outPutDataAppointment =
        controllerListAppointment.stream.asBroadcastStream();

    _controllerInitiaItemSelectedStage = StreamController();
    _inPutDataInitiaItemSelectedStage = _controllerInitiaItemSelectedStage.sink;
    outPutDataInitiaItemSelectedStage =
        _controllerInitiaItemSelectedStage.stream.asBroadcastStream();
  }

  void initAllData() async {
    await putImageIntoStream();
    await getAllItemStageModelList();
  }

  Future<void> putImageIntoStream() async {
    inputPathImage.add(pathImage);
  }

  Future<void> getAllItemStageModelList() async {
    EducationStageOperation educationStageOperation = EducationStageOperation();
    listItemStageModel = await educationStageOperation.getAllEducationData();
    inputDataListItemStageModel.add(listItemStageModel);
  }

  var outPutSelectedMSStream;

  void getArgumentFromLastScreen(BuildContext context) {
    var arg = ModalRoute.of(context);
    if (arg != null) {
      var arguments = arg.settings.arguments;
      if (arguments is Map) {
        // now in status edit
      } else {
        // now in status add
      }
    }
  }

  onChangedSelectEducationStageName(ItemStageModel? p1) {
    selectedEducationalStage = p1;
    if (selectedEducationalStage != null) getGroupsByEducationStageName();
  }

  onChangedSelectGroupName(GroupDetails? p1) {
    selectedGroupDetails = p1;
    if (selectedGroupDetails != null) getAppintmentGroupByGroupName();
  }

  Future<void> getGroupsByEducationStageName() async {
    GroupsOperation groupsOperation = GroupsOperation();
    List<GroupDetails> listGroup =
        await groupsOperation.getGroupInnerJoinEducationStage(
            educationID: selectedEducationalStage!.id);

    inPutDataAppointment.add([]);
    selectedGroupDetails = null;
    _inPutDataInitiaItemSelectedGroup.add(selectedGroupDetails);
    inputDataListItemGroupDetails.add(listGroup);
    if (listGroup.isNotEmpty) {
      selectedGroupDetails = listGroup[0];
      _inPutDataInitiaItemSelectedGroup.add(selectedGroupDetails);
    }
  }

  Future<void> getAppintmentGroupByGroupName() async {
    GroupsOperation groupsOperation = GroupsOperation();
    List<AppointmentModel> listAppointment =
        await groupsOperation.getAppointmentsGroupInnerJoinGroupsTable(
            groupId: selectedGroupDetails!.id);
    _inPutDataInitiaItemSelectedGroup.add(selectedGroupDetails);

    inPutDataAppointment.add(listAppointment);
  }

  void _closeKeyboard() {
    FocusScope.of(context).unfocus(); // to hide keyboard
  }

  Future<void> disposeControllers() async {
    controllerListItemStageModel.close();
    inputDataListItemStageModel.close();

    controllerListItemGroupDetails.close();
    inputDataListItemGroupDetails.close();

    inPutDataAppointment.close();
    controllerListAppointment.close();

    _controllerInitiaItemSelectedGroup.close();
    _inPutDataInitiaItemSelectedGroup.close();
  }

  void backToMainScreen(BuildContext context) {
    Navigator.of(context).pop();
    // Navigator.of(context)
    //     .pushNamed(RoutesName.kMainScreen, arguments: ConstValue.kAddNewGroup);
  }

  void onPressedAtEditOrSave() async {
    if (status == ConstValue.kEditThisStudent) {
      //! in case edit
      // bool updated = await editIntoGroupInfo();
      // if (updated == true) {
      //   {
      //     ScaffoldMessenger.of(context).showSnackBar(
      //         SnackBar(content: Text(ConstValue.kAddedGroupDetailsSucces)));
      //     backToMainScreen(context);
      //   }
      // }
      //   Navigator.of(context).pop();
    } else {
      //! save data
    }
  }

  void onPressedPickImage() {
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
  }

  void onPressedDeleteImage() {
    pathImage = null;
    putImageIntoStream();
  }

  void pickImage(ImageSource imageSource) async {
    final ImagePicker picker = ImagePicker();
    var image = await picker.pickImage(source: imageSource);
    if (image != null) {
      pathImage = image.path;
      saveImagesOfMyApp(image);
    }
    await putImageIntoStream();
  }

  void saveImagesOfMyApp(XFile image) async {
    Directory directory = await getApplicationDocumentsDirectory();
    var directoryPath = directory.path;
    var finalPath = "$directoryPath/${image.name}";
    File fileImage = await File(image.path).copy(finalPath);
    pathImage = fileImage.path;
  }
}
