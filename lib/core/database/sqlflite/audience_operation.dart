import 'package:drosak_managment_app/core/database/sqlflite/my_sqlflite_database.dart';
import 'package:drosak_managment_app/core/database/sqlflite/student_operation.dart';
import 'package:drosak_managment_app/model/audience/audience_model.dart';
import 'package:drosak_managment_app/model/student/student_model.dart';

class AudienceOperation extends MySqlFliteDatabase {
  Future<List<StudentModel>> getStudentInfoByGroupID(int groupId) async {
    StudentOperation studentOperation = StudentOperation();
    return await studentOperation.getStudentsInfo(groupID: groupId);
  }

  Future<int> insertNewAudience(AudienceModel audienceModel) async {
    return insertAndReturnedId(
        tableName: MySqlFliteDatabase.audienceTableName,
        values: audienceModel.toJson());
  }

  Future<List<AudienceModel>> getAudienceData(int groupID) async {
    List<AudienceModel> listAudienceModel = [];
    String query = "SELECT ${MySqlFliteDatabase.audienceTableName}.*,"
        "${MySqlFliteDatabase.studentsTableName}.${MySqlFliteDatabase.studentsColumnImage}  as 'student_image',"
        "${MySqlFliteDatabase.studentsTableName}.${MySqlFliteDatabase.studentsColumnName} as 'student_name' "
        "FROM ${MySqlFliteDatabase.audienceTableName} INNER JOIN ${MySqlFliteDatabase.studentsTableName} "
        "ON ${MySqlFliteDatabase.studentsTableName}.${MySqlFliteDatabase.studentsColumnID}=${MySqlFliteDatabase.audienceTableName}.${MySqlFliteDatabase.audienceColumnIDStudent} INNER JOIN  ${MySqlFliteDatabase.groupTableName} ON ${MySqlFliteDatabase.groupTableName}.${MySqlFliteDatabase.groupColumnID} = $groupID";

    List<Map<String, Object?>> data = await selectUsingQuery(query: query);
    listAudienceModel += data
        .map(
          (item) => AudienceModel.fromJson(
            item,
          ),
        )
        .toList();

    return listAudienceModel;
  }
}
