import 'package:drosak_managment_app/core/resources/const_value.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../core/resources/route_manager.dart';

class GroupsScreenController {
  void addNewGroup({required BuildContext context}) {
    Navigator.of(context).pushNamed(RoutesName.kAddGroupScreen,
        arguments: ConstValue.kAddNewGroup);
  }

  //Stream<List<ItemStageModel>> outPutDataListItemsStageModel;
}
