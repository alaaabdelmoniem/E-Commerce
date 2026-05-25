import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import 'category.dart';

@immutable
class ProductModel {
  final int? bestSeller;
  final CategoryModel? category;
  final String? description;
  final int? id;
  final String? imagePath;
  final bool? isFavorite;
  final String? name;
  final double? price;
  final double? rating;

  const ProductModel({
    this.bestSeller,
    this.category,
    this.description,
    this.id,
    this.imagePath,
    this.isFavorite,
    this.name,
    this.price,
    this.rating,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    bestSeller: json['best_seller'] as int?,
    category: json['category'] == null
        ? null
        : CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
    description: json['description'] as String?,
    id: json['id'] as int?,
    imagePath: json['image_path'] as String?,
    isFavorite: json['is_favorite'] as bool?,
    name: json['name'] as String?,
    price: json['price'] as double?,
    rating: (json['rating'] as num?)?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    'best_seller': bestSeller,
    'category': category?.toJson(),
    'description': description,
    'id': id,
    'image_path': imagePath,
    'is_favorite': isFavorite,
    'name': name,
    'price': price,
    'rating': rating,
  };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ProductModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      bestSeller.hashCode ^
      category.hashCode ^
      description.hashCode ^
      id.hashCode ^
      imagePath.hashCode ^
      isFavorite.hashCode ^
      name.hashCode ^
      price.hashCode ^
      rating.hashCode;
}
