import 'package:drosak_managment_app/model/audience/audience_model.dart';
import 'package:drosak_managment_app/model/student/student_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../controller/audience/audience_controller.dart';
import '../../../core/resources/const_value.dart';
import '../../../core/widget/app_bar/custom_app_bar_title_add_search.dart';
import 'widgets/custom_item_audience.dart';
import 'widgets/custom_select_education_stage_name_audience_screen.dart';
import 'widgets/custom_select_group_name_audience_screen.dart';

class AudienceScreen extends StatefulWidget {
  const AudienceScreen({super.key});

  @override
  State<AudienceScreen> createState() => _AudienceScreenState();
}

class _AudienceScreenState extends State<AudienceScreen> {
  late AudienceController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AudienceController(context);
  }

  @override
  void dispose() {
    _controller.disposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Column(
          children: [
            CustomAppBarTitleAddSearch(
              title: ConstValue.kTheAudience,
              // outPutDataListItemsStageModel:
              //     _controller.GroupsScreenController,
              onPressedAdd: _controller.onPressedAdd,
              onPressedSearch: null,
            ),
            CustomSelectEducationStageNameAudienceScreen(
              onChange: _controller.onChangedSelectEducationStageName,
              outPutDataInitiaItem:
                  _controller.outPutDataInitiaItemSelectedStage,
              outPutDataListItemStageModel:
                  _controller.outPutDataListItemStageModel,
            ),
            CustomSelectGroupNameAudienceScreen(
              outPutDataInitialSelectedGroup:
                  _controller.outPutDataInitiaItemSelectedGroup,
              onChange: _controller.onChangedSelectGroupName,
              outPutDataListItemGroupsDetails:
                  _controller.outPutDataListItemGroupDetails,
            ),
            CustomGridViewAudienceScreen(
              outPutDataInitiaIAudienceModel:
                  _controller.outPutDataInitiaIAudienceModel,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomGridViewAudienceScreen extends StatelessWidget {
  const CustomGridViewAudienceScreen({
    super.key,
    required this.outPutDataInitiaIAudienceModel,
  });
  final Stream<List<AudienceModel>> outPutDataInitiaIAudienceModel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder<List<AudienceModel>>(
          stream: outPutDataInitiaIAudienceModel,
          builder: (context, snapshot) => snapshot.data == null
              ? SizedBox()
              : GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 160.h,
                      mainAxisSpacing: 30.h),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) => CustomItemAudience(
                        deleteFun: (itemStageModel) {},
                        editFun: (itemStageModel) {},
                        audienceModel: snapshot.data![index],
                      ))),
    );
  }
}
