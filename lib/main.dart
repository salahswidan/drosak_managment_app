import 'package:drosak_managment_app/core/resources/const_value.dart';
import 'package:drosak_managment_app/core/resources/route_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/database/sqlflite/education_stage_operation.dart';
import 'core/resources/colors_manager.dart';
import 'model/education_stage/item_stage_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  EducationStageOperation educationStageOperation = EducationStageOperation();
  bool inserted = await educationStageOperation.insertEducationDetails(
    ItemStageModel(
      id: 1,
      stageName: 'stage1',
      desc: 'description1',
      image: 'image1',
    ),
  );
  print(inserted);
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
