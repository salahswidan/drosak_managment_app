import 'package:drosak_managment_app/core/resources/colors_manager.dart';
import 'package:drosak_managment_app/core/resources/const_value.dart';
import 'package:drosak_managment_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        body: Column(
          children: [
            SizedBox(
              height: 24.h,
            ),
            Expanded(
              child: GridView.builder(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  itemCount: 5,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 138.w / 108.h,
                      crossAxisCount: 2,
                      crossAxisSpacing: 39,
                      mainAxisSpacing: 34),
                  itemBuilder: (context, index) => Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            bottom: -16.h,
                            left: -16.h,
                            child: Container(
                              width: 32.w,
                              height: 32.h,
                              decoration: BoxDecoration(
                                  //   color: ColorsManager.kBlackColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(13)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: ColorsManager.kBlackColor,
                                        blurRadius: 15,
                                        blurStyle: BlurStyle.outer,
                                        spreadRadius: 1,
                                        offset: Offset(0, 0))
                                  ]),
                            ),
                          ),
                          Positioned(
                              bottom: -16.h,
                              left: -16.h,
                              child: CircleAvatar(
                                radius: 16.r,
                                backgroundColor: ColorsManager.kBlackColor,
                              )),
                          Positioned(
                              bottom: -10.h,
                              left: -10.h,
                              child: CircleAvatar(
                                radius: 10.r,
                                backgroundColor: ColorsManager.kPrimaryColor,
                              )),
                          Container(
                            decoration: BoxDecoration(
                                //color: Colors.red,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(13)),
                                boxShadow: [
                                  BoxShadow(
                                      color: ColorsManager.kPrimaryColor,
                                      blurRadius: 15,
                                      blurStyle: BlurStyle.outer,
                                      spreadRadius: 1,
                                      offset: Offset(0, 0))
                                ]),
                          ),
                        ],
                      )),
            ),
          ],
        ),
      ),
    );
  }
}
