import 'package:drosak_managment_app/view/on_boarding/screens/on_boarding_screen.dart';
import 'package:drosak_managment_app/view/splash/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class RouteManager {
  static Map<String, WidgetBuilder> routes = {
    RouteNames.kSplashScreen: (context) => const SplashScreen(),
    RouteNames.kOnBoardingScreen: (context) => const OnBoardingScreen(),
  };
}class RouteNames{

  static const String kSplashScreen = '/KSplashScreen';
  static const String kOnBoardingScreen = '/kOnBoardingScreen';
}