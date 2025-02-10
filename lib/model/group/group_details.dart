import '../../core/database/sqlflite/my_sqlflite_database.dart';

class GroupDetails {
  int id;
  String name;
  String desc;
  int educationStageID;
  
  GroupDetails({ this.id = 0,required this.name,required this.desc,required this.educationStageID});
    Map<String, dynamic> toJson() {
    return {
      MySqlFliteDatabase.groupColumnName: name,
      MySqlFliteDatabase.groupColumnNote: desc,
      MySqlFliteDatabase.groupColumnIDEducation: desc,
    };
  }
  //  factory ItemStageModel.fromJson(Map json) {
  //   return ItemStageModel(
  //     id: int.parse(json['id'].toString()),
  //     stageName: json['name'].toString(),
  //     desc: json['desc'].toString(),
  //     createdAt: json['created_at'].toString(),
  //     image: json['image'].toString(),
  //     status: json['status'],
  //   );
  // }
}