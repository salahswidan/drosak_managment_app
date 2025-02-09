import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/resources/colors_manager.dart';
import '../../../core/resources/const_value.dart';
import '../../../core/resources/font_manager.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:drosak_managment_app/core/widget/buttons/custom_material_button.dart';
import '../../../model/group/time_day_group_model.dart';
import 'custom_redio_mS_add_new_group_screen.dart';

class CustomAddTimeAndDayOfAddNewGroupScreen extends StatelessWidget {
  CustomAddTimeAndDayOfAddNewGroupScreen(
      {super.key,
      required this.listDay,
      required this.outPuttime,
      this.onChangedSelectDay,
      required this.onPressedSelectTime,
      required this.onPressedAddTimeAndDayToTable,
      required this.listTimeDayGroupModel,
      required this.onChangedMSValue,
      required this.outPutDataMSValue});
  final List<String> listDay;
  final Stream<String?> outPuttime;
  final Function(String?)? onChangedSelectDay;
  final VoidCallback onPressedSelectTime;
  final VoidCallback onPressedAddTimeAndDayToTable;
  final List<TimeDayGroupModel> listTimeDayGroupModel;
  final ValueChanged<String?> onChangedMSValue;

  final Stream<String> outPutDataMSValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(ConstValue.kDay,
                style: TextStyle(
                    fontFamily: FontName.geDinerOne,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            SizedBox(
              width: 15.w,
            ),
            Expanded(
              child: CustomDropdown<String>.search(
                hintText: ConstValue.kChooseDay,
                items: listDay,
                noResultFoundText: '',
                //initialItem: 'a',
                onChanged: onChangedSelectDay,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 12.h,
        ),
        StreamBuilder<String>(
            stream: outPutDataMSValue,
            builder: (context, snapshot) =>
                snapshot.connectionState == ConnectionState.waiting
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : CustomRedioMSAddNewGroupscreen(
                        onPressedSelectTime: onPressedSelectTime,
                        groupValueMS: snapshot.data!,
                        onChangedMSValue: onChangedMSValue)),
        SizedBox(
          height: 12.h,
        ),
        StreamBuilder(
          stream: outPuttime,
          builder: (context, snapshot) =>
              snapshot.connectionState == ConnectionState.waiting
                  ? SizedBox()
                  : snapshot.data == null
                      ? SizedBox()
                      : Align(
                          alignment: AlignmentDirectional.center,
                          child: Text(
                            snapshot.data!,
                            style: TextStyle(
                                fontSize: 20.sp,
                                color: Colors.white,
                                fontFamily: FontName.geDinerOne),
                          )),
        ),
        SizedBox(
          height: 12.h,
        ),
        CustomMaterialButton(
            onPressed: onPressedAddTimeAndDayToTable,
            text: ConstValue.kAddToTableAppointment),
        SizedBox(
          height: 12.h,
        ),
        Table(
          border: TableBorder.all(
            borderRadius: BorderRadius.all(Radius.circular(14.r)),
            color: Colors.white,
          ),
          children: [
            const TableRow(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                  child: const Center(
                    child: Text(
                      ConstValue.kDay,
                      style: TextStyle(
                          color: Colors.white, fontFamily: FontName.geDinerOne),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                  child: const Center(
                    child: Text(
                      ConstValue.kTime,
                      style: TextStyle(
                          color: Colors.white, fontFamily: FontName.geDinerOne),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                  child: Center(
                    child: Text(
                      ConstValue.kMS,
                      style: TextStyle(
                          color: Colors.white, fontFamily: FontName.geDinerOne),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                  child: Center(
                    child: Text(
                      "حذف",
                      style: TextStyle(
                          color: Colors.white, fontFamily: FontName.geDinerOne),
                    ),
                  ),
                ),
              ],
              decoration: BoxDecoration(
                  color: ColorsManager.kPrimaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(14),
                    topRight: Radius.circular(14),
                  )),
            ),
            for (int i = 0; i < listTimeDayGroupModel.length; i++)
              TableRow(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4, vertical: 10),
                    child: Center(
                      child: Text(
                        listTimeDayGroupModel[i].day,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: FontName.geDinerOne),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4, vertical: 10),
                    child: Center(
                      child: Text(
                        listTimeDayGroupModel[i].time,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: FontName.geDinerOne),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4, vertical: 10),
                    child: Center(
                      child: Text(
                        listTimeDayGroupModel[i].ms,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: FontName.geDinerOne),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.delete),
                    color: Colors.white,
                  )
                ],
              ),
          ],
        ),
        SizedBox(
          height: 12.h,
        ),
        if (listTimeDayGroupModel.isEmpty)
          Text(
            ConstValue.kNoTimeAndDayYetAdd,
            style: TextStyle(
                color: Colors.white,
                fontFamily: FontName.geDinerOne,
                fontWeight: FontWeight.bold),
          )
      ],
    );
  }
}
