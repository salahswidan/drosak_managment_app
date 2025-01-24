
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../screens/explore_app_screen.dart';
import 'custom_grid_view_of_Item_explore_screen.dart';

class BodyExploreScreen extends StatelessWidget {
  const BodyExploreScreen({
    super.key, required this.onTap,
  });
 final void Function(int index) onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 24.h,
        ),
        CustomGridViewOfItemExploreScreen(
          onTap: onTap,
        ),
      ],
    );
  }
}
