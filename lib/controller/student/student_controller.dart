import 'dart:async';
import 'dart:developer';
import 'package:drosak_managment_app/core/database/sqlflite/student_operation.dart';
import 'package:drosak_managment_app/model/group/appointment_model.dart';
import 'package:drosak_managment_app/model/student/student_model.dart';
import 'package:flutter/material.dart';
import '../../core/resources/const_value.dart';
import '../../core/resources/route_manager.dart';
import '../../core/widget/search/custom_search_delgate_education_stage_screen.dart';
import '../../model/group/group_details.dart';
import '../../model/group/group_info_model.dart';
import '../../view/groups/widgets/custom_list_search_group_screen.dart';
import '../../view/students/widget/custom_list_search_group_screen.dart';

class StudentController {
  late StreamController<List<StudentModel>> controllerListItemStudentModel;
  late Sink<List<StudentModel>> inputDataListItemStudentModel;
  late Stream<List<StudentModel>> outPutDataListItemStudentModel;
  BuildContext context;

  bool isSearchNow = false;
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
      if (isSearchNow == true) {
        Navigator.of(context).pop();
      }
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
      if (isSearchNow == true) {
        Navigator.of(context).pop();
      }
      onTapRefresh();
    });
  }

  void onPressedSearch() {
    isSearchNow = true;
    showSearch(
        context: context,
        delegate: CustomSearchDelegated(
          myBuildResult: (String query) {
            StudentOperation studentOperation = StudentOperation();
            return query == ''
                ? SizedBox()
                : CustomListSearchStudentScreen(
                    getSearchItemsStudent:
                        studentOperation.getStudentsInfo(studentName: query),
                    editFun: (groupInfoModel) {
                      onTapEdit(
                        groupInfoModel,
                      );
                    },
                    deleteFun: (StudentModel groupInfoModel) {
                      onTapDelete(groupInfoModel);
                    },
                  );
          },
        )).then((value) {
      return isSearchNow = false;
    });
  }
}
