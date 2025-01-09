
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resources/colors_manager.dart';
import '../screens/explore_app_screen.dart';
import 'custom_continar_name_and_Image_explore_screen.dart';
import 'custom_number_order_explore_screen.dart';
import 'custom_shadow_conainer_explore_screen.dart';

class CustomItemExploreScreen extends StatelessWidget {
  const CustomItemExploreScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
          clipBehavior: Clip.none,
          children: [
            CustomShadowConainerExploreScreen(),
            Positioned(
                bottom: -16.h,
                left: -16.h,
                child: CircleAvatar(
                  radius: 16.r,
                  backgroundColor: ColorsManager.kBlackColor,
                )),
            CustomNumberOrderExploreScreen(),
            CustomContinarNameAndImageExploreScreen(),
          ],
        );
  }
}
