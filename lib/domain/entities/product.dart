import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import 'entities.dart';

part 'product.g.dart';

@immutable
@JsonSerializable()
class ProductEntity extends Object {
  final int? id;
  final String? title;
  final double? price;
  final String? description;
  final List<String>? images;
  final DateTime? creationAt;
  final DateTime? updatedAt;
  final CategoryEntity? category;

  const ProductEntity({
    this.id,
    this.title,
    this.price,
    this.description,
    this.images,
    this.creationAt,
    this.updatedAt,
    this.category,
  });

  String get finalPrice => price == null ? '' : "\$${price!.toStringAsFixed(2)}";

  factory ProductEntity.fromJson(Map<String, dynamic> json) => _$ProductEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ProductEntityToJson(this);

  @override
  bool operator ==(Object other) {
    return other is ProductEntity && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
