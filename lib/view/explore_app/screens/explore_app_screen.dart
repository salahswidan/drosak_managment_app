import 'package:drosak_managment_app/controller/explore_app/explore_app_controller_.dart';
import 'package:drosak_managment_app/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';

import '../../../core/resources/route_manager.dart';
import '../widget/body_explore_screen.dart';
import '../widget/custom_app_bar_explore_screen.dart';

class ExploreAppScreen extends StatefulWidget {
  const ExploreAppScreen({super.key});

  @override
  State<ExploreAppScreen> createState() => _ExploreAppScreenState();
}

class _ExploreAppScreenState extends State<ExploreAppScreen> {
  late ExploreAppController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = ExploreAppController();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: ColorsManager.kBlackColor,
        appBar: CustomAppBarExploreScreen(),
        body: BodyExploreScreen(
          onTap: (index) {
            controller.goToMainScreen(value: index, context: context);
          },
        ),
      ),
    );
  }
}
