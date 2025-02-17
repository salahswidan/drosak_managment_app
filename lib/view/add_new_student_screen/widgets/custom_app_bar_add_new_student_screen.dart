import 'package:flutter/material.dart';

import '../../../core/resources/colors_manager.dart';
import '../../../core/resources/font_manager.dart';

class CustomAppBarAddNewStudentScreen extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarAddNewStudentScreen({
    super.key,
    required this.textAddOrEdit,
    required this.onPressed,
    required this.title,
  });
  final String textAddOrEdit;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        TextButton(
          onPressed: onPressed,
          child: Text(
            textAddOrEdit,
            style: TextStyle(
                color: Colors.white,
                fontFamily: FontName.geDinerOne,
                fontSize: 14,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
      backgroundColor: ColorsManager.kPrimaryColor,
      title: Text(
        title,
        style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: FontName.geDinerOne),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
