
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/resources/assets_values_manager.dart';
import '../../../core/resources/colors_manager.dart';
import '../../../core/resources/const_value.dart';
import '../../../core/widget/buttons/custom_material_button.dart';
import '../../../core/widget/input_field/custom_text_form_field.dart';

class CustomAddNewEducationStage extends StatelessWidget {
  const CustomAddNewEducationStage({
    super.key,
    required this.controllerAddNewEducationalStage,
  });

  final TextEditingController controllerAddNewEducationalStage;

  @override
  Widget build(BuildContext context) {
    return Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.h),
            decoration: BoxDecoration(
              color: ColorsManager.kBlackLight,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.r),
                topRight: Radius.circular(12.r),
              ),
            ),
            width: double.infinity,
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Row(
                children: [
                  Expanded(
                    child: CustomTextFormField(
                      hintText: ConstValue.kNameEducationalStages,
                      controller: controllerAddNewEducationalStage,
                    ),
                  ),
                  SizedBox(
                    width: 6.w,
                  ),
                  IconButton.filled(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ColorsManager.kPrimaryColor),
                      icon: SvgPicture.asset(
                          AssetsValuesManager.kPlaceholderSvg))
                ],
              ),
              SizedBox(
                height: 40.h,
              ),
              CustomMaterialButton(
                onPressed: () {},
                text: ConstValue.kAdd,
              )
            ]),
          ),
        );
  }
}
