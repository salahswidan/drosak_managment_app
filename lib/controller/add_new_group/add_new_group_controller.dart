import 'dart:async';
import 'package:flutter/material.dart';
import '../../core/database/sqlflite/education_stage_operation.dart';
import '../../core/resources/const_value.dart';
import '../../model/education_stage/item_stage_model.dart';
import '../../model/group/time_day_group_model.dart';

class AddNewGroupScreenController {
  String status = ConstValue.kAddNewGroup;
  String? selectedDay;
  TimeOfDay? selectedTime;

  TextEditingController controllerGroupDesc = TextEditingController();
  TextEditingController controllerGroupName = TextEditingController();
  GlobalKey<FormState> formStateGroupDetails = GlobalKey<FormState>();
  late StreamController<List<ItemStageModel>> controllerListItemStageModel;
  late Sink<List<ItemStageModel>> inputDataListItemStageModel;
  late Stream<List<ItemStageModel>> outPutDataListItemStageModel;
  List<ItemStageModel> listItemStageModel = [];

  AddNewGroupScreenController() {
    start();
  }

  void start() async {
    await initControllers();
    initAllData();
  }

  Future<void> initControllers() async {
    controllerListItemStageModel = StreamController();
    inputDataListItemStageModel = controllerListItemStageModel.sink;
    outPutDataListItemStageModel = controllerListItemStageModel.stream;
  }

  void initAllData() {
    getAllItemStageModelList();
  }

  void getAllItemStageModelList() async {
    EducationStageOperation educationStageOperation = EducationStageOperation();
    listItemStageModel = await educationStageOperation.getAllEducationData();
    inputDataListItemStageModel.add(listItemStageModel);
  }

  String? timeGroup;

  List<TimeDayGroupModel> listTimeDayGroupModel = [
    TimeDayGroupModel(time: ConstValue.kAM, day: ConstValue.kMonday, ms: "f"),
  ];

  String groupValueMS = ConstValue.kAM;

  void getArgumentFromLastScreen(BuildContext context) {
    var arg = ModalRoute.of(context);
    if (arg != null) {
      String argument = arg.settings.arguments.toString();
      status = argument;
    }
  }

  onChangedSelectEducationStageName(ItemStageModel? p1) {}

  void onPressedSelectTime(BuildContext context) async {
    {
      TimeOfDay? time = await showTimePicker(
          barrierDismissible: false,
          cancelText: ConstValue.kCancel,
          confirmText: ConstValue.kChoose,
          helpText: ConstValue.kChooseTime,
          context: context,
          initialTime: TimeOfDay(hour: 1, minute: 20));
      if (time != null) {
        selectedTime = time;
        print(selectedTime);
      }
    }
  }

  onChangedSelectDay(String? day) {
    selectedDay = day;
  }

  void onPressedAddTimeAndDayToTable() {}

  void onChangedMSValue(String? value) {}

  Future<void> disposeControllers() async {
    controllerListItemStageModel.close();
    inputDataListItemStageModel.close();
  }
}
