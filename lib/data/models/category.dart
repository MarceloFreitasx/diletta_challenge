import '../../domain/entities/entities.dart';

class CategoryModel {
  int? id;
  String? name;
  String? image;
  String? creationAt;
  String? updatedAt;

  CategoryModel({
    this.id,
    this.name,
    this.image,
    this.creationAt,
    this.updatedAt,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        creationAt: json["creationAt"],
        updatedAt: json["updatedAt"],
      );

  CategoryEntity toEntity() => CategoryEntity(
        id: id,
        name: name,
        image: image,
        creationAt: DateTime.tryParse(creationAt ?? ''),
        updatedAt: DateTime.tryParse(updatedAt ?? ''),
      );
}
