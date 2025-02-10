import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/resources/colors_manager.dart';
import '../../../core/resources/const_value.dart';
import '../../../core/resources/font_manager.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:drosak_managment_app/core/widget/buttons/custom_material_button.dart';
import '../../../model/group/appointment_model.dart';
import 'custom_redio_mS_add_new_group_screen.dart';

class CustomAddTimeAndDayOfAddNewGroupScreen extends StatelessWidget {
  CustomAddTimeAndDayOfAddNewGroupScreen(
      {super.key,
      required this.listDay,
      required this.outPuttime,
      this.onChangedSelectDay,
      required this.onPressedSelectTime,
      required this.onPressedAddTimeAndDayToTable,
      required this.outPutlistTimeDayGroupModel,
      required this.onChangedMSValue,
      required this.outPutDataMSValue,
      required this.onPressedDeleteAppointment});
  final List<String> listDay;
  final Stream<String?> outPuttime;
  final Function(String?)? onChangedSelectDay;
  final VoidCallback onPressedSelectTime;
  final VoidCallback onPressedAddTimeAndDayToTable;
  final Stream<List<AppointmentModel>> outPutlistTimeDayGroupModel;
  final ValueChanged<String?> onChangedMSValue;
  final Stream<String> outPutDataMSValue;
  final void Function(int index) onPressedDeleteAppointment;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomChooseDay(
            listDay: listDay, onChangedSelectDay: onChangedSelectDay),
        SizedBox(
          height: 12.h,
        ),
        streamOfMsValue(
            outPutDataMSValue: outPutDataMSValue,
            onPressedSelectTime: onPressedSelectTime,
            onChangedMSValue: onChangedMSValue),
        SizedBox(
          height: 12.h,
        ),
        streamOfTimeSelected(outPuttime: outPuttime),
        SizedBox(
          height: 12.h,
        ),
        CustomMaterialButton(
            onPressed: onPressedAddTimeAndDayToTable,
            text: ConstValue.kAddToTableAppointment),
        SizedBox(
          height: 12.h,
        ),
        streamOfCountOfAppoinment(
            outPutlistTimeDayGroupModel: outPutlistTimeDayGroupModel),
        StreamOfTable(
          onPressedDeleteAppointment: onPressedDeleteAppointment,
          outPutlistTimeDayGroupModel: outPutlistTimeDayGroupModel,
        ),
        SizedBox(
          height: 12.h,
        ),
        StreamEmptyOrNot(
            outPutlistTimeDayGroupModel: outPutlistTimeDayGroupModel),
      ],
    );
  }
}

class CustomChooseDay extends StatelessWidget {
  const CustomChooseDay({
    super.key,
    required this.listDay,
    required this.onChangedSelectDay,
  });

  final List<String> listDay;
  final Function(String? p1)? onChangedSelectDay;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(ConstValue.kDay,
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
    );
  }
}

class streamOfCountOfAppoinment extends StatelessWidget {
  const streamOfCountOfAppoinment({
    super.key,
    required this.outPutlistTimeDayGroupModel,
  });

  final Stream<List<AppointmentModel>> outPutlistTimeDayGroupModel;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: outPutlistTimeDayGroupModel,
      builder: (context, snapshot) =>
          snapshot.connectionState == ConnectionState.waiting
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : snapshot.data == null || snapshot.data!.isEmpty
                  ? const SizedBox()
                  : Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 16),
                      child: Text(
                        "${ConstValue.kCountOfAppointmentAdded} : (${snapshot.data!.length})",
                        style: TextStyle(color: Colors.white, fontSize: 20.sp),
                      ),
                    ),
    );
  }
}

class streamOfMsValue extends StatelessWidget {
  const streamOfMsValue({
    super.key,
    required this.outPutDataMSValue,
    required this.onPressedSelectTime,
    required this.onChangedMSValue,
  });

  final Stream<String> outPutDataMSValue;
  final VoidCallback onPressedSelectTime;
  final ValueChanged<String?> onChangedMSValue;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
        stream: outPutDataMSValue,
        builder: (context, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : CustomRedioMSAddNewGroupscreen(
                    onPressedSelectTime: onPressedSelectTime,
                    groupValueMS: snapshot.data!,
                    onChangedMSValue: onChangedMSValue));
  }
}

class streamOfTimeSelected extends StatelessWidget {
  const streamOfTimeSelected({
    super.key,
    required this.outPuttime,
  });

  final Stream<String?> outPuttime;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: outPuttime,
      builder: (context, snapshot) =>
          snapshot.connectionState == ConnectionState.waiting
              ? const SizedBox()
              : snapshot.data == null
                  ? const SizedBox()
                  : Align(
                      alignment: AlignmentDirectional.center,
                      child: Text(
                        snapshot.data!,
                        style: TextStyle(
                            fontSize: 20.sp,
                            color: Colors.white,
                            fontFamily: FontName.geDinerOne),
                      )),
    );
  }
}

class StreamEmptyOrNot extends StatelessWidget {
  const StreamEmptyOrNot({
    super.key,
    required this.outPutlistTimeDayGroupModel,
  });

  final Stream<List<AppointmentModel>> outPutlistTimeDayGroupModel;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: outPutlistTimeDayGroupModel,
      builder: (context, snapshot) => snapshot.data == null
          ? const Text(
              ConstValue.kNoTimeAndDayYetAdd,
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: FontName.geDinerOne,
                  fontWeight: FontWeight.bold),
            )
          : snapshot.data!.isEmpty
              ? const Text(
                  ConstValue.kNoTimeAndDayYetAdd,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: FontName.geDinerOne,
                      fontWeight: FontWeight.bold),
                )
              : const SizedBox(),
    );
  }
}

class StreamOfTable extends StatelessWidget {
  const StreamOfTable(
      {super.key,
      required this.outPutlistTimeDayGroupModel,
      required this.onPressedDeleteAppointment});
  final Stream<List<AppointmentModel>> outPutlistTimeDayGroupModel;
  final void Function(int index) onPressedDeleteAppointment;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: outPutlistTimeDayGroupModel,
      builder: (context, snapshot) => Table(
        border: TableBorder.all(
          borderRadius: BorderRadius.all(Radius.circular(14.r)),
          color: Colors.white,
        ),
        children: [
          customHeaderOfTable(),
          if (snapshot.data != null)
            for (int i = 0; i < snapshot.data!.length; i++)
              TableRow(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
                    child: Center(
                      child: Text(
                        snapshot.data![i].day,
                        style: const TextStyle(
                            color: Colors.white,
                            fontFamily: FontName.geDinerOne),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
                    child: Center(
                      child: Text(
                        snapshot.data![i].time,
                        style: const TextStyle(
                            color: Colors.white,
                            fontFamily: FontName.geDinerOne),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
                    child: Center(
                      child: Text(
                        snapshot.data![i].ms,
                        style: const TextStyle(
                            color: Colors.white,
                            fontFamily: FontName.geDinerOne),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      onPressedDeleteAppointment(i);
                    },
                    icon: const Icon(Icons.delete),
                    color: Colors.white,
                  )
                ],
              ),
        ],
      ),
    );
  }
}

TableRow customHeaderOfTable() {
  return const TableRow(
    children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        child: Center(
          child: Text(
            ConstValue.kDay,
            style:
                TextStyle(color: Colors.white, fontFamily: FontName.geDinerOne),
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        child: Center(
          child: Text(
            ConstValue.kTime,
            style:
                TextStyle(color: Colors.white, fontFamily: FontName.geDinerOne),
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        child: Center(
          child: Text(
            ConstValue.kMS,
            style:
                TextStyle(color: Colors.white, fontFamily: FontName.geDinerOne),
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        child: Center(
          child: Text(
            "حذف",
            style:
                TextStyle(color: Colors.white, fontFamily: FontName.geDinerOne),
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
  );
}
