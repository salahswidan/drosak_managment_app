import 'dart:async';

import 'package:drosak_managment_app/core/resources/const_value.dart';
import 'package:drosak_managment_app/core/resources/route_manager.dart';
import 'package:flutter/material.dart';

class OnBoardingController {
  int currentIndex = 0;
  final PageController pageController;
  late StreamController<int> streamControllerDotIndicator;
  late Sink<int> inputDotIndicator;
  late Stream<int> outputDotIndicator;

  OnBoardingController({required this.pageController}) {
    initController();
  }

  void initController() {
    streamControllerDotIndicator = StreamController();
    inputDotIndicator = streamControllerDotIndicator.sink;
    outputDotIndicator = streamControllerDotIndicator.stream;
    inputDotIndicator.add(currentIndex);
  }

  void disposeController() {
    streamControllerDotIndicator.close();
    inputDotIndicator.close();
  }

  void goNext() {
    if (currentIndex + 1 >= ConstListValues.listOnBoardingModel.length) {
      currentIndex = 0;
    } else {
      currentIndex++;
    }
    pageController.animateToPage(currentIndex,
        duration: Duration(seconds: 1), curve: Curves.easeInOut);

    inputDotIndicator.add(currentIndex);
  }

  void skip(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(
        RouteNames.kExploreAppScreen, (route) => false);
  }
}
