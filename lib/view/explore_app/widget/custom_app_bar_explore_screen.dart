
import 'package:flutter/material.dart';

import '../../../core/resources/colors_manager.dart';
import '../../../core/resources/const_value.dart';
import '../../../core/resources/font_manager.dart';

class CustomAppBarExploreScreen extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarExploreScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: const Text(
        ConstValue.kExploreApp,
        style: TextStyle(
            fontSize: 20,
            fontFamily: FontName.aaGalaxy,
            color: ColorsManager.kPrimaryColor,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
