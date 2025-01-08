
import 'package:flutter/material.dart';

import '../../../core/resources/const_value.dart';
import 'custom_item_on_boarding_screen.dart';

class CustomPageViewOnBoardingScreen extends StatelessWidget {
  const CustomPageViewOnBoardingScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemBuilder: (context, index) => CustomItemOnBoardingScreen(
        onBoardingModel: ConstListValues.listOnBoardingModel[index],
      ),
      itemCount: ConstListValues.listOnBoardingModel.length,
    );
  }
}
