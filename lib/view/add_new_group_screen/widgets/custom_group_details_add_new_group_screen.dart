import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/resources/const_value.dart';
import '../../../core/resources/font_manager.dart';
import '../../../core/widget/input_field/custom_text_form_field.dart';

class CustomGroupDetailsAddNewGroupScreen extends StatelessWidget {
  const CustomGroupDetailsAddNewGroupScreen(
      {super.key,
      required this.formStateGroupDetails,
      required this.controllerGroupName,
      required this.controllerGroupDesc});
  final GlobalKey<FormState> formStateGroupDetails;
  final TextEditingController controllerGroupName;
  final TextEditingController controllerGroupDesc;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          ConstValue.kDetailsGroup,
          style:
              TextStyle(color: Colors.white, fontFamily: FontName.geDinerOne),
        ),
        SizedBox(
          height: 12.h,
        ),
        Row(
          children: [
            Expanded(
              child: Form(
                key: formStateGroupDetails,
                child: CustomTextFormField(
                  validator: (value) {
                    if (value == null || value == '') {
                      return ConstValue.kCantEmpty;
                    } else
                      return null;
                  },
                  hintText: ConstValue.kNameGroup,
                  controller: controllerGroupName,
                ),
              ),
            ),
            // SizedBox(
            //   width: 6.w,
            // ),
            // IconButton.filled(
            //     onPressed: () {},
            //     style: ElevatedButton.styleFrom(
            //         backgroundColor: ColorsManager.kPrimaryColor),
            //     icon: SvgPicture.asset(AssetsValuesManager.kPlaceholderSvg))
          ],
        ),
        SizedBox(
          height: 12.h,
        ),
        CustomTextFormField(
          maxLines: 3,
          hintText: ConstValue.kDescGroup,
          controller: controllerGroupDesc,
        ),
      ],
    );
  }
}
