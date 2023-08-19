// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class CartItem extends Equatable {
  final String foodId;
  final String category;
  final int quantity;
  final int createdAt;
  final int updatedAt;
  const CartItem({
    required this.foodId,
    required this.category,
    required this.quantity,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object> get props {
    return [
      foodId,
      category,
      quantity,
      createdAt,
      updatedAt,
    ];
  }

  CartItem copyWith({
    String? foodId,
    String? category,
    int? quantity,
    int? createdAt,
    int? updatedAt,
  }) {
    return CartItem(
      foodId: foodId ?? this.foodId,
      category: category ?? this.category,
      quantity: quantity ?? this.quantity,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'foodId': foodId,
      'category': category,
      'quantity': quantity,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory CartItem.fromMap(Map<String, dynamic> map) {
    return CartItem(
      foodId: map['foodId'] ?? '',
      category: map['category'] ?? '',
      quantity: map['quantity'] ?? 0,
      createdAt: map['createdAt'] ?? 0,
      updatedAt: map['updatedAt'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartItem.fromJson(String source) => CartItem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
