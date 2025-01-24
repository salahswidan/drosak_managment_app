import 'package:drosak_managment_app/core/resources/colors_manager.dart';
import 'package:drosak_managment_app/core/resources/const_value.dart';
import 'package:drosak_managment_app/core/resources/font_manager.dart';
import 'package:drosak_managment_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widget/custom_app_bar_education_stage.dart';

class EducationStagesScreen extends StatelessWidget {
  const EducationStagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Column(
          children: [
            CustomAppBarEductionStages(
              onPressedAdd: () {
              },
              onPressedSearch: () {
                
              }
            ),
          ],
        ),
      ),
    );
  }
}