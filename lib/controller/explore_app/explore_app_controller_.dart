import 'package:flutter/material.dart';
import '../../core/resources/route_manager.dart';

class ExploreAppController {
  void goToMainScreen({required String nameSection,required BuildContext context}) {
    Navigator.of(context).pushNamed(RouteNames.kMainScreen,);
  }
}