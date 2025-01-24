import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/resources/colors_manager.dart';
import '../../../../model/main_screen/tabs_details_model.dart';

class CustomBottonNavBarMainScreen extends StatelessWidget {
  CustomBottonNavBarMainScreen({
    super.key,
    required this.listIcon,
    required this.outPutBottonNavBar,
    required this.onTap,
  });
  final List<TabsDetailsModel> listIcon;
  final ValueChanged<int> onTap;
  final Stream<int> outPutBottonNavBar;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: outPutBottonNavBar,
      builder: (context, snapshot) => BottomNavigationBar(
        onTap: onTap,
        currentIndex: snapshot.data == null ? 0 : snapshot.data!,
        unselectedItemColor: ColorsManager.kGreyLight,
        selectedItemColor: ColorsManager.kPrimaryColor,
        type: BottomNavigationBarType.fixed,
        backgroundColor: ColorsManager.kBlackLight,
        items: [
          for (int i = 0; i < listIcon.length; i++)
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                listIcon[i].imageIconSvg,
                colorFilter: ColorFilter.mode(
                    i != (snapshot.data ?? 0)
                        ? ColorsManager.kGreyLight
                        : ColorsManager.kPrimaryColor,
                    BlendMode.srcIn),
              ),
              label: listIcon[i].text,
            ),
        ],
      ),
    );
  }
}
