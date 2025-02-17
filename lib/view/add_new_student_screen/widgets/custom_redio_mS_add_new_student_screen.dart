import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/resources/const_value.dart';
import '../../../core/resources/font_manager.dart';
import 'package:drosak_managment_app/core/widget/buttons/custom_material_button.dart';

class CustomRedioMSAddNewStudentscreen extends StatelessWidget {
  const CustomRedioMSAddNewStudentscreen({
    super.key,
    required this.onPressedSelectTime,
    required this.groupValueMS,
    required this.onChangedMSValue,
  });

  final VoidCallback onPressedSelectTime;
  final String groupValueMS;
  final ValueChanged<String?> onChangedMSValue;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(ConstValue.kTime,
          style: TextStyle(
              fontFamily: FontName.geDinerOne,
              fontWeight: FontWeight.bold,
              color: Colors.white)),
      SizedBox(
        width: 15.w,
      ),
      CustomMaterialButton(
          onPressed: onPressedSelectTime, text: ConstValue.kChooseTime),
      Expanded(
        child: Wrap(
          children: [
            customRedio(ConstValue.kAM, groupValueMS),
            customRedio(ConstValue.kPM, groupValueMS),
            SizedBox(
              width: 15.w,
            ),
          ],
        ),
      )
    ]);
  }

  Widget customRedio(String value, String groupValue) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      Radio(
        value: value,
        groupValue: groupValueMS,
        onChanged: onChangedMSValue,
      ),
      Text(
        value,
        style: TextStyle(
            fontFamily: FontName.geDinerOne,
            fontWeight: FontWeight.bold,
            color: Colors.white),
      ),
    ]);
  }
}
