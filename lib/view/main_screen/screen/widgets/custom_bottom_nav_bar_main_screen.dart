

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/resources/colors_manager.dart';
import '../../../../model/main_screen/bottom_nav_bar_tab_model.dart';

class CustomBottonNavBarMainScreen extends StatelessWidget {
  CustomBottonNavBarMainScreen({
    super.key,
    required this.listIcon,
  });
  final List<BottomNavBarTabModel> listIcon;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 1,
      unselectedItemColor: ColorsManager.kGreyLight,
      selectedItemColor: ColorsManager.kPrimaryColor,
      type: BottomNavigationBarType.fixed,
      backgroundColor: ColorsManager.kBlackLight,
      items: [
        for (int i = 0; i < listIcon.length; i++)
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              listIcon[i].imageIconSvg,
            ),
            label: listIcon[i].text,
          ),
      ],
    );
  }
}
