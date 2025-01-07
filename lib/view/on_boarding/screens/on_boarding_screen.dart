import 'package:drosak_managment_app/core/resources/assets_values_manager.dart';
import 'package:drosak_managment_app/core/resources/colors_manager.dart';
import 'package:drosak_managment_app/core/resources/const_value.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AssetsValuesManager.kOnBoardingImage1,
              height: 200,
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              ConstValue.kOnBoardingText1,
              style: TextStyle(
                  fontFamily: "AA-GALAXY",
                  fontSize: 20,
                  color: ColorsManager.kBlackColor),
            )
          ],
        ),
      ),
    ));
  }
}
