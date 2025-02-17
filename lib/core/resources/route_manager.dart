import 'package:drosak_managment_app/view/add_new_group_screen/add_new_group_screen.dart';
import 'package:drosak_managment_app/view/add_new_student_screen/add_new_student_screen.dart';
import 'package:drosak_managment_app/view/audience/screens/audience_screen.dart';
import 'package:drosak_managment_app/view/education_stages/screens/education_stages_screen.dart';
import 'package:drosak_managment_app/view/explore_app/screens/explore_app_screen.dart';
import 'package:drosak_managment_app/view/groups/screens/groups_screen.dart';
import 'package:drosak_managment_app/view/main_screen/screen/main_screen.dart';
import 'package:drosak_managment_app/view/on_boarding/screens/on_boarding_screen.dart';
import 'package:drosak_managment_app/view/paying/screens/paying_screen.dart';
import 'package:drosak_managment_app/view/splash/screens/splash_screen.dart';
import 'package:drosak_managment_app/view/students/screens/students_screen.dart';
import 'package:flutter/material.dart';

class RouteManager {
  static Map<String, WidgetBuilder> routes = {
    RoutesName.kSplashScreen: (context) => const SplashScreen(),
    RoutesName.kOnBoardingScreen: (context) => const OnBoardingScreen(),
    RoutesName.kExploreAppScreen: (context) => const ExploreAppScreen(),
    RoutesName.kMainScreen: (context) => const MainScreen(),
    RoutesName.kPayingScreen: (context) => const PayingScreen(),
    RoutesName.kEducationStagesScreen: (context) =>
        const EducationStagesScreen(),
    RoutesName.kAudienceScreen: (context) => const AudienceScreen(),
    RoutesName.kGroupsScreen: (context) => const GroupsScreen(),
    RoutesName.kStudentsScreen: (context) => const StudentsScreen(),
    RoutesName.kAddGroupScreen: (context) => const AddNewGroupScreen(),
      RoutesName.kAddNewStudentsScreen: (context) => const AddNewStudentScreen(),

  };
}

class RoutesName {
  static const String kSplashScreen = '/KSplashScreen';
  static const String kOnBoardingScreen = '/kOnBoardingScreen';
  static const String kExploreAppScreen = '/kExploreAppScreen';
  static const String kMainScreen = '/kMainScreen';
  static const String kPayingScreen = '/kPayingScreen';
  static const String kEducationStagesScreen = '/kEducationStagesScreen';
  static const String kAudienceScreen = '/kAudienceScreen';
  static const String kGroupsScreen = '/kGroupsScreen';
  static const String kStudentsScreen = '/kStudentsScreen';
  static const String kAddGroupScreen = '/kAddGroupScreen';
  static const String kAddNewStudentsScreen = '/kAddNewStudentsScreen';
}
