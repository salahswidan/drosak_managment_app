import 'package:flutter/material.dart';

import '../../../core/resources/const_value.dart';
import 'custom_item_on_boarding_screen.dart';

class CustomPageViewOnBoardingScreen extends StatelessWidget {
  const CustomPageViewOnBoardingScreen({
    super.key,
    required this.controller,
  });
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: PageView.builder(
        controller: controller,
        itemBuilder: (context, index) => CustomItemOnBoardingScreen(
          onBoardingModel: ConstListValues.listOnBoardingModel[index],
        ),
        itemCount: ConstListValues.listOnBoardingModel.length,
      ),
    );
  }
}
