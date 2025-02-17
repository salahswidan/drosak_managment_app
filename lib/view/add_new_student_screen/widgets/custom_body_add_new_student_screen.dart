import 'package:drosak_managment_app/view/add_new_student_screen/add_new_student_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../controller/add_new_group/add_new_group_controller.dart';
import '../../../controller/add_new_students/add_new_students_controller.dart';
import '../../../core/resources/const_value.dart';
import 'custom_add_time_and_day_of_add_new_student_screen.dart';
import 'custom_group_details_add_new_student_screen.dart';
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
                CustomGroupDetailsAddNewStudentScreen(
                  controllerGroupDesc: controller.controllerGroupDesc,
                  controllerGroupName: controller.controllerGroupName,
                  formStateGroupDetails: controller.formStateGroupDetails,
                ),
                CustomSelectEducationStageNameAddNewGroup(
                  outPutDataInitiaItem: controller.outPutDataInitiaItem,
                  initialItem: controller.selectedEducationalStage,
                  outPutDataListItemStageModel:
                      controller.outPutDataListItemStageModel,
                  onChange: controller.onChangedSelectEducationStageName,
                ),
                CustomAddTimeAndDayOfAddNewStudentScreen(
                    outPutDataMSValue: controller.outPutDataMSValue,
                    onChangedMSValue: controller.onChangedMSValue,
                    listDay: ConstListValues.listDays,
                    outPuttime: controller.outPutDataSelectedTime,
                    outPutlistTimeDayGroupModel:
                        controller.outPutDataListTimeDayGroupModel,
                    onChangedSelectDay: controller.onChangedSelectDay,
                    onPressedSelectTime: () {
                      controller.onPressedSelectTime(context);
                    },
                    onPressedAddTimeAndDayToTable: () {
                      controller.onPressedAddTimeAndDayToTable(context);
                    },
                    onPressedDeleteAppointment:
                        controller.onPressedDeleteAppointment),
              ]),
        ),
      ),
    );
  }
}
