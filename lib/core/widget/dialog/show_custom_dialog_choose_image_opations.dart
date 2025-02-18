import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../resources/colors_manager.dart';
import '../../resources/const_value.dart';
import '../../resources/font_manager.dart';

void showCustomDialogChooseImage({
  required BuildContext context,
  required VoidCallback onPressedPickImageByGallery,
  required VoidCallback onPressedPickImageByCamera,
}) {
  showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) => true
          ? AlertDialog(
              titlePadding: EdgeInsets.zero,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16))),
              backgroundColor: ColorsManager.kGrey3,
              title: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () {
                      onPressedPickImageByGallery();
                    },
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
                      child: Row(
                        children: [
                          Expanded(
                              child: Text(
                            ConstValue.kPhotoLibrary,
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontFamily: FontName.geDinerOne),
                          )),
                          Icon(
                            Icons.photo_library,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(),
                  InkWell(
                    onTap: () {
                      onPressedPickImageByCamera();
                    },
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
                      child: Row(
                        children: [
                          Expanded(
                              child: Text(
                            ConstValue.kTakePhoto,
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontFamily: FontName.geDinerOne),
                          )),
                          Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          : AlertDialog(
              title:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                IconButton.filled(
                  iconSize: 50,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorsManager.kPrimaryColor,
                  ),
                  onPressed: onPressedPickImageByGallery,
                  icon: const Icon(Icons.image),
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
                  icon: const Icon(Icons.camera_alt),
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
