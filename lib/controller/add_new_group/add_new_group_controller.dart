import 'package:drosak_managment_app/core/resources/const_value.dart';
import 'package:drosak_managment_app/model/education_stage/item_stage_model.dart';
import 'package:flutter/material.dart';

class AddNewGroupScreenController {
  String status = ConstValue.kAddNewGroup;
  TextEditingController controllerGroupName = TextEditingController();
  TextEditingController controllerGroupDesc = TextEditingController();
  GlobalKey<FormState> formStateGroupDetails = GlobalKey<FormState>();

  List<ItemStageModel> listItemsStageModel = [];

  void getArgumentFromLastScreen(BuildContext context) {
    var arg = ModalRoute.of(context);
    if (arg != null) {
      String arguments = arg.settings.arguments.toString();
      status = arguments;
    }
  }

  onChangeSelectEducationStageName(ItemStageModel? p1) {}
}
