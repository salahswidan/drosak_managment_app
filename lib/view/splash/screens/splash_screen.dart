import 'package:drosak_managment_app/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.kBlackColor,
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("assets/images/splash_border_image.png"),
            Image.asset("assets/images/logo.png"),
            Align(
                alignment: AlignmentDirectional.bottomEnd,
                child: Image.asset(
                    "assets/images/splash_border_image_bottom.png")),
          ],
        ),
      ),
    );
  }
}
