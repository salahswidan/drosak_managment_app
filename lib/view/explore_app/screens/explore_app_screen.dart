import 'package:drosak_managment_app/core/resources/colors_manager.dart';
import 'package:drosak_managment_app/core/resources/const_value.dart';
import 'package:flutter/material.dart';

import '../../../core/resources/font_manager.dart';
import '../widget/custom_app_bar_explore_screen.dart';

class ExploreAppScreen extends StatelessWidget {
  const ExploreAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: ColorsManager.kBlackColor,
        appBar: CustomAppBarExploreScreen(),
        body: Center(
          child: GridView.builder(
              padding: EdgeInsets.symmetric(
                horizontal: 30,
              ),
              itemCount: 5,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 39, mainAxisSpacing: 34),
              itemBuilder: (context, index) => Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(13)),
                        boxShadow: [
                          BoxShadow(
                              color: ColorsManager.kPrimaryColor,
                              blurRadius: 15,
                              blurStyle: BlurStyle.outer,
                              spreadRadius: 1,
                              offset: Offset(0, 0))
                        ]),
                    width: 220,
                    height: 120,
                  )),
        ),
      ),
    );
  }
}
