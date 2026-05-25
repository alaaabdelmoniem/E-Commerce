import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

@immutable
class CategoryModel {
  final String? description;
  final int? id;
  final String? imagePath;
  final String? title;

  const CategoryModel({this.description, this.id, this.imagePath, this.title});

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    description: json['description'] as String?,
    id: json['id'] as int?,
    imagePath: json['image_path'] as String?,
    title: json['title'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'description': description,
    'id': id,
    'image_path': imagePath,
    'title': title,
  };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! CategoryModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      description.hashCode ^ id.hashCode ^ imagePath.hashCode ^ title.hashCode;
}
