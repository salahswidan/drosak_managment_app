import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/resources/colors_manager.dart';
import '../../../core/resources/const_value.dart';
import '../../../core/resources/font_manager.dart';
import '../../../model/group/appointment_model.dart';

class CustomShowTimeAndDayOfThisGroupAddNewStudentScreen
    extends StatelessWidget {
  CustomShowTimeAndDayOfThisGroupAddNewStudentScreen({
    super.key,
    required this.outPutlistTimeDayGroupModel,
  });
  final Stream<List<AppointmentModel>> outPutlistTimeDayGroupModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 12.h,
        ),
        streamOfCountOfAppoinment(
            outPutlistTimeDayGroupModel: outPutlistTimeDayGroupModel),
        StreamOfTable(
          //  onPressedDeleteAppointment: onPressedDeleteAppointment,
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
              ? SizedBox()
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
              ConstValue.kNoTimeAndDayBecauseYouDontChooseGroup,
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: FontName.geDinerOne,
                  fontWeight: FontWeight.bold),
            )
          : snapshot.data!.isEmpty
              ? const Text(
                  ConstValue.kNoTimeAndDayBecauseYouDontChooseGroup,
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
  const StreamOfTable({
    super.key,
    required this.outPutlistTimeDayGroupModel,
    // required this.onPressedDeleteAppointment
  });
  final Stream<List<AppointmentModel>> outPutlistTimeDayGroupModel;
  // final void Function(int index) onPressedDeleteAppointment;

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
    ],
    decoration: BoxDecoration(
        color: ColorsManager.kPrimaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(14),
          topRight: Radius.circular(14),
        )),
  );
}
