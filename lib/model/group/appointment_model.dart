import '../../core/database/sqlflite/my_sqlflite_database.dart';

class AppointmentModel {
  String time;
  String day;
  String ms;
  int groupId;

  AppointmentModel(
      {required this.time,
      required this.day,
      required this.ms,
      this.groupId = 0});

  Map<String, dynamic> toJson() {
    return {
      MySqlFliteDatabase.appointmentsColumnDay: day,
      MySqlFliteDatabase.appointmentsColumnTime: time,
      MySqlFliteDatabase.appointmentsColumnMS: ms,
    };
  }
}
