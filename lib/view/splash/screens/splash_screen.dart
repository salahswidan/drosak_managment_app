import 'package:drosak_managment_app/core/resources/colors_manager.dart';
import 'package:drosak_managment_app/core/resources/route_manager.dart';
import 'package:flutter/material.dart';

import '../../../controller/splash/splash_screen_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late SplashScreenController _controller;

  @override
  @override
  void initState() {
    super.initState();
    _controller = SplashScreenController(context,this);
  }

  @override
  void dispose() {
    _controller.disposeController();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.kBlackColor,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SlideTransition(
                position: _controller.animationTop,
                child: Image.asset("assets/images/splash_border_image.png")),
            Image.asset("assets/images/logo.png"),
            Align(
                alignment: AlignmentDirectional.bottomEnd,
                child: SlideTransition(
                  position: _controller.animationBottom,
                  child: Image.asset(
                      "assets/images/splash_border_image_bottom.png"),
                )),
          ],
        ),
      ),
    );
  }
}
