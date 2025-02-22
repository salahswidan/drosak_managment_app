import 'package:drosak_managment_app/controller/student/student_controller.dart';
import 'package:drosak_managment_app/view/students/widget/custom_list_view_item_student.dart';
import 'package:flutter/material.dart';
import '../../../core/resources/const_value.dart';
import '../../../core/widget/app_bar/custom_app_bar_title_add_search.dart';


class StudentsScreen extends StatefulWidget {
  const StudentsScreen({super.key});

  @override
  State<StudentsScreen> createState() => _StudentsScreenState();
}

class _StudentsScreenState extends State<StudentsScreen> {
  @override
  late StudentController _controller;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = StudentController(context);
  }

  @override
  void dispose() {
    _controller.disposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Column(
          children: [
            CustomAppBarTitleAddSearch(
                streamCount: _controller.outPutDataListItemStudentModel,
                title: ConstValue.kStudents,
                // outPutDataListItemsStageModel:
                //     _controller.GroupsScreenController,
                onPressedAdd: () {
                  _controller.addNewStudents(context: context);
                },
                onPressedSearch: () {
                  _controller.onPressedSearch();
                }),
            CustomListViewItemStudent(
              outPutDataListItemsStudentModel:
                  _controller.outPutDataListItemStudentModel,
              deleteFun: _controller.onTapDelete,
              editFun: _controller.onTapEdit,
              onRefresh: _controller.onTapRefresh,
            ),
            // CustomItemStudent(
            //   groupInfoModel: GroupInfoModel(
            //       groupDetails: GroupDetails(
            //           name: 'name', desc: 'desc', educationStageID: 1),
            //       listAppointment: [
            //         AppointmentModel(time: 'time', day: 'day', ms: 'ms')
            //       ]),
            //   deleteFun: (GroupInfoModel itemStageModel) {},
            //   editFun: (GroupInfoModel itemStageModel) {},
            // )
            // CustomListViewItemGroups(
            //     onRefresh: _controller.onRefresh,
            //     outPutDataListItemsGroupModel:
            //         _controller.outPutDataListItemGroupModel,
            //     deleteFun: _controller.deleteGroupInfo,
            //     editFun: (groupInfoModel) {
            //       _controller.editGroupInfo(
            //         groupInfoModel,
            //       );
            //     }),
          ],
        ),
      ),
    );
  }
}
