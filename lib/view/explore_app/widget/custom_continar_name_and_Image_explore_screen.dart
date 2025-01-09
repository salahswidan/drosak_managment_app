import 'package:drosak_managment_app/model/explore/explore_screen_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/resources/colors_manager.dart';
import '../../../core/resources/font_manager.dart';

class CustomContinarNameAndImageExploreScreen extends StatelessWidget {
  const CustomContinarNameAndImageExploreScreen({
    super.key, required this.exploreScreenModel,
  });
  final ExploreScreenModel exploreScreenModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 3.h),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12.r)),
              color: ColorsManager.kPrimaryColor,
            ),
            child: Text(
            exploreScreenModel.text,
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: FontName.geDinerOne,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
            margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 6.h),
          ),
          SvgPicture.asset(
           exploreScreenModel.image,
            width: 95.w,
            height: 63.h,
          ),
        ],
      ),
      decoration: BoxDecoration(
          //color: Colors.red,
          borderRadius: BorderRadius.all(Radius.circular(13)),
          boxShadow: [
            BoxShadow(
                color: ColorsManager.kPrimaryColor,
                blurRadius: 15,
                blurStyle: BlurStyle.outer,
                spreadRadius: 1,
                offset: Offset(0, 0))
          ]),
    );
  }
}
