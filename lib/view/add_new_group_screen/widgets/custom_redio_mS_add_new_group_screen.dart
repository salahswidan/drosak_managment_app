
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/resources/const_value.dart';
import '../../../core/resources/font_manager.dart';
import 'package:drosak_managment_app/core/widget/buttons/custom_material_button.dart';
class CustomRedioMSAddNewGroupscreen extends StatelessWidget {
  const CustomRedioMSAddNewGroupscreen({
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
          child: RadioListTile(
              title: Text(ConstValue.kPM,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: FontName.geDinerOne,
                      fontWeight: FontWeight.bold)),
              value: ConstValue.kPM,
              groupValue: groupValueMS,
              onChanged: onChangedMSValue)),
      Expanded(
          child: RadioListTile(
              title: Text(ConstValue.kAM,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: FontName.geDinerOne,
                      fontWeight: FontWeight.bold)),
              value: ConstValue.kAM,
              groupValue: groupValueMS,
              onChanged: onChangedMSValue)),
    ]);
  }
}
