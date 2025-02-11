import 'dart:async';
import 'package:drosak_managment_app/core/resources/const_value.dart';
import 'package:drosak_managment_app/model/group/appointment_model.dart';
import 'package:drosak_managment_app/model/group/group_details.dart';
import 'package:drosak_managment_app/model/group/group_info_model.dart';
import 'package:flutter/material.dart';
import '../../core/database/sqlflite/groups_operation.dart';
import '../../core/resources/route_manager.dart';

class GroupsScreenController {
  late StreamController<List<GroupInfoModel>> controllerListItemsGroupModel;
  late Sink<List<GroupInfoModel>> inputDataListItemsGroupModel;
  late Stream<List<GroupInfoModel>> outPutDataListItemsGroupModel;
  List<GroupInfoModel> listGroupInfo = [];
  GroupsScreenController() {
    start();
  }
  void start() async {
    await initControllers();
    await getAllData();
  }

  Future<void> getAllData() async {
    GroupsOperation groupsOperation = GroupsOperation();
    listGroupInfo = await groupsOperation.getAllGroupsInfo();
    initAllData();
  }

  void initAllData() {
    inputDataListItemsGroupModel.add(listGroupInfo);
  }

  Future<void> initControllers() async {
    controllerListItemsGroupModel = StreamController();
    inputDataListItemsGroupModel = controllerListItemsGroupModel.sink;
    outPutDataListItemsGroupModel =
        controllerListItemsGroupModel.stream.asBroadcastStream();
  }

  Future<void> disposeControllers() async {
    controllerListItemsGroupModel.close();
    inputDataListItemsGroupModel.close();
  }

  void addNewGroup({required BuildContext context})  {
   Navigator.of(context)
        .pushNamed(RoutesName.kAddGroupScreen,
            arguments: ConstValue.kAddNewGroup)
        .then((value) => getAllData());
  }

  Future<List<GroupDetails>> getGroupsDetailsFromDataBase() async {
    GroupsOperation groupsOperation = GroupsOperation();
    return groupsOperation.getAllGroupsData();
  }

  Future<List<AppointmentModel>> getAppointmentsDetailsFromDataBase() async {
    GroupsOperation groupsOperation = GroupsOperation();
    return groupsOperation.getAllAppointmentsData();
  }

  //Stream<List<ItemStageModel>> outPutDataListItemsStageModel;
}
