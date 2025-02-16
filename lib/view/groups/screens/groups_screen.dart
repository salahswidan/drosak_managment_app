import 'package:drosak_managment_app/core/resources/const_value.dart';
import 'package:drosak_managment_app/core/widget/app_bar/custom_app_bar_title_add_search.dart';
import 'package:flutter/material.dart';
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
    _controller = GroupsScreenController(context);
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Column(
          children: [
            CustomAppBarTitleAddSearch(
                streamCount: _controller.outPutDataListItemGroupModel,
                title: ConstValue.kGroups,
                // outPutDataListItemsStageModel:
                //     _controller.GroupsScreenController,
                onPressedAdd: () {
                  _controller.addNewGroups(context: context);
                },
                onPressedSearch: () {
                  _controller.onPressedSearch();
                }),
            CustomListViewItemGroups(
                onRefresh: _controller.onRefresh,
                outPutDataListItemsGroupModel:
                    _controller.outPutDataListItemGroupModel,
                deleteFun: _controller.deleteGroupInfo,
                editFun: (groupInfoModel) {
                  _controller.editGroupInfo(
                    groupInfoModel,
                  );
                }),
          ],
        ),
      ),
    );
  }
}
