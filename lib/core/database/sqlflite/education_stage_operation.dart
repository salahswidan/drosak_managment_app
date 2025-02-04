import '../../../model/education_stage/item_stage_model.dart';
import 'my_sqlflite_database.dart';

class EducationStageOperation extends MySqlFliteDatabase {
  Future<bool> insertEducationDetails(ItemStageModel itemStageModel) {
    return insert(
        tableName: MySqlFliteDatabase.educationalStageTableName,
        values: itemStageModel.toJson()); 
  }

  Future<List<ItemStageModel>> getAllEducationData() async {
    List<ItemStageModel> listItemStageModel = [];
    List<Map<String, Object?>> data =
        await select(tableName: MySqlFliteDatabase.educationalStageTableName);
   
    listItemStageModel+= data.map((item) => ItemStageModel.fromJson(item)).toList();
    print(listItemStageModel);
    return listItemStageModel;
  }
}
