import 'package:drosak_managment_app/model/student/student_model.dart';
import 'package:drosak_managment_app/view/students/widget/custom_item_student.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomListSearchStudentScreen extends StatelessWidget {
  const CustomListSearchStudentScreen (
      {super.key,
      required this.getSearchItemsStudent,
      required this.deleteFun,
      required this.editFun});
  final Future<List<StudentModel>> getSearchItemsStudent;
  final void Function(StudentModel studentModel) deleteFun;
  final void Function(StudentModel studentModel) editFun;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<StudentModel>>(
      future: getSearchItemsStudent,
      builder: (context, snapshot) {
        return snapshot.connectionState == ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Directionality(
                textDirection: TextDirection.rtl,
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  SizedBox(
                    height: 24.h,
                  ),
                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) =>
                            index == snapshot.data!.length
                                ? SizedBox(
                                    height: 24.h,
                                  )
                                : CustomItemStudent(
                              studentModel: snapshot.data![index],
                              deleteFun: deleteFun,
                              editFun: editFun,
                            ),
                        separatorBuilder: (context, index) => SizedBox(
                              height: 24.h,
                            ),
                        itemCount: snapshot.data!.length + 1),
                  ),
                ]),
              );
      },
    );
  }
}
