import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/resources/colors_manager.dart';
import '../../../../model/main_screen/tabs_details_model.dart';

class CustomBottonNavBarMainScreen extends StatelessWidget {
  CustomBottonNavBarMainScreen({
    super.key,
    required this.listIcon, required this.onTap,
  });
  final List<TabsDetailsModel> listIcon;
  final ValueChanged<int> onTap;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTap,
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
