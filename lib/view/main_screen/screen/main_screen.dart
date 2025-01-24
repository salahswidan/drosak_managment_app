import 'package:drosak_managment_app/core/resources/assets_values_manager.dart';
import 'package:drosak_managment_app/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../controller/main_screen/main_screen_controller.dart';
import '../../../model/main_screen/bottom_nav_bar_tab_model.dart';
import 'widgets/custom_bottom_nav_bar_main_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late MainScreenController _controller;
  @override
  @override
  void initState() {
    super.initState();
    _controller = MainScreenController();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      bottomNavigationBar: CustomBottonNavBarMainScreen(
        listIcon: _controller.listBottomNavBarTabModel,
      ),
    );
  }
}