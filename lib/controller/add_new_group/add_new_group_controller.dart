import 'dart:async';
import 'package:drosak_managment_app/model/group/group_info_model.dart';
import 'package:flutter/material.dart';
import '../../core/database/sqlflite/education_stage_operation.dart';
import '../../core/database/sqlflite/groups_operation.dart';
import '../../core/resources/const_value.dart';
import '../../model/education_stage/item_stage_model.dart';
import '../../model/group/group_details.dart';
import '../../model/group/appointment_model.dart';

class AddNewGroupScreenController {
  String status = ConstValue.kAddNewGroup;
  String? selectedDay;
  ItemStageModel? selectedEducationalStage;
  TimeOfDay? selectedTime;
  GroupInfoModel? _groupInfoModel;

  TextEditingController controllerGroupDesc = TextEditingController();
  TextEditingController controllerGroupName = TextEditingController();
  GlobalKey<FormState> formStateGroupDetails = GlobalKey<FormState>();
  late StreamController<List<ItemStageModel>> controllerListItemStageModel;
  late Sink<List<ItemStageModel>> inputDataListItemStageModel;
  late Stream<List<ItemStageModel>> outPutDataListItemStageModel;
  List<ItemStageModel> listItemStageModel = [];

  late StreamController<String> controllerMSValue;
  late Sink<String> inPutDataMSValue;
  late Stream<String> outPutDataMSValue;

  late StreamController<String> controllerSelectedTime;
  late Sink<String> inPutDataSelectedTime;
  late Stream<String> outPutDataSelectedTime;

  late StreamController<List<AppointmentModel>> controllerListTimeDayGroupModel;
  late Sink<List<AppointmentModel>> inPutDataListTimeDayGroupModel;
  late Stream<List<AppointmentModel>> outPutDataListTimeDayGroupModel;

  late StreamController<ItemStageModel> controllerInitiaItem;
  late Sink<ItemStageModel> inPutDataInitiaItem;
  late Stream<ItemStageModel> outPutDataInitiaItem;

  BuildContext context;
  AddNewGroupScreenController(this.context) {
    start();
  }

  void start() async {
    await initControllers();
    initAllData();
  }

  Future<void> initControllers() async {
    controllerListItemStageModel = StreamController();
    inputDataListItemStageModel = controllerListItemStageModel.sink;
    outPutDataListItemStageModel =
        controllerListItemStageModel.stream.asBroadcastStream();

    controllerMSValue = StreamController();
    inPutDataMSValue = controllerMSValue.sink;
    outPutDataMSValue = controllerMSValue.stream.asBroadcastStream();

    controllerSelectedTime = StreamController();
    inPutDataSelectedTime = controllerSelectedTime.sink;
    outPutDataSelectedTime = controllerSelectedTime.stream.asBroadcastStream();

    controllerListTimeDayGroupModel = StreamController();
    inPutDataListTimeDayGroupModel = controllerListTimeDayGroupModel.sink;
    outPutDataListTimeDayGroupModel =
        controllerListTimeDayGroupModel.stream.asBroadcastStream();

    controllerInitiaItem = StreamController();
    inPutDataInitiaItem = controllerInitiaItem.sink;
    outPutDataInitiaItem = controllerInitiaItem.stream.asBroadcastStream();
  }

  void initAllData() async {
    await getAllItemStageModelList();
    addNewValueMs();
    addNewValueOfSelectedTime();
    changeStatusOfStreamTimeDay();
    if (_groupInfoModel != null) {
      fillDataInEditStatus();
    }
  }

  void addNewValueMs() {
    inPutDataMSValue.add(groupValueMS);
  }

  void changeStatusOfStreamTimeDay() {
    inPutDataListTimeDayGroupModel.add(listAppointmentGroupModel);
  }

  void addNewValueOfSelectedTime() {
    if (selectedTime != null) {
      inPutDataSelectedTime
          .add("${selectedTime!.minute} : ${selectedTime!.hour}");
    }
  }

  Future<void> getAllItemStageModelList() async {
    EducationStageOperation educationStageOperation = EducationStageOperation();
    listItemStageModel = await educationStageOperation.getAllEducationData();
    inputDataListItemStageModel.add(listItemStageModel);
  }

  List<AppointmentModel> listAppointmentGroupModel = [];

  String groupValueMS = ConstValue.kAM;

  var outPutSelectedMSStream;

  void getArgumentFromLastScreen(BuildContext context) {
    var arg = ModalRoute.of(context);
    if (arg != null) {
      var arguments = arg.settings.arguments;
      if (arguments is Map) {
        // now in status edit
        argumentsInEditStatus(arguments);
      } else {
        // now in status add
      }
    }
  }

  void argumentsInEditStatus(Map arguments) {
    //? check if was map or not
    if (arguments.containsKey(ConstValue.kStatus)) {
      status = arguments[ConstValue.kStatus];
    }
    //? check if has kGroupInfoModel
    if (arguments.containsKey(ConstValue.kGroupInfoModel)) {
      if (arguments[ConstValue.kGroupInfoModel] is GroupInfoModel) {
        _groupInfoModel = arguments[ConstValue.kGroupInfoModel];
      }
    }
  }

  void fillDataInEditStatus() {
    //? fill name
    controllerGroupName.text = _groupInfoModel!.groupDetails.name;
    //? fill desc
    controllerGroupDesc.text = _groupInfoModel!.groupDetails.desc;
    //? fill listAppointmentGroupModel
    listAppointmentGroupModel += _groupInfoModel!.listAppointment;
    //? sand to input stream
    inPutDataListTimeDayGroupModel.add(listAppointmentGroupModel);
    //? fill stage name
    int stageID = _groupInfoModel!.groupDetails.educationStageID;
    List<ItemStageModel> listFound =
        listItemStageModel.where((element) => element.id == stageID).toList();
    if (listFound.isNotEmpty) {
      selectedEducationalStage = listFound[0];
      inPutDataInitiaItem.add(selectedEducationalStage!);
    }
  }

  onChangedSelectEducationStageName(ItemStageModel? p1) {
    selectedEducationalStage = p1;
  }

  void _closeKeyboard() {
    FocusScope.of(context).unfocus(); // to hide keyboard
  }

  void onPressedSelectTime(BuildContext context) async {
    {
      _closeKeyboard();
      TimeOfDay? time = await showTimePicker(
          barrierDismissible: false,
          cancelText: ConstValue.kCancel,
          confirmText: ConstValue.kChoose,
          helpText: ConstValue.kChooseTime,
          context: context,
          initialTime: TimeOfDay(hour: 1, minute: 20));
      if (time != null) {
        selectedTime = time;
        addNewValueOfSelectedTime();
      }
    }
  }

  onChangedSelectDay(String? day) {
    selectedDay = day;
  }

  void onPressedAddTimeAndDayToTable(BuildContext context) {
    String requiredData = '';
    if (selectedDay == null) requiredData = ConstValue.kChooseDay;
    if (selectedTime == null) requiredData += " ,  ${ConstValue.kChooseTime}";
    if (requiredData.isEmpty) {
      //  print('now you can add new table');
      addTimeAndDayToTable();
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(requiredData)));
    }
  }

  void onChangedMSValue(String? value) {
    if (value != null) groupValueMS = value;
    addNewValueMs();
  }

  Future<void> disposeControllers() async {
    controllerListItemStageModel.close();
    inputDataListItemStageModel.close();
    controllerMSValue.close();
    inPutDataMSValue.close();
    controllerSelectedTime.close();
    inPutDataSelectedTime.close();
    inPutDataListTimeDayGroupModel.close();
    controllerListTimeDayGroupModel.close();
  }

  void addTimeAndDayToTable() {
    _closeKeyboard();

    listAppointmentGroupModel.add(AppointmentModel(
      ms: groupValueMS,
      day: selectedDay!,
      time: "${selectedTime!.minute} : ${selectedTime!.hour}",
    ));
    changeStatusOfStreamTimeDay();
  }

  void onPressedDeleteAppointment(int index) {
    listAppointmentGroupModel.removeAt(index);
    changeStatusOfStreamTimeDay();
    print(_groupInfoModel!.listAppointment);
  }

  String checkAllDataValidated() {
    String requiredData = '';
    if (controllerGroupName.text.trim().isEmpty) {
      requiredData += ConstValue.kAddNameOfGroup;
    }
    if (selectedEducationalStage == null) {
      requiredData += " , ${ConstValue.kChooseEducationStage}";
    }
    if (listAppointmentGroupModel.isEmpty) {
      requiredData += " , ${ConstValue.kAddSomeAppointment}";
    }
    return requiredData;
  }

  void saveAllData(BuildContext context) async {
    String requiredData = checkAllDataValidated();
    if (requiredData.isEmpty) {
      int groupId = await addDetailsOfGroups();
      if (groupId > 0) {
        if (await addDetailsOfAppointments(groupId)) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(ConstValue.kAddedGroupDetailsSucces)));
          backToMainScreen(context);
        }
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(requiredData)));
    }
  }

  Future<bool> addDetailsOfAppointments(int groupId) async {
    bool inserted = false;
    for (var appointmentItem in listAppointmentGroupModel) {
      GroupsOperation groupsOperation = GroupsOperation();

      inserted = await groupsOperation.insertAppointmentDetails(
          appointmentItem, groupId);
    }
    return inserted;
  }

  Future<int> addDetailsOfGroups() async {
    GroupsOperation groupsOperation = GroupsOperation();
    return groupsOperation.insertGroupDetails(GroupDetails(
      name: controllerGroupName.text.trim(),
      desc: controllerGroupDesc.text.trim(),
      educationStageID: selectedEducationalStage!.id,
    ));
  }

  void backToMainScreen(BuildContext context) {
    Navigator.of(context).pop();
    // Navigator.of(context)
    //     .pushNamed(RoutesName.kMainScreen, arguments: ConstValue.kAddNewGroup);
  }

  void onPressedAtEditOrSave() async {
    if (status == ConstValue.kEditThisGroup) {
      bool updated = await editIntoGroupInfo();
      if (updated == true) {
        {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(ConstValue.kAddedGroupDetailsSucces)));
          backToMainScreen(context);
        }
      }
      //   Navigator.of(context).pop();
    } else {
      saveAllData(context);
    }
  }

  Future<bool> editIntoGroupInfo() async {
    String requiredData = checkAllDataValidated();
    if (requiredData.isEmpty) {
      GroupsOperation groupsOperation = GroupsOperation();
      return groupsOperation.editEducationStage(
          GroupInfoModel(
              groupDetails: GroupDetails(
                  id: _groupInfoModel!.groupDetails.id,
                  name: controllerGroupName.text,
                  desc: controllerGroupDesc.text,
                  educationStageID: selectedEducationalStage!.id),
              listAppointment: listAppointmentGroupModel),
          _groupInfoModel!.listAppointment);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(requiredData)));
      return false;
    }
  }
}
