// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Orders extends Equatable {
  final String orderId;
  final String uid;
  final String imageUrl;
  final int createdAt;
  final int updatedAt;
  final int totalPrice;
  final String status;
  final String paymentReference;
  final String deliveryMethod;
  final String paymentType;
  final int shippingDate;
  final List<OrderItem> orderItems;
  const Orders({
    required this.orderId,
    required this.uid,
    required this.imageUrl,
    required this.createdAt,
    required this.updatedAt,
    required this.totalPrice,
    required this.status,
    required this.paymentReference,
    required this.deliveryMethod,
    required this.paymentType,
    required this.shippingDate,
    required this.orderItems,
  });

  @override
  List<Object> get props {
    return [
      orderId,
      uid,
      imageUrl,
      createdAt,
      updatedAt,
      totalPrice,
      status,
      paymentReference,
      deliveryMethod,
      paymentType,
      shippingDate,
      orderItems,
    ];
  }

  Orders copyWith({
    String? orderId,
    String? uid,
    String? imageUrl,
    int? createdAt,
    int? updatedAt,
    int? totalPrice,
    String? status,
    String? paymentReference,
    String? deliveryMethod,
    String? paymentType,
    int? shippingDate,
    List<OrderItem>? orderItems,
  }) {
    return Orders(
      orderId: orderId ?? this.orderId,
      uid: uid ?? this.uid,
      imageUrl: imageUrl ?? this.imageUrl,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      totalPrice: totalPrice ?? this.totalPrice,
      status: status ?? this.status,
      paymentReference: paymentReference ?? this.paymentReference,
      deliveryMethod: deliveryMethod ?? this.deliveryMethod,
      paymentType: paymentType ?? this.paymentType,
      shippingDate: shippingDate ?? this.shippingDate,
      orderItems: orderItems ?? this.orderItems,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'orderId': orderId,
      'uid': uid,
      'imageUrl': imageUrl,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'totalPrice': totalPrice,
      'status': status,
      'paymentReference': paymentReference,
      'deliveryMethod': deliveryMethod,
      'paymentType': paymentType,
      'shippingDate': shippingDate,
      'orderItems': orderItems.map((x) => x.toMap()).toList(),
    };
  }

  factory Orders.fromMap(Map<String, dynamic> map) {
    return Orders(
      orderId: map['orderId'] ?? '',
      uid: map['uid'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      createdAt: map['createdAt'] ?? 0,
      updatedAt: map['updatedAt'] ?? 0,
      totalPrice: map['totalPrice'] ?? 0,
      status: map['status'] ?? '',
      paymentReference: map['paymentReference'] ?? '',
      deliveryMethod: map['deliveryMethod'] ?? '',
      paymentType: map['paymentType'] ?? '',
      shippingDate: map['shippingDate'] ?? 0,
      orderItems: List<OrderItem>.from(map['orderItems']?.map((x) => OrderItem.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Orders.fromJson(String source) => Orders.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}

class OrderItem extends Equatable {
  final String foodId;
  final String title;
  final int quantity;
  final int price;
  final int createdAt;
  final int updatedAt;
  final String coverImageUrl;
  final String category;
  const OrderItem({
    required this.foodId,
    required this.title,
    required this.quantity,
    required this.price,
    required this.createdAt,
    required this.updatedAt,
    required this.coverImageUrl,
    required this.category,
  });

  @override
  List<Object> get props {
    return [
      foodId,
      title,
      quantity,
      price,
      createdAt,
      updatedAt,
      coverImageUrl,
      category,
    ];
  }

  OrderItem copyWith({
    String? foodId,
    String? title,
    int? quantity,
    int? price,
    int? createdAt,
    int? updatedAt,
    String? coverImageUrl,
    String? category,
  }) {
    return OrderItem(
      foodId: foodId ?? this.foodId,
      title: title ?? this.title,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      coverImageUrl: coverImageUrl ?? this.coverImageUrl,
      category: category ?? this.category,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'foodId': foodId,
      'title': title,
      'quantity': quantity,
      'price': price,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'coverImageUrl': coverImageUrl,
      'category': category,
    };
  }

  factory OrderItem.fromMap(Map<String, dynamic> map) {
    return OrderItem(
      foodId: map['foodId'] ?? '',
      title: map['title'] ?? '',
      quantity: map['quantity'] ?? 0,
      price: map['price'] ?? 0,
      createdAt: map['createdAt'] ?? 0,
      updatedAt: map['updatedAt'] ?? 0,
      coverImageUrl: map['coverImageUrl'] ?? '',
      category: map['category'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderItem.fromJson(String source) => OrderItem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
