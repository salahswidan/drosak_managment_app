import 'dart:async';
import 'package:drosak_managment_app/core/database/sqlflite/audience_operation.dart';
import 'package:drosak_managment_app/core/resources/const_value.dart';
import 'package:drosak_managment_app/model/audience/audience_model.dart';
import 'package:drosak_managment_app/model/education_stage/item_stage_model.dart';
import 'package:drosak_managment_app/model/student/student_model.dart';
import 'package:flutter/material.dart';
import '../../core/database/sqlflite/education_stage_operation.dart';
import '../../core/database/sqlflite/groups_operation.dart';
import '../../model/group/group_details.dart';
import '../../view/audience/screens/widgets/custom_add_new_audience_screen.dart';

class AudienceController {
  BuildContext context;
  Map<String, bool?> mapSelectedStudent = {};
  ItemStageModel? selectedEducationalStage;
  GroupDetails? selectedGroupDetails;
  DateTime? selectData;

  late StreamController<ItemStageModel> _controllerInitiaItemSelectedStage;
  late Sink<ItemStageModel> _inPutDataInitiaItemSelectedStage;
  late Stream<ItemStageModel> outPutDataInitiaItemSelectedStage;

  late StreamController<List<AudienceModel>> _controllerInitiaIAudienceModel;
  late Sink<List<AudienceModel>> _inPutDataInitiaIAudienceModel;
  late Stream<List<AudienceModel>> outPutDataInitiaIAudienceModel;

  late StreamController<Map<String, bool?>> _controllerInitiaMapSelectedStudent;
  late Sink<Map<String, bool?>> _inPutDataInitialMapSelectedStudent;
  late Stream<Map<String, bool?>> _outPutDataInitialMapSelectedStudent;

  late StreamController<List<ItemStageModel>> _controllerListItemStageModel;
  late Sink<List<ItemStageModel>> _inputDataListItemStageModel;
  late Stream<List<ItemStageModel>> outPutDataListItemStageModel;

  late StreamController<List<GroupDetails>> _controllerListItemGroupDetails;
  late Sink<List<GroupDetails>> _inputDataListItemGroupDetails;
  late Stream<List<GroupDetails>> outPutDataListItemGroupDetails;

  late StreamController<GroupDetails?> _controllerInitiaItemSelectedGroup;
  late Sink<GroupDetails?> _inPutDataInitiaItemSelectedGroup;
  late Stream<GroupDetails?> outPutDataInitiaItemSelectedGroup;

  List<ItemStageModel> listItemStageModel = [];
  List<StudentModel> liststudentModel = [];

  AudienceController(this.context) {
    start();
  }

  void start() async {
    await initControllers();
    await initAllData();
  }

  Future<void> initAllData() async {
    await getAllItemStageModelList();
  }

  Future<void> getAllItemStageModelList() async {
    EducationStageOperation educationStageOperation = EducationStageOperation();
    listItemStageModel = await educationStageOperation.getAllEducationData();
    _inputDataListItemStageModel.add(listItemStageModel);
  }

  Future<void> getGroupsByEducationStageName() async {
    GroupsOperation groupsOperation = GroupsOperation();
    List<GroupDetails> listGroup =
        await groupsOperation.getGroupInnerJoinEducationStage(
            educationID: selectedEducationalStage!.id);

    selectedGroupDetails = null;
    _inPutDataInitiaItemSelectedGroup.add(selectedGroupDetails);
    _inputDataListItemGroupDetails.add(listGroup);
    if (listGroup.isNotEmpty) {
      selectedGroupDetails = listGroup[0];
      _inPutDataInitiaItemSelectedGroup.add(selectedGroupDetails);
    }
  }

  Future<void> initControllers() async {
    _controllerListItemStageModel = StreamController();
    _inputDataListItemStageModel = _controllerListItemStageModel.sink;
    outPutDataListItemStageModel =
        _controllerListItemStageModel.stream.asBroadcastStream();

    _controllerInitiaItemSelectedStage = StreamController();
    _inPutDataInitiaItemSelectedStage = _controllerInitiaItemSelectedStage.sink;
    outPutDataInitiaItemSelectedStage =
        _controllerInitiaItemSelectedStage.stream.asBroadcastStream();

    _controllerListItemGroupDetails = StreamController();
    _inputDataListItemGroupDetails = _controllerListItemGroupDetails.sink;
    outPutDataListItemGroupDetails =
        _controllerListItemGroupDetails.stream.asBroadcastStream();

    //  init stram of initial selected group stage
    _controllerInitiaItemSelectedGroup = StreamController();
    _inPutDataInitiaItemSelectedGroup = _controllerInitiaItemSelectedGroup.sink;
    outPutDataInitiaItemSelectedGroup =
        _controllerInitiaItemSelectedGroup.stream.asBroadcastStream();

    _controllerInitiaMapSelectedStudent = StreamController();
    _inPutDataInitialMapSelectedStudent =
        _controllerInitiaMapSelectedStudent.sink;
    _outPutDataInitialMapSelectedStudent =
        _controllerInitiaMapSelectedStudent.stream.asBroadcastStream();

    _controllerInitiaIAudienceModel = StreamController();
    _inPutDataInitiaIAudienceModel = _controllerInitiaIAudienceModel.sink;
    outPutDataInitiaIAudienceModel =
        _controllerInitiaIAudienceModel.stream.asBroadcastStream();
  }

  Future<void> disposeControllers() async {
    _controllerListItemStageModel.close();
    _inputDataListItemStageModel.close();

    _controllerInitiaItemSelectedStage.close();
    _inPutDataInitiaItemSelectedStage.close();

    _controllerListItemGroupDetails.close();
    _inputDataListItemGroupDetails.close();

    _controllerInitiaItemSelectedGroup.close();
    _inPutDataInitiaItemSelectedGroup.close();

    _inPutDataInitialMapSelectedStudent.close();
    _controllerInitiaMapSelectedStudent.close();

    _inPutDataInitiaIAudienceModel.close();
    _controllerInitiaIAudienceModel.close();
  }

  void onChangedSelectEducationStageName(ItemStageModel? p1) async {
    selectedEducationalStage = p1;
    if (selectedEducationalStage != null) {
      await getGroupsByEducationStageName();
    }
  }

  Future<void> getAudienceDatail() async {
    AudienceOperation audienceOperation = AudienceOperation();
    List<AudienceModel> data =
        await audienceOperation.getAudienceData(selectedGroupDetails!.id);
    _inPutDataInitiaIAudienceModel.add(data);
  }

  onChangedSelectGroupName(GroupDetails? p1) async {
    selectedGroupDetails = p1;
    if (selectedGroupDetails != null) {
      await getStudentsInfo();
      await getAudienceDatail();
    }
  }

  Future<void> getStudentsInfo() async {
    AudienceOperation audienceOperation = AudienceOperation();
    liststudentModel = await audienceOperation
        .getStudentInfoByGroupID(selectedGroupDetails!.id);
  }

  void onPressedAdd() async {
    if (selectedEducationalStage == null) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(ConstValue.kSelectEducationStage)));
    } else if (selectedGroupDetails == null) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(ConstValue.kSelectGroups)));
    } else {
      mapSelectedStudent = {};
      showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) => CustomAddNewAudienceScreen(
                onPressedSelectedDataTime: onPressedSelectedDataTime,
                outputMapSelectedStudent: _outPutDataInitialMapSelectedStudent,
                listStudentModel: liststudentModel,
                onPressedAdd: onPressedAddToDataBase,
                onChangedSelectedStatus: changeSelectedStudentStatus,
              ));
    }
  }

  void changeSelectedStudentStatus({required int id, required bool status}) {
    mapSelectedStudent[id.toString()] = status;
    _inPutDataInitialMapSelectedStudent.add(mapSelectedStudent);
  }

  void onPressedSelectedDataTime() async {
    selectData = await showDatePicker(
        context: context,
        lastDate: DateTime.now(),
        firstDate: DateTime.now().subtract(Duration(days: 365)));
  }

  void onPressedAddToDataBase() async {
    await insertIntoDataBase();
    Navigator.of(context).pop();
    await getAudienceDatail();
  }

  Future<void> insertIntoDataBase() async {
    List<MapEntry<String, bool?>> data = mapSelectedStudent.entries
        .where((element) => element.value == true)
        .toList();
    selectData ??= DateTime.now();
    for (int i = 0; i < data.length; i++) {
      AudienceOperation audienceOperation = AudienceOperation();
      await audienceOperation.insertNewAudience(AudienceModel(
          status: data[i].value.toString(),
          studentID: int.parse(data[i].key),
          selectedTimeData: selectData.toString()));
    }
  }
}
