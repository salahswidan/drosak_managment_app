import '../../core/database/sqlflite/my_sqlflite_database.dart';

class GroupDetails {
  int id;
  String name;
  String desc;
  int educationStageID;

  GroupDetails(
      {this.id = 0,
      required this.name,
      required this.desc,
      required this.educationStageID});
  Map<String, dynamic> toJson() {
    return {
      MySqlFliteDatabase.groupColumnName: name,
      MySqlFliteDatabase.groupColumnNote: desc,
      MySqlFliteDatabase.groupColumnIDEducation: educationStageID,
    };
  }

  factory GroupDetails.fromJson(Map json) {
    return GroupDetails(
      name: json['name'].toString(),
      id: int.parse(json['id'].toString()),
      desc: json['note'].toString(),
      educationStageID: int.parse(json['educationID'].toString()),
    );
  }
  @override
  String toString() {
    return 'GroupDetails{id: $id, name: $name, desc: $desc, educationStageID: $educationStageID}';
  }
}
