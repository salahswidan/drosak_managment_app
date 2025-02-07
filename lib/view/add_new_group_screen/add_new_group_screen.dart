import 'package:drosak_managment_app/core/resources/colors_manager.dart';
import 'package:drosak_managment_app/core/resources/const_value.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../controller/add_new_group/add_new_group_controller.dart';
import '../../core/resources/assets_values_manager.dart';
import '../../core/resources/font_manager.dart';
import '../../core/widget/input_field/custom_text_form_field.dart';
import 'widgets/custom_app_bar_add_new_group_screen.dart';

class AddNewGroupScreen extends StatefulWidget {
  const AddNewGroupScreen({super.key});

  @override
  State<AddNewGroupScreen> createState() => _AddNewGroupScreenState();
}

class _AddNewGroupScreenState extends State<AddNewGroupScreen> {
  late AddNewGroupController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AddNewGroupController();
  }

  @override
  Widget build(BuildContext context) {
    _controller.getArgumentFromLastScreen(context);
    return Scaffold(
      appBar: CustomAppBarAddNewGroupScreen(
          textAddOrEdit: _controller.status == ConstValue.kAddNewGroup
              ? ConstValue.kAdd
              : ConstValue.kEdit,
          title: _controller.status,
          onPressed: () {}),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.h),
                  width: double.infinity,
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    Row(
                      children: [
                        Expanded(
                          child: Form(
                            key: GlobalKey<FormState>(),
                            child: CustomTextFormField(
                              validator: (value) {
                                if (value == null || value == '') {
                                  return ConstValue.kCantEmpty;
                                } else
                                  return null;
                              },
                              hintText: ConstValue.kNameGroup,
                              controller: TextEditingController(),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 6.w,
                        ),
                        IconButton.filled(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: ColorsManager.kPrimaryColor),
                            icon: SvgPicture.asset(
                                AssetsValuesManager.kPlaceholderSvg))
                      ],
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    CustomTextFormField(
                      maxLines: 3,
                      hintText: ConstValue.kDescGroup,
                      controller: TextEditingController(),
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
                    Container(
                      width: double.infinity,
                      child: DropdownButton(items: [
                        DropdownMenuItem(
                          child: Text("data"),
                        )
                      ], onChanged: (value) {}),
                    )
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
            )
          ],
        ),
      ),
    );
  }
}
