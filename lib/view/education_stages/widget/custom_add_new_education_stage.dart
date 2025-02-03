import 'dart:io';
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
    required this.onPressedPickImage,
    required this.onPressedAdd,
    required this.controllerNameEducationalStage,
    required this.controllerDescraptinEducationalStage,
    this.pathImage,
    required this.onPressedDeleteImage,
  });
  final VoidCallback onPressedAdd;
  final VoidCallback onPressedDeleteImage;
  final VoidCallback onPressedPickImage;
  final String? pathImage;

  final TextEditingController controllerNameEducationalStage;
  final TextEditingController controllerDescraptinEducationalStage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SingleChildScrollView(
        child: Directionality(
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
                      controller: controllerNameEducationalStage,
                    ),
                  ),
                  SizedBox(
                    width: 6.w,
                  ),
                  IconButton.filled(
                      onPressed: onPressedPickImage,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ColorsManager.kPrimaryColor),
                      icon:
                          SvgPicture.asset(AssetsValuesManager.kPlaceholderSvg))
                ],
              ),
              SizedBox(
                height: 12.h,
              ),
              CustomTextFormField(
                maxLines: 3,
                hintText: ConstValue.kDescEducationalStage,
                controller: controllerDescraptinEducationalStage,
              ),
              SizedBox(
                height: 24.h,
              ),
              if (pathImage != null)
                Stack(children: [
                  Image.file(
                    errorBuilder: (context, error, stackTrace) {
                      return Text(
                        "not found",
                        style: TextStyle(color: Colors.red),
                      );
                    },
                    File(pathImage!),
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  IconButton(
                    onPressed: onPressedDeleteImage,
                    icon: Icon(
                      Icons.delete,
                    ),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  ),
                ]),
              if (pathImage != null)
                SizedBox(
                  height: 24.h,
                ),
              CustomMaterialButton(
                onPressed: onPressedAdd,
                text: ConstValue.kAdd,
              )
            ]),
          ),
        ),
      ),
    );
  }
}
