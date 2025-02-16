import 'dart:async';
import 'package:drosak_managment_app/model/group/appointment_model.dart';
import 'package:flutter/material.dart';
import '../../model/group/group_details.dart';
import '../../model/group/group_info_model.dart';

class StudentController {
  late StreamController<List<GroupInfoModel>> controllerListItemStudentModel;
  late Sink<List<GroupInfoModel>> inputDataListItemStudentModel;
  late Stream<List<GroupInfoModel>> outPutDataListItemStudentModel;
  BuildContext context;
  StudentController(this.context) {
    start();
  }
  void start() async {
    await initControllers();
    await getAllData();
  }

  void initAllData() {
    inputDataListItemStudentModel.add([
      GroupInfoModel(
          groupDetails: GroupDetails(
              name: "Group 1", desc: "Description 1", educationStageID: 1),
          listAppointment: [
            AppointmentModel(time: "time", day: "day", ms: "ms")
          ]),
      GroupInfoModel(
          groupDetails: GroupDetails(
              name: "Group 1", desc: "Description 1", educationStageID: 1),
          listAppointment: [
            AppointmentModel(time: "time", day: "day", ms: "ms")
          ]),
      GroupInfoModel(
          groupDetails: GroupDetails(
              name: "Group 1", desc: "Description 1", educationStageID: 1),
          listAppointment: [
            AppointmentModel(time: "time", day: "day", ms: "ms")
          ]),
      GroupInfoModel(
          groupDetails: GroupDetails(
              name: "Group 1", desc: "Description 1", educationStageID: 1),
          listAppointment: [
            AppointmentModel(time: "time", day: "day", ms: "ms")
          ]),
    ]);
  }

  Future<void> getAllData() async {
    // GroupsOperation groupsOperation = GroupsOperation();
    // listGroupInfo = await groupsOperation.getAllGroupsInfo();
    initAllData();
  }

  Future<void> initControllers() async {
    controllerListItemStudentModel = StreamController();
    inputDataListItemStudentModel = controllerListItemStudentModel.sink;
    outPutDataListItemStudentModel =
        controllerListItemStudentModel.stream.asBroadcastStream();
  }

  Future<void> disposeControllers() async {
    controllerListItemStudentModel.close();
    inputDataListItemStudentModel.close();
  }
}
