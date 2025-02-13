import 'dart:async';
import 'package:drosak_managment_app/core/resources/const_value.dart';
import 'package:drosak_managment_app/model/group/appointment_model.dart';
import 'package:drosak_managment_app/model/group/group_details.dart';
import 'package:drosak_managment_app/model/group/group_info_model.dart';
import 'package:flutter/material.dart';
import '../../core/database/sqlflite/groups_operation.dart';
import '../../core/resources/route_manager.dart';

class GroupsScreenController {
  late StreamController<List<GroupInfoModel>> controllerListItemGroupModel;
  late Sink<List<GroupInfoModel>> inputDataListItemGroupModel;
  late Stream<List<GroupInfoModel>> outPutDataListItemGroupModel;
  List<GroupInfoModel> listGroupInfo = [];
  BuildContext context;

  GroupsScreenController(this.context) {
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
    inputDataListItemGroupModel.add(listGroupInfo);
  }

  Future<void> initControllers() async {
    controllerListItemGroupModel = StreamController();
    inputDataListItemGroupModel = controllerListItemGroupModel.sink;
    outPutDataListItemGroupModel =
        controllerListItemGroupModel.stream.asBroadcastStream();
  }

  Future<void> disposeControllers() async {
    controllerListItemGroupModel.close();
    inputDataListItemGroupModel.close();
  }

  void addNewGroups({required BuildContext context}) {
    Navigator.of(context)
        .pushNamed(RoutesName.kAddGroupScreen,
            arguments: ConstValue.kAddNewGroup)
        .then((value) => getAllData());
  }

  void onRefresh() {
    listGroupInfo.clear();
    inputDataListItemGroupModel.add(listGroupInfo);
    getAllData();
  }

// Stream<List<ItemStageModel>> outPutDataListItemStageModel;

  void deleteGroupInfo(GroupInfoModel groupInfoModel) async {
    bool? confirmDelete = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(ConstValue.kAreYouSureToDeleteItem),
        actions: [
          TextButton(
              onPressed: () async {
                GroupsOperation groupOperation = GroupsOperation();
                bool deleted = await groupOperation.startDelete(groupInfoModel);
                if (deleted) {
                  Navigator.of(context).pop(false);

                  onRefresh();
                }
              },
              child: const Text(ConstValue.kSure)),
          TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text(ConstValue.kNo)),
        ],
      ),
    );
  }

  void editGroupInfo(GroupInfoModel groupInfoModel) {
    //?انت اللي كاتب ان لما اضغط علي تعديل يروح لصفحه تانيه
    Navigator.of(context).pushNamed(RoutesName.kAddGroupScreen, arguments: {
      ConstValue.kStatus: ConstValue.kEditThisGroup,
      ConstValue.kGroupInfoModel: groupInfoModel,
    }).then((value) => getAllData());
  }
}
