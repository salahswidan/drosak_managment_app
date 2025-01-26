class ItemStageModel {
  final int id;
  final String image;
  final String stageName;
  final String desc;

@override
  String toString (){
    return 'itemStageModel{id: $id, image: $image, stageName: $stageName, desc: $desc}';
    }
  
  ItemStageModel({
    required this.id,
    required this.image,
    required this.stageName,
    required this.desc,
  });
  factory ItemStageModel.fromJson(Map json) {
    return ItemStageModel(
      id: int.parse(json['id'].toString()),
      stageName: json['name'].toString(),
      desc: json['desc'].toString(),
      image: json['image'].toString(),
    );
  }
}
