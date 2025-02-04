import '../../core/database/sqlflite/my_sqlflite_database.dart';

class ItemStageModel {
  final int id;
  final String image;
  final String stageName;
  final String desc;
   String? createdAt;

  @override
  String toString() {
    return 'itemStageModel{id: $id, image: $image, stageName: $stageName, desc: $desc , createdAt: $createdAt}';
  }

  Map<String, dynamic> toJson() {
    return {
      MySqlFliteDatabase.educationalStageName: stageName,
      MySqlFliteDatabase.educationalStageDesc: desc,
      MySqlFliteDatabase.educationalStageImage: image,
    };
  }

  ItemStageModel({
    required this.id,
    required this.image,
    required this.stageName,
    required this.desc,
     this.createdAt,
  });
  factory ItemStageModel.fromJson(Map json) {
    return ItemStageModel(
      id: int.parse(json['id'].toString()),
      stageName: json['name'].toString(),
      desc: json['desc'].toString(),
      createdAt: json['created_at'].toString(),
      image: json['image'].toString(),
    );
  }
}
