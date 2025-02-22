import 'dart:async';

import 'package:drosak_managment_app/model/education_stage/item_stage_model.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../model/group/group_details.dart';

class AudienceController {
  BuildContext context;
  ItemStageModel? selectedEducationalStage;
  GroupDetails? selectedGroupDetails;

  late StreamController<ItemStageModel> _controllerInitiaItemSelectedStage;
  late Sink<ItemStageModel> _inPutDataInitiaItemSelectedStage;
  late Stream<ItemStageModel> outPutDataInitiaItemSelectedStage;

  late StreamController<List<ItemStageModel>> _controllerListItemStageModel;
  late Sink<List<ItemStageModel>> _inputDataListItemStageModel;
  late Stream<List<ItemStageModel>> outPutDataListItemStageModel;

  late StreamController<List<GroupDetails>> _controllerListItemGroupDetails;
  late Sink<List<GroupDetails>> _inputDataListItemGroupDetails;
  late Stream<List<GroupDetails>> outPutDataListItemGroupDetails;

  late StreamController<GroupDetails?> _controllerInitiaItemSelectedGroup;
  late Sink<GroupDetails?> _inPutDataInitiaItemSelectedGroup;
  late Stream<GroupDetails?> outPutDataInitiaItemSelectedGroup;

  AudienceController(this.context) {
    start();
  }

  void start() async {
    await initControllers();
    await initAllData();
  }

  Future<void> initAllData() async {
    _inputDataListItemStageModel.add([]);
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
  }

  void onChangedSelectEducationStageName(ItemStageModel? p1) {
    selectedEducationalStage = p1;
    // if (selectedEducationalStage != null) getGroupsByEducationStageName();
  }
   onChangedSelectGroupName(GroupDetails? p1) {
    selectedGroupDetails = p1;
    //if (selectedGroupDetails != null) getAppintmentGroupByGroupName();
  }
}
