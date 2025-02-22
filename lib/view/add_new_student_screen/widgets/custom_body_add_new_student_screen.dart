import 'package:drosak_managment_app/view/add_new_student_screen/widgets/custom_show_time_and_day_of_this_group_add_new_student_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../controller/add_new_students/add_new_students_controller.dart';
import 'custom_select_group_name_student_screen.dart';
import 'custom_student_details_add_new_student_screen.dart';
import 'custom_select_education_stage_name.dart';

class CustomBodyAddNewStudentScreen extends StatelessWidget {
  const CustomBodyAddNewStudentScreen({
    super.key,
    required this.controller,
  });
  final AddNewStudentScreenController controller;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.h),
          width: double.infinity,
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomStudentDetailsAddNewStudentScreen(
                  onPressedPickImage: controller.onPressedPickImage,
                  controllerGroupDesc: controller.controllerStudentNote,
                  controllerStudentName: controller.controllerStudentName,
                  formStateStudentDetails: controller.formStateStudentDetails,
                  outPutPathImage: controller.outPutPathImage,
                  onPressedDeleteImage: controller.onPressedDeleteImage,
                ),
                CustomSelectEducationStageNameAddNewGroup(
                  outPutDataInitiaItem:
                      controller.outPutDataInitiaItemSelectedStage,
                  initialItem: controller.selectedEducationalStage,
                  outPutDataListItemStageModel:
                      controller.outPutDataListItemStageModel,
                  onChange: controller.onChangedSelectEducationStageName,
                ),
                CustomSelectGroupNameAddNewGroupScreen(
                  outPutDataInitialSelectedGroup:
                      controller.outPutDataInitiaItemSelectedGroup,
                  initialItem: controller.selectedGroupDetails,
                  outPutDataListItemGroupsDetails:
                      controller.outPutDataListItemGroupDetails,
                  onChange: controller.onChangedSelectGroupName,
                ),
                CustomShowTimeAndDayOfThisGroupAddNewStudentScreen(
                  outPutlistTimeDayGroupModel: controller.outPutDataAppointment,
                ),
              ]),
        ),
      ),
    );
  }
}
