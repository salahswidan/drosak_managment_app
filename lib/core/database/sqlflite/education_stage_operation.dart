import '../../../model/education_stage/item_stage_model.dart';
import 'my_sqlflite_database.dart';

class EducationStageOperation extends MySqlFliteDatabase {
  Future<bool> insertEducationDetails(ItemStageModel itemStageModel) {
    return insert(
        tableName: MySqlFliteDatabase.educationalStageTableName,
        values: {
          MySqlFliteDatabase.educationalStageName: itemStageModel.stageName,
          MySqlFliteDatabase.educationalStageDesc: itemStageModel.desc,
          MySqlFliteDatabase.educationalStageImage: itemStageModel.image,
        });
  }

  Future<List<ItemStageModel>> getAllEducationData() async {
    List<ItemStageModel> listItemStageModel = [];
    List<Map<String, Object?>> data =
        await select(tableName: MySqlFliteDatabase.educationalStageTableName);
    for (var item in data) {
      listItemStageModel.add(ItemStageModel.fromJson(item));
    }
    return listItemStageModel;
  }
}
