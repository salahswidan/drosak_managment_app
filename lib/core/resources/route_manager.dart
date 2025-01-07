import 'package:drosak_managment_app/view/splash/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class RouteManager {
  static Map<String, WidgetBuilder> routes = {
    RouteNames.kSplashScreen: (context) => const SplashScreen(),
  };
}class RouteNames{

  static const String kSplashScreen = '/KSplashScreen';
}