import 'package:drosak_managment_app/core/resources/const_value.dart';
import 'package:drosak_managment_app/model/main_screen/bottom_nav_bar_tab_model.dart';
import '../../core/resources/assets_values_manager.dart';

class MainScreenController {
  List<BottomNavBarTabModel> listBottomNavBarTabModel = [
    BottomNavBarTabModel(
      imageIconSvg: AssetsValuesManager.kPaymentImageSvg,
      text: ConstValue.kPaying,
    ),
    BottomNavBarTabModel(
      imageIconSvg: AssetsValuesManager.kGroupsImageSvg,
      text: ConstValue.kGroups,
    ),
    BottomNavBarTabModel(
      imageIconSvg: AssetsValuesManager.kStudentsImageSvg,
      text: ConstValue.kStudents,
    ),
    BottomNavBarTabModel(
      imageIconSvg: AssetsValuesManager.kEducationalStagesImageSvg,
      text: ConstValue.kEducationalStages,
    ),
    BottomNavBarTabModel(
      imageIconSvg: AssetsValuesManager.kTheAudienceImageSvg,
      text: ConstValue.kTheAudience,
    ),
  ];
}
