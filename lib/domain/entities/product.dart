import 'entities.dart';

class ProductEntity {
  int? id;
  String? title;
  double? price;
  String? description;
  List<String>? images;
  DateTime? creationAt;
  DateTime? updatedAt;
  CategoryEntity? category;

  ProductEntity({
    this.id,
    this.title,
    this.price,
    this.description,
    this.images,
    this.creationAt,
    this.updatedAt,
    this.category,
  });
}
