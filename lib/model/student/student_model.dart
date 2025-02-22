import 'package:drosak_managment_app/model/group/appointment_model.dart';

import '../../core/database/sqlflite/my_sqlflite_database.dart';

class StudentModel {
  final String name;
  final int? id;
  final String image;
  final String note;
  final int idGroup;
  final int? idEducationStage;
  final String? createdAt;
  final String? groupName;
  final String? educationStageName;
  final List<AppointmentModel>? listAppointmentModel;

  StudentModel(
      {required this.name,
       this.id,
      required this.image,
       this.createdAt,
       this.idEducationStage,
       this.listAppointmentModel,
      required this.idGroup,
      required this.note,
      this.groupName,
      this.educationStageName});

  Map<String, dynamic> toJson() {
    return {
      MySqlFliteDatabase.studentsColumnName: name,
      MySqlFliteDatabase.studentsColumnNote: note,
      MySqlFliteDatabase.studentsColumnImage: image,
      MySqlFliteDatabase.studentsColumnIDGroup: idGroup,
    };
  }

  factory StudentModel.fromJson(Map<String, dynamic> json,List<AppointmentModel> listAppointmentModel) {
    return StudentModel(
        name: json['name'],
        id: json['id'],
        image: json['image'],
        createdAt: json['created_at'],
        idGroup: json['groups_id'],
        note: json['note'],
        groupName: json['group_name'],
        educationStageName: json['education_stage_name'],
        idEducationStage: json['education_stage_Id'],
        listAppointmentModel: listAppointmentModel,
        );
  }
}
