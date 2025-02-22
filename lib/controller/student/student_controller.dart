import 'dart:async';
import 'dart:developer';
import 'package:drosak_managment_app/core/database/sqlflite/student_operation.dart';
import 'package:drosak_managment_app/model/group/appointment_model.dart';
import 'package:drosak_managment_app/model/student/student_model.dart';
import 'package:flutter/material.dart';
import '../../core/resources/const_value.dart';
import '../../core/resources/route_manager.dart';
import '../../model/group/group_details.dart';
import '../../model/group/group_info_model.dart';

class StudentController {
  late StreamController<List<StudentModel>> controllerListItemStudentModel;
  late Sink<List<StudentModel>> inputDataListItemStudentModel;
  late Stream<List<StudentModel>> outPutDataListItemStudentModel;
  BuildContext context;
  StudentController(this.context) {
    start();
  }
  void start() async {
    await initControllers();
    await getAllData();
  }

  Future<void> getAllData() async {
    StudentOperation studentOperation = StudentOperation();
    List<StudentModel> listStudentModel =
        await studentOperation.getStudentsInfo();
    inputDataListItemStudentModel.add(listStudentModel);
  }

  Future<void> initControllers() async {
    controllerListItemStudentModel = StreamController();
    inputDataListItemStudentModel = controllerListItemStudentModel.sink;
    outPutDataListItemStudentModel =
        controllerListItemStudentModel.stream.asBroadcastStream();
  }

  Future<void> disposeControllers() async {
    controllerListItemStudentModel.close();
    inputDataListItemStudentModel.close();
  }

  void addNewStudents({required BuildContext context}) {
    Navigator.of(context)
        .pushNamed(RoutesName.kAddNewStudentsScreen,
            arguments: ConstValue.kAddNewStudent)
        .then((value) => getAllData());
  }

  //! the delete worked well here
  void onTapDelete(StudentModel studentModel) async {
    StudentOperation studentOperation = StudentOperation();
    bool deleted = await studentOperation.deleteStudent(studentModel.id!);
    if (deleted == true) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar;
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(ConstValue.kDeletedStudentSucces)));
      onTapRefresh();
    }
  }

  void onTapRefresh() {
    inputDataListItemStudentModel.add([]);
    getAllData();
  }

  void onTapEdit(StudentModel studentModel) {
    Navigator.of(context)
        .pushNamed(RoutesName.kAddNewStudentsScreen, arguments: {
      ConstValue.kStatus: ConstValue.kEditThisStudent,
      ConstValue.kStudentModel: studentModel,
    }).then((value) {
      onTapRefresh();
    });
  }
}
