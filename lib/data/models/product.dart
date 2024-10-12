import '../../domain/entities/entities.dart';
import 'models.dart';

class ProductModel {
  int? id;
  String? title;
  double? price;
  String? description;
  List<String>? images;
  String? creationAt;
  String? updatedAt;
  CategoryModel? category;

  ProductModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.images,
    this.creationAt,
    this.updatedAt,
    this.category,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        title: json["title"],
        price: json["price"]?.toDouble(),
        description: json["description"],
        images: json["images"] == null ? null : List<String>.from(json["images"]),
        creationAt: json["creationAt"],
        updatedAt: json["updatedAt"],
        category: json["category"] == null ? null : CategoryModel.fromJson(json["category"]),
      );

  ProductEntity toEntity() => ProductEntity(
        id: id,
        title: title,
        price: price,
        description: description,
        images: images,
        creationAt: DateTime.tryParse(creationAt ?? ''),
        updatedAt: DateTime.tryParse(updatedAt ?? ''),
        category: category?.toEntity(),
      );
}
