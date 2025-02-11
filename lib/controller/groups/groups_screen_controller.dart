import 'dart:async';
import 'package:drosak_managment_app/core/resources/const_value.dart';
import 'package:drosak_managment_app/model/group/appointment_model.dart';
import 'package:drosak_managment_app/model/group/group_details.dart';
import 'package:flutter/material.dart';
import '../../core/database/sqlflite/groups_operation.dart';
import '../../core/resources/route_manager.dart';

class GroupsScreenController {
  late StreamController<List> controllerListItemsGroupModel;
  late Sink<List> inputDataListItemsGroupModel;
  late Stream<List> outPutDataListItemsGroupModel;
  GroupsScreenController() {
    start();
  }
  void start() async {
    await initControllers();
  }

  void initAllData() {
    inputDataListItemsGroupModel.add([]);
  }

  Future<void> initControllers() async {
    controllerListItemsGroupModel = StreamController();
    inputDataListItemsGroupModel = controllerListItemsGroupModel.sink;
    outPutDataListItemsGroupModel = controllerListItemsGroupModel.stream;
  }

  Future<void> disposeControllers() async {
    controllerListItemsGroupModel.close();
    inputDataListItemsGroupModel.close();
  }

  void addNewGroup({required BuildContext context}) {
    Navigator.of(context).pushNamed(RoutesName.kAddGroupScreen,
        arguments: ConstValue.kAddNewGroup);
  }

  Future<List<GroupDetails>> getGroupsDetailsFromDataBase() async {
    GroupsOperation groupsOperation = GroupsOperation();
    return groupsOperation.getAllGroupsData();
  }

  Future getAppointmentsDetailsFromDataBase() async {
    GroupsOperation groupsOperation = GroupsOperation();
    var a = await groupsOperation.getAllAppointmentsData();
    print(a);
  }
  //Stream<List<ItemStageModel>> outPutDataListItemsStageModel;
}
