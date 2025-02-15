import 'dart:math';

import 'package:drosak_managment_app/model/group/group_details.dart';
import 'package:drosak_managment_app/model/group/appointment_model.dart';
import 'package:drosak_managment_app/model/group/group_info_model.dart';
import '../../../model/education_stage/item_stage_model.dart';
import 'my_sqlflite_database.dart';

class GroupsOperation extends MySqlFliteDatabase {
  Future<int> insertGroupDetails(GroupDetails groupDetails) async {
    return insertAndReturnedId(
        tableName: MySqlFliteDatabase.groupTableName,
        values: groupDetails.toJson());
  }

  Future<bool> insertAppointmentDetails(
      AppointmentModel appointment, int groupID) {
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
    listAppointment +=
        data.map((item) => AppointmentModel.fromJson(item)).toList();
    return listAppointment;
  }

  Future<List<GroupInfoModel>> getAllGroupsInfo() async {
    List<GroupInfoModel> listGroupInfo = [];
    List<GroupDetails> listGroupDetails = await getAllGroupsData();
    GroupsOperation groupsOperation = GroupsOperation();
    List<AppointmentModel> listAppointmentsModel =
        await groupsOperation.getAllAppointmentsData();
    for (var item in listGroupDetails) {
      List<AppointmentModel> listAppointment = listAppointmentsModel
          .where((element) => element.groupId == item.id)
          .toList();
      listGroupInfo.add(
          GroupInfoModel(groupDetails: item, listAppointment: listAppointment));
    }
    return listGroupInfo;
  }

  Future<bool> startDelete(GroupInfoModel groupInfoModel) async {
    return await delete(
        tableName: MySqlFliteDatabase.groupTableName,
        where:
            '${MySqlFliteDatabase.groupColumnID}==${groupInfoModel.groupDetails.id}');
  }

  Future<bool> _deleteAppointment(AppointmentModel appointmentModel) async {
    return await delete(
        tableName: MySqlFliteDatabase.appointmentsTableName,
        where:
            '${MySqlFliteDatabase.appointmentsColumnID}==${appointmentModel.id}');
  }

  Future<bool> editEducationStage(GroupInfoModel groupInfoModel,
      List<AppointmentModel> oldAppointmentModel) async {
    bool updateGroup = false;
    bool deleteAppointment = false;
    bool insertAppointment = false;
    //? update appointment
    updateGroup = await _updateGroupTable(groupInfoModel.groupDetails);
    if (updateGroup == true) {
      //? delete all appointment
      for (var item in oldAppointmentModel) {
        GroupsOperation groupsOperation = GroupsOperation();
        deleteAppointment = await groupsOperation._deleteAppointment(item);
        if (deleteAppointment == false) {
          break;
        }
      }
      if (deleteAppointment == true) {
        //? insert new appointment
        for (var item in groupInfoModel.listAppointment) {
          GroupsOperation groupsOperation = GroupsOperation();
          insertAppointment = await groupsOperation.insertAppointmentDetails(
              item, groupInfoModel.groupDetails.id);
          if (insertAppointment == false) {
            break;
          }
        }
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  Future<bool> _updateGroupTable(GroupDetails groupDetails) async {
    return await update(
        tableName: MySqlFliteDatabase.groupTableName,
        values: groupDetails.toJson(),
        where: '${MySqlFliteDatabase.groupColumnID}=?',
        whereArgs: ['${groupDetails.id}']);
  }

  Future<bool> _updateAppointment(
      AppointmentModel appointmentModel, int groupId) async {
    return await update(
        tableName: MySqlFliteDatabase.appointmentsTableName,
        values: appointmentModel.toJson(groupId),
        where: '${MySqlFliteDatabase.appointmentsColumnID}=?',
        whereArgs: ['${appointmentModel.id}']);
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
