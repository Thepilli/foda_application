// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Food extends Equatable {
  final String id;
  final String title;
  final String imageUrl;
  final String description;
  final String category;
  final int price;
  final int createdAt;
  final int updatedAt;
  final bool asLive;
  final List<String> ingredients;
  const Food({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.category,
    required this.price,
    required this.createdAt,
    required this.updatedAt,
    required this.asLive,
    required this.ingredients,
  });

  @override
  List<Object> get props {
    return [
      id,
      title,
      imageUrl,
      description,
      category,
      price,
      createdAt,
      updatedAt,
      asLive,
      ingredients,
    ];
  }

  Food copyWith({
    String? id,
    String? title,
    String? imageUrl,
    String? description,
    String? category,
    int? price,
    int? createdAt,
    int? updatedAt,
    bool? asLive,
    List<String>? ingredients,
  }) {
    return Food(
      id: id ?? this.id,
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      description: description ?? this.description,
      category: category ?? this.category,
      price: price ?? this.price,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      asLive: asLive ?? this.asLive,
      ingredients: ingredients ?? this.ingredients,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'imageUrl': imageUrl,
      'description': description,
      'category': category,
      'price': price,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'asLive': asLive,
      'ingredients': ingredients,
    };
  }

  factory Food.fromMap(Map<String, dynamic> map) {
    return Food(
        id: map['id'] ?? '',
        title: map['title'] ?? '',
        imageUrl: map['imageUrl'] ?? '',
        description: map['description'] ?? '',
        category: map['category'] ?? '',
        price: map['price'] ?? 0,
        createdAt: map['createdAt'] ?? 0,
        updatedAt: map['updatedAt'] ?? 0,
        asLive: map['asLive'] ?? false,
        ingredients: List<String>.from(
          (map['ingredients'] ?? []),
        ));
  }

  String toJson() => json.encode(toMap());

  factory Food.fromJson(String source) => Food.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
