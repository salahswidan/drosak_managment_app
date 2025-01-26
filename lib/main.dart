import 'package:drosak_managment_app/core/resources/const_value.dart';
import 'package:drosak_managment_app/core/resources/route_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/resources/colors_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
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
        theme: ThemeData(
          scaffoldBackgroundColor: ColorsManager.kBlackColor,
        ),
        debugShowCheckedModeBanner: false,
        routes: RouteManager.routes,
        initialRoute: RoutesName.kOnBoardingScreen,
      ),
    );
  }
}
