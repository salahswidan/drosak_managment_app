import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../resources/colors_manager.dart';
import '../../resources/const_value.dart';
import '../../resources/font_manager.dart';

void showCustomDialogChooseImage({
  required BuildContext context,
  required VoidCallback? onPressedPickImageByGallery,
  required VoidCallback? onPressedPickImageByCamera,
}) {
 
 
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
            title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              IconButton.filled(
                iconSize: 50,
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsManager.kPrimaryColor,
                ),
                onPressed: onPressedPickImageByGallery,
                icon: Icon(Icons.image),
              ),
              SizedBox(
                width: 30.w,
              ),
              IconButton.filled(
                iconSize: 50,
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsManager.kPrimaryColor,
                ),
                onPressed: onPressedPickImageByCamera,
                icon: Icon(Icons.camera_alt),
              ),
            ]),
            icon: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton.filled(
                  iconSize: 10,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.close,
                    size: 20.0,
                    color: Colors.white,
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                ),
                const Text(
                  ConstValue.kChooseFrom,
                  style: TextStyle(
                      fontFamily: FontName.geDinerOne,
                      fontWeight: FontWeight.w900,
                      fontSize: 15),
                ),
              ],
            ),
          ));
}
