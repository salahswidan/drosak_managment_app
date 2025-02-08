import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../model/education_stage/item_stage_model.dart';
import '../../resources/colors_manager.dart';
import '../../resources/const_value.dart';
import '../../resources/font_manager.dart';

class CustomAppBarTitleAddSearch extends StatelessWidget {
  const CustomAppBarTitleAddSearch({
    super.key,
    required this.onPressedAdd,
    required this.onPressedSearch,
   // this.outPutDataListItemsStageModel,
    required this.title, required this.streamCount,
  });
  final VoidCallback onPressedAdd;
  final VoidCallback onPressedSearch;
  //! here
 // final Stream<List<ItemStageModel>>? outPutDataListItemsStageModel;
 final Stream<List> streamCount;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.bottomCenter,
      height: 75.h,
      width: double.infinity,
      color: ColorsManager.kPrimaryColor,
      padding: EdgeInsets.only(right: 15.w, left: 15.w, top: 24.h),
      child: Row(
        children: [
          StreamBuilder<List>(
            stream: streamCount,
            builder: (context, snapshot) => Text(
              '${title}    (${snapshot.data == null ? "0" : snapshot.data!.length})',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.sp,
                  fontFamily: FontName.geDinerOne,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Spacer(),
          IconButton(
            icon: const Icon(
              Icons.add_circle_outline,
              size: 30,
              color: Colors.white,
            ),
            onPressed: onPressedAdd,
          ),
          IconButton(
            icon: const Icon(
              Icons.search,
              size: 30,
              color: Colors.white,
            ),
            onPressed: onPressedSearch,
          ),
        ],
      ),
    );
  }
}
