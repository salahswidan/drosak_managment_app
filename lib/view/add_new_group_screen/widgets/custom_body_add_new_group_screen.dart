import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../controller/add_new_group/add_new_group_controller.dart';
import '../../../core/resources/colors_manager.dart';
import '../../../core/resources/const_value.dart';
import '../../../core/resources/font_manager.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:drosak_managment_app/core/widget/buttons/custom_material_button.dart';

import 'custom_group_details_add_new_group_screen.dart';

class CustomBodyAddNewGroupScreen extends StatelessWidget {
  const CustomBodyAddNewGroupScreen({
    super.key,
    required this.controller,
  });
  final AddNewGroupScreenController controller;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.h),
          width: double.infinity,
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomGroupDetailsAddNewGroupScreen(
                  controllerGroupDesc: controller.controllerGroupDesc,
                  controllerGroupName: controller.controllerGroupName,
                  formStateGroupDetails: controller.formStateGroupDetails,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(
                    thickness: 1,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    ConstValue.kChooseEducationStage,
                    style: TextStyle(
                        fontFamily: FontName.geDinerOne,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                CustomDropdown<String>.search(
                  hintText: ConstValue.kChooseEducationStage,
                  items: [],
                  noResultFoundText: ConstValue.kNoFoundThisEducationStageName,
                  //initialItem: 'a',
                  onChanged: (value) {
                    print('chaning value to :  $value');
                  },
                ),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  children: [
                    Text(ConstValue.kDay,
                        style: TextStyle(
                            fontFamily: FontName.geDinerOne,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    SizedBox(
                      width: 15.w,
                    ),
                    Expanded(
                      child: CustomDropdown<String>.search(
                        hintText: ConstValue.kChooseDay,
                        items: [],
                        noResultFoundText: '',
                        //initialItem: 'a',
                        onChanged: (value) {
                          print('chaning value to :  $value');
                        },
                      ),
                    ),
                    SizedBox(
                      width: 9.w,
                    ),
                    Text(ConstValue.kTime,
                        style: TextStyle(
                            fontFamily: FontName.geDinerOne,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    SizedBox(
                      width: 15.w,
                    ),
                    Expanded(
                      child: CustomDropdown<String>.search(
                        hintText: ConstValue.kChooseTime,
                        items: [],
                        noResultFoundText: "",
                        //initialItem: 'a',
                        onChanged: (value) {
                          print('chaning value to :  $value');
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 24.h,
                ),
                CustomMaterialButton(
                    onPressed: () {}, text: ConstValue.kAddToTableAppointment),
                SizedBox(
                  height: 12.h,
                ),
                Table(
                  border: TableBorder.all(
                    borderRadius: BorderRadius.all(Radius.circular(14.r)),
                    color: Colors.white,
                  ),
                  children: [
                    const TableRow(
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                          child: const Center(
                            child: Text(
                              "اليوم",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: FontName.geDinerOne),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                          child: const Center(
                            child: Text(
                              "الوقت",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: FontName.geDinerOne),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                          child: Center(
                            child: Text(
                              "م / ص",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: FontName.geDinerOne),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                          child: Center(
                            child: Text(
                              "حذف",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: FontName.geDinerOne),
                            ),
                          ),
                        ),
                      ],
                      decoration: BoxDecoration(
                          color: ColorsManager.kPrimaryColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(14),
                            topRight: Radius.circular(14),
                          )),
                    ),
                    for (int i = 0; i < 5; i++)
                      TableRow(
                        children: List.generate(
                            4,
                            (index) => Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 4, vertical: 4),
                                  child: index == 3
                                      ? IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.delete,
                                            color: ColorsManager.kPrimaryColor,
                                          ))
                                      : Text(
                                          index.toString(),
                                          style: TextStyle(color: Colors.white),
                                        ),
                                )),
                      ),
                  ],
                ),

                // StreamBuilder(
                //     stream: outPutPathImage,
                //     builder: (context, snapshot) {
                //       return snapshot.connectionState == ConnectionState.waiting
                //           ? const Center(
                //               child: CircularProgressIndicator(),
                //             )
                //           : snapshot.data != null && snapshot.data!.trim != ''
                //               ? Column(
                //                   children: [
                //                     Stack(children: [
                //                       Image.file(
                //                         errorBuilder:
                //                             (context, error, stackTrace) {
                //                           return const Text(
                //                             "not found",
                //                             style: TextStyle(color: Colors.red),
                //                           );
                //                         },
                //                         File(snapshot.data!),
                //                         width: double.infinity,
                //                         fit: BoxFit.cover,
                //                       ),
                //                       IconButton(
                //                         onPressed: onPressedDeleteImage,
                //                         icon: Icon(
                //                           Icons.delete,
                //                         ),
                //                         style: ElevatedButton.styleFrom(
                //                             backgroundColor: Colors.red),
                //                       ),
                //                     ]),
                //                     SizedBox(
                //                       height: 24.h,
                //                     ),
                //                   ],
                //                 )
                //               : SizedBox();
                //     }),
              ]),
        ),
      ),
    );
  }
}
