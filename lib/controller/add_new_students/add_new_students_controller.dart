import 'dart:async';
import 'dart:io';
import 'package:drosak_managment_app/core/database/sqlflite/groups_operation.dart';
import 'package:drosak_managment_app/core/database/sqlflite/student_operation.dart';
import 'package:drosak_managment_app/core/resources/font_manager.dart';
import 'package:drosak_managment_app/model/student/student_model.dart';
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
  StudentModel? studentModel;

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
    //? check in edit
    if (studentModel != null) {
      fillDataStudentModel();
    }
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
        status = arguments[ConstValue.kStatus].toString();
        studentModel = arguments[ConstValue.kStudentModel];
      } else {
        // now in status add
        status = arguments.toString();
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

    

    controllerListItemStageModel.close();
    inputDataListItemStageModel.close();

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
      await editAll();
    } else if (status == ConstValue.kAddNewStudent) {
      await saveAll();
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

  Future<void> saveAll() async {
    String requiredData = checkRequiredData();

    if (requiredData.trim().isEmpty) {
      // now insert to data base
      await insertNewStudent();
      print("now insert");
    } else {
      //? show alert
      showAlertForRequiredData(requiredData);
    }
  }

  String checkRequiredData() {
    String requiredData = "";

    if (controllerStudentName.text.trim().isEmpty) {
      requiredData += ", ${ConstValue.kEnterNameStudent}";
    }
    if (pathImage == null) {
      requiredData += ", ${ConstValue.kSelectImageStudent}";
    }
    if (selectedEducationalStage == null) {
      requiredData += ", ${ConstValue.kSelectEducationStage}";
    }
    if (selectedGroupDetails == null) {
      requiredData += ", ${ConstValue.kSelectGroups}";
    }
    return requiredData;
  }

  void showAlertForRequiredData(String requiredData) {
    if (requiredData.trim().startsWith(",")) {
      requiredData.replaceFirst(",", "");
    }
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
      requiredData,
      style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          fontFamily: FontName.geDinerOne),
    )));
  }

  Future<void> insertNewStudent() async {
    StudentOperation studentOperation = StudentOperation();
    int studentId = await studentOperation.insertNewStudent(StudentModel(
        id: 0,
        name: controllerStudentName.text.trim(),
        image: pathImage!,
        idGroup: selectedGroupDetails!.id,
        note: controllerStudentNote.text.trim(),
        createdAt: 'createdAt'));
    //   print(studentId);
    if (studentId > 0) {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            ConstValue.kAddedNewStudentSucces,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                fontFamily: FontName.geDinerOne),
          ),
        ),
      );
    }
  }

  void fillDataStudentModel() {
    controllerStudentName.text = studentModel!.name;
    controllerStudentNote.text = studentModel!.note;
    pathImage = studentModel!.image;
    inputPathImage.add(pathImage);
    //? fill select education
    selectedEducationalStage = listItemStageModel
        .where((element) => element.id == studentModel!.idEducationStage)
        .toList()[0];
    _controllerInitiaItemSelectedStage.add(selectedEducationalStage!);
    //? fill select group
    onChangedSelectEducationStageName(selectedEducationalStage);
  }

  Future<void> editAll() async {
    String requiredData = checkRequiredData();

    if (requiredData.trim().isEmpty) {
      // now edit to data base
      await editIntoStudentInfo();
    } else {
      //? show alert
      showAlertForRequiredData(requiredData);
    }
  }

  Future<void> editIntoStudentInfo() async {
    StudentOperation studentOperation = StudentOperation();
    bool updated = await studentOperation.editStudentData(StudentModel(
      id: studentModel!.id,
      name: controllerStudentName.text.trim(),
      image: pathImage!,
      idGroup: selectedGroupDetails!.id,
      note: controllerStudentNote.text.trim(),
    ));
    if (updated == true) {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            ConstValue.kUpdateThisStudentSucces,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                fontFamily: FontName.geDinerOne),
          ),
        ),
      );
    }
  }
}
