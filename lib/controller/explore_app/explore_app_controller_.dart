import 'package:drosak_managment_app/core/resources/const_value.dart';
import 'package:flutter/material.dart';
import '../../core/resources/route_manager.dart';

class ExploreAppController {
  void goToMainScreen({required int value, required BuildContext context}) {
    Navigator.of(context).pushNamed(RoutesName.kMainScreen, arguments: {
      ConstValue.kScreenIndex: value,
    });
  }
}
