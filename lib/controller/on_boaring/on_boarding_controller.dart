import 'dart:async';

import 'package:drosak_managment_app/core/resources/const_value.dart';
import 'package:flutter/material.dart';

class OnBoardingController {
  int currentIndex = 0;
  PageController pageControllerOnBoardingScreen =
      PageController(initialPage: 0);
  late StreamController<int> streamControllerDotIndicator;
  late Sink<int> inputDotIndicator;
  late Stream<int> outputDotIndicator;
  OnBoardingController() {
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
    inputDotIndicator.add(currentIndex);
  }

  void skip() {}
}
