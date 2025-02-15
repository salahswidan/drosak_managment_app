import 'package:drosak_managment_app/core/resources/colors_manager.dart';
import 'package:drosak_managment_app/core/resources/const_value.dart';
import 'package:drosak_managment_app/view/education_stages/widget/search/custom_list_search_education_stage_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/database/sqlflite/education_stage_operation.dart';
import '../../../../model/education_stage/item_stage_model.dart';

class CustomSearchDelegated extends SearchDelegate<String> {
  Widget Function(String query) myBuildResult;
  CustomSearchDelegated({required this.myBuildResult});

  @override
  ThemeData appBarTheme(BuildContext context) {
    // TODO: implement appBarTheme
    return super.appBarTheme(context).copyWith(
        textTheme: super.appBarTheme(context).textTheme!.copyWith(
              titleLarge: TextStyle(
                color: Colors.white,
                fontSize: 20.sp,
              ),
            ),
        appBarTheme: AppBarTheme(color: ColorsManager.kPrimaryColor),
        inputDecorationTheme:
            InputDecorationTheme(hintStyle: TextStyle(color: Colors.white)));
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(
          Icons.close,
          color: Colors.white,
        ),
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
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
   // EducationStageOperation educationStageOperation = EducationStageOperation();
    // return query == ''
    //     ? SizedBox()
    //     : CustomListSearchEducationStageScreen(
    //         getSearchItemsStage:
    //             educationStageOperation.getSearchWord(searchWord: query),
    //         deleteFun: deleteFun,
    //         editFun: editFun,
    //       );
    return myBuildResult(query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Text(
        ConstValue.kContentSearch,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
