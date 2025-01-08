import 'package:drosak_managment_app/core/resources/const_value.dart';
import 'package:drosak_managment_app/core/resources/route_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(
          ConstValue.widthDesignScreen, ConstValue.heightDesignScreen),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: RouteManager.routes,
        initialRoute: RouteNames.kSplashScreen,
      ),
    );
  }
}
