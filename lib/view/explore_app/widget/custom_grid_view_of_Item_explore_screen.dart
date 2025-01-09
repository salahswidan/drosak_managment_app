
import 'package:drosak_managment_app/view/explore_app/widget/custom_Item_explore_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../screens/explore_app_screen.dart';

class CustomGridViewOfItemExploreScreen extends StatelessWidget {
  const CustomGridViewOfItemExploreScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          padding: EdgeInsets.symmetric(
            horizontal: 30,
          ),
          itemCount: 5,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 138.w / 108.h,
              crossAxisCount: 2,
              crossAxisSpacing: 39,
              mainAxisSpacing: 34),
          itemBuilder: (context, index) => CustomItemExploreScreen()),
    );
  }
}
