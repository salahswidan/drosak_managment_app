import '../../core/database/sqlflite/my_sqlflite_database.dart';

class AudienceModel {
  final int? id;
  final String status;
  final int studentID;
  final String selectedTimeData;
  final String? createdAt;
  final String? studentImage;
  final String? studentName;
  @override
  String toString() {
    return 'AudienceModel{id: $id, status: $status, studentID: $studentID, selectedTimeData: $selectedTimeData, createdAt: $createdAt, studentImage: $studentImage, studentName: $studentName}';
  }

  AudienceModel(
      {required this.status,
      this.createdAt,
      required this.studentID,
      required this.selectedTimeData,
      this.studentImage,
      this.studentName,
      this.id});

  factory AudienceModel.fromJson(Map<String, dynamic> json) {
    return AudienceModel(
      status: json['status'],
      studentID: json['student_id'],
      selectedTimeData: json['detail'],
      id: json['id'],
      createdAt: json['created_at'],
      studentImage: json['student_image'],
      studentName: json['student_name'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      MySqlFliteDatabase.audienceColumnDetail: selectedTimeData,
      MySqlFliteDatabase.audienceColumnIDStudent: studentID,
      MySqlFliteDatabase.audienceColumnStatus: status,
    };
  }
}
