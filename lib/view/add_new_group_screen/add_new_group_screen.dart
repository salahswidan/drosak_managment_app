import 'package:drosak_managment_app/core/resources/colors_manager.dart';
import 'package:drosak_managment_app/core/resources/const_value.dart';
import 'package:flutter/material.dart';

import '../../controller/add_new_group/add_new_group_controller.dart';
import '../../core/resources/font_manager.dart';
import 'widgets/custom_app_bar_add_new_group_screen.dart';

class AddNewGroupScreen extends StatefulWidget {
  const AddNewGroupScreen({super.key});

  @override
  State<AddNewGroupScreen> createState() => _AddNewGroupScreenState();
}

class _AddNewGroupScreenState extends State<AddNewGroupScreen> {
  late AddNewGroupController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AddNewGroupController();
  }

  @override
  Widget build(BuildContext context) {
    _controller.getArgumentFromLastScreen(context);
    return Scaffold(
      appBar: CustomAppBarAddNewGroupScreen(
          textAddOrEdit: _controller.status == ConstValue.kAddNewGroup
              ? ConstValue.kAdd
              : ConstValue.kEdit,
          title: _controller.status,
          onPressed: () {}),
    );
  }
}
