import 'package:drosak_managment_app/core/database/sqlflite/groups_operation.dart';
import 'package:drosak_managment_app/core/resources/const_value.dart';
import 'package:drosak_managment_app/core/widget/app_bar/custom_app_bar_title_add_search.dart';
import 'package:drosak_managment_app/model/education_stage/item_stage_model.dart';
import 'package:flutter/material.dart';
import '../../../controller/education_stage/education_stage_controller.dart';
import '../../../controller/groups/groups_screen_controller.dart';
import '../widgets/custom_list_view_item_groups.dart';

class GroupsScreen extends StatefulWidget {
  const GroupsScreen({super.key});

  @override
  State<GroupsScreen> createState() => _EducationStagesScreenState();
}

class _EducationStagesScreenState extends State<GroupsScreen> {
  late GroupsScreenController _controller;

  //Stream<List<ItemStageModel>> outPutDataListItemsStageModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = GroupsScreenController();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Column(
          children: [
            CustomAppBarTitleAddSearch(
                streamCount: _controller.outPutDataListItemsGroupModel,
                title: ConstValue.kGroups,
                // outPutDataListItemsStageModel:
                //     _controller.GroupsScreenController,
                onPressedAdd: () {
                  _controller.addNewGroup(context: context);
                },
                onPressedSearch: () {
                  //   _controller.showCustomSearch(context);
                }),
            CustomListViewItemGroups(
                // onRefresh: _controller.onRefresh,
                outPutDataListItemsGroupModel:
                    _controller.outPutDataListItemsGroupModel,
                deleteFun: (ItemStageModel) {},
                editFun: (itemStageModel) {
                  // _controller.editItemStage(itemStageModel, context);
                }),
          ],
        ),
      ),
    );
  }
}
