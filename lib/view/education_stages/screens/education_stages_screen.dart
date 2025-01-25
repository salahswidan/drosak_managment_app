 
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widget/custom_app_bar_education_stage.dart';
import '../widget/custom_item_stage.dart';

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
                onPressedAdd: () {}, onPressedSearch: () {}),
            SizedBox(
              height: 35.h,
            ),
            CustomItemStage(),
          ],
        ),
      ),
    );
  }
}
