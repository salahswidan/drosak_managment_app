import 'package:drosak_managment_app/view/education_stages/widget/search/custom_list_search_education_stage_screen.dart';
import 'package:flutter/material.dart';
import '../../../../core/database/sqlflite/education_stage_operation.dart';
import '../custom_list_view_items_stage.dart';

class CustomSearchDelegatedEducationStage extends SearchDelegate<String> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, "");
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    EducationStageOperation educationStageOperation = EducationStageOperation();
    return query == ''
        ? SizedBox()
        : CustomListSearchEducationStageScreen(
            getSearchItemsStage:
                educationStageOperation.getSearchWord(searchWord: query));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Text(
        "buildSuggestions",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
