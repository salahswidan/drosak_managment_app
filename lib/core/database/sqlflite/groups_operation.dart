import 'package:drosak_managment_app/model/group/group_details.dart';
import 'package:drosak_managment_app/model/group/appointment_model.dart';
import '../../../model/education_stage/item_stage_model.dart';
import 'my_sqlflite_database.dart';

class GroupsOperation extends MySqlFliteDatabase {
  Future<int> insertGroupDetails(GroupDetails groupDetails) async {
    return insertAndReturnedId(
        tableName: MySqlFliteDatabase.groupTableName,
        values: groupDetails.toJson());
   
  }

  Future<bool> insertAppointmentDetails(AppointmentModel appointment,int groupID)  {
    return insert(
        tableName: MySqlFliteDatabase.appointmentsTableName,
        values: appointment.toJson(groupID));
  }

  Future<List<GroupDetails>> getAllGroupsData() async {
    List<GroupDetails> listGroupDetails = [];
    List<Map<String, Object?>> data = await select(
      tableName: MySqlFliteDatabase.groupTableName,
    );
    listGroupDetails +=
        data.map((item) => GroupDetails.fromJson(item)).toList();
    return listGroupDetails;
  }

  Future<List<AppointmentModel>> getAllAppointmentsData() async {
    List<AppointmentModel> listAppointment = [];
    List<Map<String, Object?>> data = await select(
      tableName: MySqlFliteDatabase.appointmentsTableName,
    );
    // listAppointment +=
    //     data.map((item) => AppointmentModel.fromJson(item)).toList();
    print(data.toString());
    return listAppointment;
  }

  Future<bool> softDelete(ItemStageModel itemStageModel) async {
    return await update(
        tableName: MySqlFliteDatabase.educationalStageTableName,
        values: {MySqlFliteDatabase.educationalStageStatus: 0},
        where:
            '${MySqlFliteDatabase.educationalStageID}==${itemStageModel.id}');
  }

  Future<bool> editEducationStage(ItemStageModel itemStageModel) async {
    return await update(
        tableName: MySqlFliteDatabase.educationalStageTableName,
        values: itemStageModel.toJson(),
        where: '${MySqlFliteDatabase.educationalStageID}=?',
        whereArgs: ['${itemStageModel.id}']);
  }

  Future<List<ItemStageModel>> getSearchWord(
      {required String searchWord}) async {
    List<ItemStageModel> listItemStageModel = [];
    List<Map<String, Object?>> data = await select(
        tableName: MySqlFliteDatabase.educationalStageTableName,
        where:
            '${MySqlFliteDatabase.educationalStageName} LIKE ? AND ${MySqlFliteDatabase.educationalStageStatus}== ?',
        whereArgs: ['%$searchWord%', 1]);

    listItemStageModel +=
        data.map((item) => ItemStageModel.fromJson(item)).toList();
    //   print(listItemStageModel);
    return listItemStageModel;
  }
}
