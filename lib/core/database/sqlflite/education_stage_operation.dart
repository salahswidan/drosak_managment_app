
 import '../../../model/education_stage/item_stage_model.dart';
import 'my_sqlflite_database.dart';

class EducationStageOperation extends MySqlFliteDatabase {
  Future<bool> insertEducationDetails(ItemStageModel itemStageModel) {
    return insert(tableName: MySqlFliteDatabase.educationalStageTableName, values: {
     MySqlFliteDatabase.educationalStageName:itemStageModel.stageName,
     MySqlFliteDatabase.educationalStageDesc:itemStageModel.desc,
     MySqlFliteDatabase.educationalStageImage:itemStageModel.image,
     
    });
  }
  Future<List<Map<String, Object?>>> getAllEducationData(){
    return select(tableName: MySqlFliteDatabase.educationalStageTableName);
  }

  }
