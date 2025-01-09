import 'package:drosak_managment_app/view/explore_app/screens/explore_app_screen.dart';
import 'package:drosak_managment_app/view/main_screen/screen/main_screen.dart';
import 'package:drosak_managment_app/view/on_boarding/screens/on_boarding_screen.dart';
import 'package:drosak_managment_app/view/splash/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class RouteManager {
  static Map<String, WidgetBuilder> routes = {
    RouteNames.kSplashScreen: (context) => const SplashScreen(),
    RouteNames.kOnBoardingScreen: (context) => const OnBoardingScreen(),
    RouteNames.kExploreAppScreen: (context) => const ExploreAppScreen(),
    RouteNames.kMainScreen: (context) => const MainScreen(),
  };
}class RouteNames{

  static const String kSplashScreen = '/KSplashScreen';
  static const String kOnBoardingScreen = '/kOnBoardingScreen';
  static const String kExploreAppScreen = '/kExploreAppScreen';
  static const String kMainScreen = '/kMainScreen';
}