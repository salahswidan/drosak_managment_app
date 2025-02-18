import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/resources/assets_values_manager.dart';
import '../../../core/resources/colors_manager.dart';
import '../../../core/resources/const_value.dart';
import '../../../core/resources/font_manager.dart';
import '../../../core/widget/input_field/custom_text_form_field.dart';

class CustomStudentDetailsAddNewStudentScreen extends StatelessWidget {
  const CustomStudentDetailsAddNewStudentScreen(
      {super.key,
      required this.formStateStudentDetails,
      required this.controllerStudentName,
      required this.controllerGroupDesc,
      required this.outPutPathImage,
      required this.onPressedPickImage,
      required this.onPressedDeleteImage});
  final GlobalKey<FormState> formStateStudentDetails;
  final TextEditingController controllerStudentName;
  final TextEditingController controllerGroupDesc;
  final Stream<String?> outPutPathImage;
  final VoidCallback onPressedDeleteImage;
  final VoidCallback onPressedPickImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          ConstValue.kDetailsStudent,
          style:
              TextStyle(color: Colors.white, fontFamily: FontName.geDinerOne),
        ),
        SizedBox(
          height: 12.h,
        ),
        Row(
          children: [
            Expanded(
              child: Form(
                key: formStateStudentDetails,
                child: CustomTextFormField(
                  validator: (value) {
                    if (value == null || value == '') {
                      return ConstValue.kCantEmpty;
                    } else
                      return null;
                  },
                  hintText: ConstValue.kNameStudent,
                  controller: controllerStudentName,
                ),
              ),
            ),
            SizedBox(
              width: 6.w,
            ),
            IconButton.filled(
                onPressed: onPressedPickImage,
                style: ElevatedButton.styleFrom(
                    backgroundColor: ColorsManager.kPrimaryColor),
                icon: SvgPicture.asset(AssetsValuesManager.kPlaceholderSvg))
          ],
        ),
        SizedBox(
          height: 12.h,
        ),
        CustomTextFormField(
          maxLines: 3,
          hintText: ConstValue.kNote,
          controller: controllerGroupDesc,
        ),
        StreamBuilder(
            stream: outPutPathImage,
            builder: (context, snapshot) {
              return snapshot.connectionState == ConnectionState.waiting
                  ? const Center(
                      child: SizedBox(),
                    )
                  : snapshot.data != null && snapshot.data!.trim != ''
                      ? Column(
                          children: [
                            Stack(children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Image.file(
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Text(
                                      "not found",
                                      style: TextStyle(color: Colors.red),
                                    );
                                  },
                                  File(snapshot.data!),
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              IconButton(
                                onPressed: onPressedDeleteImage,
                                icon: Icon(
                                  Icons.delete,
                                ),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red),
                              ),
                            ]),
                            SizedBox(
                              height: 24.h,
                            ),
                          ],
                        )
                      : SizedBox();
            }),
      ],
    );
  }
}
