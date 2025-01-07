import 'package:drosak_managment_app/core/resources/route_manager.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     routes: RouteManager.routes,
     initialRoute:RouteNames.kSplashScreen,
    );
  }
}
