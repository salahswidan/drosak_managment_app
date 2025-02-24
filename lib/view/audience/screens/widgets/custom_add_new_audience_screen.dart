import 'dart:io';
import 'package:drosak_managment_app/core/resources/font_manager.dart';
import 'package:drosak_managment_app/model/student/student_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/colors_manager.dart';
import '../../../../core/resources/const_value.dart';
import '../../../../core/widget/buttons/custom_material_button.dart';

class CustomAddNewAudienceScreen extends StatelessWidget {
  const CustomAddNewAudienceScreen({
    super.key,
    required this.onPressedAdd,
    required this.listStudentModel,
    required this.outputMapSelectedStudent,
    required this.onChangedSelectedStatus,required this.onPressedSelectedDataTime,
  });
  final Stream<Map<String, bool?>> outputMapSelectedStudent;
  final VoidCallback onPressedAdd;
  final VoidCallback onPressedSelectedDataTime;
  final List<StudentModel> listStudentModel;
  final void Function({required int id, required bool status})
      onChangedSelectedStatus;

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
              StreamBuilder<Map<String, bool?>>(
                stream: outputMapSelectedStudent,
                builder: (context, AsyncSnapshot<Map<String, bool?>> snapshot) {
                  //? count true
                  int countSelected = 0;
                  if (snapshot.data != null) {
                    countSelected = snapshot.data!.values
                        .where((element) => element == true)
                        .toList()
                        .length;
                  } else {
                    countSelected = 0;
                  }
                  return Text(
                    countSelected.toString(),
                    style: TextStyle(color: Colors.white),
                  );
                },
              ),
              ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => StreamBuilder(
                        stream: outputMapSelectedStudent,
                        builder: (context, snapshot) => CostomItem(
                          onChangedSelectedStatus: (value) {
                            onChangedSelectedStatus(
                                id: listStudentModel[index].id!,
                                status: value!);
                          },
                          studentModel: listStudentModel[index],
                          selected: snapshot.data == null
                              ? false
                              : snapshot
                                  .data![listStudentModel[index].id.toString()],
                        ),
                      ),
                  separatorBuilder: (context, index) => Divider(
                        color: ColorsManager.kGreyLight.withOpacity(0.5),
                      ),
                  itemCount: listStudentModel.length),
              SizedBox(
                height: 24.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomMaterialButton(
                    onPressed: onPressedAdd,
                    text: ConstValue.kAdd,
                  ),
                  SizedBox(
                    width: 6.w,
                  ),
                  TextButton(
                    onPressed: onPressedSelectedDataTime,
                    child: Text(ConstValue.kSelectDate),
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontFamily: FontName.geDinerOne,
                          fontSize: 16.sp,
                        )),
                  )
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}

class CostomItem extends StatelessWidget {
  const CostomItem({
    super.key,
    required this.studentModel,
    required this.selected,
    this.onChangedSelectedStatus,
  });
  final StudentModel studentModel;
  final bool? selected;
  final ValueChanged<bool?>? onChangedSelectedStatus;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(
        studentModel.name,
        style: const TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        studentModel.id!.toString(),
        style: TextStyle(color: Colors.white),
      ),
      secondary: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.file(
          errorBuilder: (context, error, stackTrace) {
            return const Text(
              "not found",
              style: TextStyle(color: ColorsManager.kPrimaryColor),
            );
          },
          File(studentModel.image),
          //  width: double.infinity,
          height: 200.h,
          fit: BoxFit.contain,
        ),
      ),
      value: selected ?? false,
      onChanged: onChangedSelectedStatus,
    );
  }
}
