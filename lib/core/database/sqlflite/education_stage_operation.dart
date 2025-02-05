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
    List<Map<String, Object?>> data = await select(
        tableName: MySqlFliteDatabase.educationalStageTableName,
        where: '${MySqlFliteDatabase.educationalStageStatus}== ?',
        whereArgs: ['1']);
    listItemStageModel +=
        data.map((item) => ItemStageModel.fromJson(item)).toList();
    print(listItemStageModel);
    return listItemStageModel;
  }

  Future<bool> softDelete(ItemStageModel itemStageModel) async {
    return await update(
        tableName: MySqlFliteDatabase.educationalStageTableName,
        values: {MySqlFliteDatabase.educationalStageStatus: 0},
        where:
            '${MySqlFliteDatabase.educationalStageID}==${itemStageModel.id}');
  }

  Future<List<ItemStageModel>> getSearchWord(
      {required String searchWord}) async {
    List<ItemStageModel> listItemStageModel = [];
    List<Map<String, Object?>> data = await search(
        tableName: MySqlFliteDatabase.educationalStageTableName,
        searchWord: searchWord);

    listItemStageModel +=
        data.map((item) => ItemStageModel.fromJson(item)).toList();
    print(listItemStageModel);
    return listItemStageModel;
  }
}
