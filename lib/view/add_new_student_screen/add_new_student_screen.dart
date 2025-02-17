import 'package:flutter/material.dart';
import '../../controller/add_new_students/add_new_students_controller.dart';
import '../../core/resources/const_value.dart';
import 'widgets/custom_app_bar_add_new_student_screen.dart';
import 'widgets/custom_body_add_new_student_screen.dart';

class AddNewStudentScreen extends StatefulWidget {
  const AddNewStudentScreen({super.key});

  @override
  State<AddNewStudentScreen> createState() => _AddNewStudentScreenState();
}

class _AddNewStudentScreenState extends State<AddNewStudentScreen> {
  late AddNewStudentScreenController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AddNewStudentScreenController(context);
  }

  @override
  Widget build(BuildContext context) {
    _controller.getArgumentFromLastScreen(context);
    return Scaffold(
      appBar: CustomAppBarAddNewStudentScreen(
          textAddOrEdit: _controller.status == ConstValue.kAddNewStudent
              ? ConstValue.kSaveAll
              : ConstValue.kEdit,
          title: _controller.status,
          onPressed: () {
            _controller.onPressedAtEditOrSave();
          }),
      body: CustomBodyAddNewStudentScreen(
        controller: _controller,
      ),
    );
  }
}
