import 'package:drosak_managment_app/model/group/appointment_model.dart';
import 'package:drosak_managment_app/model/student/student_model.dart';

import 'my_sqlflite_database.dart';

class StudentOperation extends MySqlFliteDatabase {
  Future<int> insertNewStudent(StudentModel studentModel) async {
    return insertAndReturnedId(
        tableName: MySqlFliteDatabase.studentsTableName,
        values: studentModel.toJson());
  }

  Future<List<StudentModel>> getStudentsInfo() async {
    List<StudentModel> listStudentModel = [];
    List<Map<String, Object?>> data = await selectUsingQuery(
        query:
            "SELECT ${MySqlFliteDatabase.studentsTableName}.*,${MySqlFliteDatabase.groupTableName}.${MySqlFliteDatabase.groupColumnName}  as 'group_name',${MySqlFliteDatabase.educationalStageTableName}.${MySqlFliteDatabase.educationalStageName} as 'education_stage_name',${MySqlFliteDatabase.educationalStageTableName}.${MySqlFliteDatabase.educationalStageID} as 'education_stage_Id' FROM ${MySqlFliteDatabase.studentsTableName} INNER JOIN ${MySqlFliteDatabase.groupTableName} ON ${MySqlFliteDatabase.groupTableName}.${MySqlFliteDatabase.groupColumnID}=${MySqlFliteDatabase.studentsTableName}.${MySqlFliteDatabase.studentsColumnIDGroup} INNER JOIN ${MySqlFliteDatabase.educationalStageTableName} ON ${MySqlFliteDatabase.groupTableName}.${MySqlFliteDatabase.groupColumnIDEducation}=${MySqlFliteDatabase.educationalStageTableName}.${MySqlFliteDatabase.educationalStageID}");
    Map<String, List<AppointmentModel>> mapOfAppointment = {};
    for (int i = 0; i < data.length; i++) {
      String groupId = data[i]['groups_id'].toString();

      if (mapOfAppointment.containsKey(groupId)) {
        print("found");
      } else {
        print("not found i will search");
        StudentOperation studentOperation = StudentOperation();
        var listAppointment =
            await studentOperation._getListAppointment(groupId);
        mapOfAppointment[groupId] = listAppointment;
      }
    }
    print(mapOfAppointment);
    listStudentModel += data
        .map(
          (item) => StudentModel.fromJson(
            item,
            mapOfAppointment[item['groups_id'].toString()]!,
          ),
        )
        .toList();

    return listStudentModel;
  }

  Future<List<AppointmentModel>> _getListAppointment(String groupId) async {
    List<AppointmentModel> listAppointmentModel = [];
    List<Map<String, Object?>> data = await search(
        tableName: MySqlFliteDatabase.appointmentsTableName,
        searchedId: groupId,
        columID: MySqlFliteDatabase.appointmentsColumnIDGroup);

    listAppointmentModel +=
        data.map((item) => AppointmentModel.fromJson(item)).toList();

    return listAppointmentModel;
  }
}
