import 'dart:async';

import 'package:drosak_managment_app/core/resources/const_value.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../core/resources/route_manager.dart';
import '../../model/education_stage/item_stage_model.dart';

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

  //Stream<List<ItemStageModel>> outPutDataListItemsStageModel;
}
