import 'package:drosak_managment_app/model/on_boarding/on_boarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/resources/assets_values_manager.dart';
import '../../../core/resources/colors_manager.dart';
import '../../../core/resources/const_value.dart';

class CustomItemOnBoardingScreen extends StatelessWidget {
  const CustomItemOnBoardingScreen({
    super.key,
    required this.onBoardingModel,
  });
  final OnBoardingModel onBoardingModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            onBoardingModel.image,
            height: 200,
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            onBoardingModel.text,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: "AA-GALAXY",
                fontSize: 20,
                color: ColorsManager.kBlackColor),
          )
        ],
      ),
    );
  }
}
