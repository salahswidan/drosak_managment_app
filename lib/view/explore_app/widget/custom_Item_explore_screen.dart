import 'package:drosak_managment_app/model/explore/explore_screen_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/resources/colors_manager.dart';
import 'custom_continar_name_and_Image_explore_screen.dart';
import 'custom_number_order_explore_screen.dart';
import 'custom_shadow_conainer_explore_screen.dart';

class CustomItemExploreScreen extends StatelessWidget {
  const CustomItemExploreScreen({
    super.key,
    required this.exploreScreenModel, required this.number,
  });
  final ExploreScreenModel exploreScreenModel;
  final int number;

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
        CustomNumberOrderExploreScreen(number:number),
        CustomContinarNameAndImageExploreScreen(exploreScreenModel:exploreScreenModel,),
      ],
    );
  }
}
