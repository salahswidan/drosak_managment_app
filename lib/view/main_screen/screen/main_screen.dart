import 'package:drosak_managment_app/core/resources/assets_values_manager.dart';
import 'package:drosak_managment_app/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        unselectedItemColor: ColorsManager.kGreyLight,
        selectedItemColor: ColorsManager.kPrimaryColor,
        type: BottomNavigationBarType.fixed,
        backgroundColor: ColorsManager.kBlackLight,
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset(AssetsValuesManager.kPaymentImageSvg),
              label: "Payment"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(AssetsValuesManager.kPaymentImageSvg),
              label: "ss"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(AssetsValuesManager.kPaymentImageSvg),
              label: "Payment"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(AssetsValuesManager.kPaymentImageSvg),
              label: "ss"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(AssetsValuesManager.kPaymentImageSvg),
              label: "ss"),
        ],
      ),
    );
  }
}
