import 'package:drosak_managment_app/core/resources/colors_manager.dart';
import 'package:drosak_managment_app/core/resources/route_manager.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animationBottom;
  late Animation<Offset> _animationTop;
  @override
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..addStatusListener((status) {
        if(status == AnimationStatus.completed)
        {
          Navigator.of(context).pushReplacementNamed(RouteNames.kOnBoardingScreen);
        }
      });
    _animationBottom = Tween<Offset>(begin: Offset(0, 1), end: Offset.zero)
        .animate(CurvedAnimation(
            parent: _animationController, curve: Curves.easeInOut));
    _animationController.forward();
    _animationTop = Tween<Offset>(begin: Offset(0, -1), end: Offset.zero)
        .animate(CurvedAnimation(
            parent: _animationController, curve: Curves.easeInOut));
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
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
                position: _animationTop,
                child: Image.asset("assets/images/splash_border_image.png")),
            Image.asset("assets/images/logo.png"),
            Align(
                alignment: AlignmentDirectional.bottomEnd,
                child: SlideTransition(
                  position: _animationBottom,
                  child: Image.asset(
                      "assets/images/splash_border_image_bottom.png"),
                )),
          ],
        ),
      ),
    );
  }
}
