import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../controller/add_new_group/add_new_group_controller.dart';
import '../../../core/resources/const_value.dart';
import 'custom_add_time_and_day_of_add_new_group_screen.dart';
import 'custom_group_details_add_new_group_screen.dart';
import 'custom_select_education_stage_name.dart';

class CustomBodyAddNewGroupScreen extends StatelessWidget {
  const CustomBodyAddNewGroupScreen({
    super.key,
    required this.controller,
  });
  final AddNewGroupScreenController controller;
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
                CustomGroupDetailsAddNewGroupScreen(
                  controllerGroupDesc: controller.controllerGroupDesc,
                  controllerGroupName: controller.controllerGroupName,
                  formStateGroupDetails: controller.formStateGroupDetails,
                ),
                CustomSelectEducationStageNameAddNewGroup(
                  outPutDataListItemStageModel:
                      controller.outPutDataListItemStageModel,
                  onChange: controller.onChangedSelectEducationStageName,
                ),
                CustomAddTimeAndDayOfAddNewGroupScreen(
                  groupValueMS: controller.groupValueMS,
                  onChangedMSValue: controller.onChangedMSValue,
                  listDay: ConstListValues.listDays,
                  time: controller.timeGroup,
                  listTimeDayGroupModel: controller.listTimeDayGroupModel,
                  onChangedSelectDay: controller.onChangedSelectDay,
                  onPressedSelectTime: () {
                    controller.onPressedSelectTime(context);
                  },
                  onPressedAddTimeAndDayToTable:
                      controller.onPressedAddTimeAndDayToTable,
                ),
              ]),
        ),
      ),
    );
  }
}
