import 'package:drosak_managment_app/core/resources/assets_values_manager.dart';
import 'package:drosak_managment_app/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../controller/main_screen/main_screen_controller.dart';
import '../../../core/resources/const_value.dart';
import '../../../model/main_screen/tabs_details_model.dart';
import 'widgets/custom_bottom_nav_bar_main_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late MainScreenController _controller;
  @override
  void initState() {
    super.initState();
    _controller = MainScreenController();
  }

  @override
  void dispose() {
    _controller.disposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.getArguments(context);
    return Scaffold(
      body: StreamBuilder<int>(
          stream: _controller.outDataBody,
          builder: (context, snapshot) => snapshot.connectionState ==
                  ConnectionState.waiting
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : _controller.listBottomNavBarTabModel[snapshot.data!].screen),
      backgroundColor: Colors.red,
      bottomNavigationBar: CustomBottonNavBarMainScreen(
        outPutBottonNavBar: _controller.outPutBottonNavBar,
        onTap: (value) {
          _controller.onTapAtTabItemBottomNavBar(value);
        },
        listIcon: _controller.listBottomNavBarTabModel,
      ),
    );
  }
}
