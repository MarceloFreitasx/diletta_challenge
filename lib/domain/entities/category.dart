import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@immutable
@JsonSerializable()
class CategoryEntity {
  final int? id;
  final String? name;
  final String? image;
  final DateTime? creationAt;
  final DateTime? updatedAt;

  const CategoryEntity({
    this.id,
    this.name,
    this.image,
    this.creationAt,
    this.updatedAt,
  });

  factory CategoryEntity.fromJson(Map<String, dynamic> json) => _$CategoryEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryEntityToJson(this);
}
