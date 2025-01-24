import 'dart:async';
import 'package:drosak_managment_app/core/resources/const_value.dart';
import 'package:drosak_managment_app/model/main_screen/tabs_details_model.dart';
import 'package:drosak_managment_app/view/audience/screens/audience_screen.dart';
import 'package:drosak_managment_app/view/education_stages/screens/education_stages_screen.dart';
import 'package:drosak_managment_app/view/groups/screens/groups_screen.dart';
import 'package:drosak_managment_app/view/paying/screens/paying_screen.dart';
import 'package:drosak_managment_app/view/students/screens/students_screen.dart';
import 'package:flutter/material.dart';
import '../../core/resources/assets_values_manager.dart';

class MainScreenController {
  int currentIndexScreen = 0;
  late StreamController<int> controllerBody;
  late Sink<int> inputDataBody;
  late Stream<int> outDataBody;
  late StreamController<int> controllerBottonNavBar;
  late Sink<int> inPutDataBottonNavBar;
  late Stream<int> outPutBottonNavBar;
  MainScreenController() {
  initController();
  }
   void initController() {
      controllerBody = StreamController<int>();
    inputDataBody = controllerBody.sink;
    outDataBody = controllerBody.stream;
    inputDataBody.add(currentIndexScreen);

     controllerBottonNavBar = StreamController<int>();
    inPutDataBottonNavBar = controllerBottonNavBar.sink;
    outPutBottonNavBar  = controllerBottonNavBar.stream;
        inPutDataBottonNavBar.add(currentIndexScreen);

   }
   void disposeControllers() {
    controllerBody.close();
    inputDataBody.close();
    inPutDataBottonNavBar.close();
    controllerBottonNavBar.close(); 
  }

  List<TabsDetailsModel> listBottomNavBarTabModel = [
    TabsDetailsModel(
      imageIconSvg: AssetsValuesManager.kPaymentImageSvg,
      text: ConstValue.kPaying,
      screen: PayingScreen(),
    ),
    TabsDetailsModel(
      imageIconSvg: AssetsValuesManager.kGroupsImageSvg,
      text: ConstValue.kGroups,
      screen: GroupsScreen(),
    ),
    TabsDetailsModel(
      imageIconSvg: AssetsValuesManager.kStudentsImageSvg,
      text: ConstValue.kStudents,
      screen: StudentsScreen(),
    ),
    TabsDetailsModel(
      imageIconSvg: AssetsValuesManager.kEducationalStagesImageSvg,
      text: ConstValue.kEducationalStages,
      screen: EducationStagesScreen(),
    ),
    TabsDetailsModel(
      imageIconSvg: AssetsValuesManager.kTheAudienceImageSvg,
      text: ConstValue.kTheAudience,
      screen: AudienceScreen(),
    ),
  ];
  void onTapAtTabItemBottomNavBar(int index) {
    currentIndexScreen = index;
        inputDataBody.add(currentIndexScreen);
                inPutDataBottonNavBar.add(currentIndexScreen);


  }
}
