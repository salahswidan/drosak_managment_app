import 'dart:async';
import 'package:drosak_managment_app/core/database/sqlflite/student_operation.dart';
import 'package:drosak_managment_app/model/group/appointment_model.dart';
import 'package:flutter/material.dart';
import '../../core/resources/const_value.dart';
import '../../core/resources/route_manager.dart';
import '../../model/group/group_details.dart';
import '../../model/group/group_info_model.dart';

class StudentController {
  late StreamController<List<GroupInfoModel>> controllerListItemStudentModel;
  late Sink<List<GroupInfoModel>> inputDataListItemStudentModel;
  late Stream<List<GroupInfoModel>> outPutDataListItemStudentModel;
  BuildContext context;
  StudentController(this.context) {
    start();
  }
  void start() async {
    await initControllers();
    await getAllData();
  }

  void initAllData() {}

  Future<void> getAllData() async {
    StudentOperation studentOperation = StudentOperation();
    var a = await studentOperation.getStudentsInfo();
    print(a);
    // listGroupInfo = await groupsOperation.getAllGroupsInfo();
    initAllData();
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
}
