import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        const Text(
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
            // SizedBox(
            //   width: 6.w,
            // ),
            // IconButton.filled(
            //     onPressed: onPressedPickImage,
            //     style: ElevatedButton.styleFrom(
            //         backgroundColor: ColorsManager.kPrimaryColor),
            //     icon: SvgPicture.asset(AssetsValuesManager.kPlaceholderSvg))
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
        SizedBox(
          height: 12.h,
        ),
        StreamBuilder(
            stream: outPutPathImage,
            builder: (context, snapshot) {
              return snapshot.connectionState == ConnectionState.waiting
                  ? const Center(
                      child: SizedBox(),
                    )
                  : snapshot.data != null && snapshot.data!.trim != ''
                      ? Stack(children: [
                          DottedBorder(
                            dashPattern: [10, 5],
                            radius: const Radius.circular(12),
                            color: ColorsManager.kPrimaryColor,
                            borderType: BorderType.RRect,
                            strokeWidth: 1,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.file(
                                errorBuilder: (context, error, stackTrace) {
                                  return const Text(
                                    "not found",
                                    style: TextStyle(
                                        color: ColorsManager.kPrimaryColor),
                                  );
                                },
                                File(snapshot.data!),
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: onPressedDeleteImage,
                            icon: const Icon(
                              Icons.delete,
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red),
                          ),
                        ])
                      : InkWell(
                          onTap: () {
                            onPressedPickImage();
                          },
                          child: Container(
                            color: ColorsManager.kPrimaryColor.withOpacity(0.3),
                            width: double.infinity,
                            height: 200.h,
                            child: DottedBorder(
                                dashPattern: [10, 5],
                                radius: const Radius.circular(12),
                                color: ColorsManager.kPrimaryColor,
                                borderType: BorderType.RRect,
                                strokeWidth: 1,
                                child: const SizedBox(
                                  width: double.infinity,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.upload_file_outlined,
                                        size: 30,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        ConstValue.kChooseFile,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: FontName.geDinerOne),
                                      )
                                    ],
                                  ),
                                )),
                          ),
                        );
            }),
      ],
    );
  }
}
