import '../../core/database/sqlflite/my_sqlflite_database.dart';

class AppointmentModel {
  String time;
  String day;
  String ms;
  int groupId;
  int id;

  AppointmentModel(
      {required this.time,
      required this.day,
      required this.ms,
       this.groupId = 0,
      this.id = 0});

  Map<String, dynamic> toJson(int groupID) {
    return {
      MySqlFliteDatabase.appointmentsColumnDay: day,
      MySqlFliteDatabase.appointmentsColumnTime: time,
      MySqlFliteDatabase.appointmentsColumnMS: ms,
      MySqlFliteDatabase.appointmentsColumnIDGroup: groupID,
    };
  }
  @override
  String toString() {

    return 'AppointmentModel{id: $id, time: $time, day: $day, ms: $ms, groupId: $groupId}';
  }
  //   factory AppointmentModel.fromJson(Map json) {
  //   return AppointmentModel(
  //     name: json['name'].toString(),
  //     id: int.parse(json['id'].toString()),
  //     desc: json['note'].toString(),
  //     educationStageID: int.parse(json['educationID'].toString()),
  //   );
  // }
}
