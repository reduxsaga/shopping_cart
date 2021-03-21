import 'dart:convert';

import 'package:meta/meta.dart';

@immutable
class Product {
  final int id;
  final String title;
  final int image;
  final double price;
  final int inventory;

  const Product(
      {required this.id,
      required this.title,
      required this.image,
      required this.price,
      required this.inventory});

  Product copyWith({int? id, String? title, int? image, double? price, int? inventory}) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      image: image ?? this.image,
      price: price ?? this.price,
      inventory: inventory ?? this.inventory,
    );
  }

  dynamic toJson() =>
      {'id': id, 'title': title, 'image': image, 'price': price, 'inventory': inventory};

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'] as int,
        title: json['title'] as String,
        image: json['image'] as int,
        price: json['price'] as double,
        inventory: json['inventory'] as int,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Product &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          image == other.image &&
          price == other.price &&
          inventory == other.inventory;

  @override
  int get hashCode =>
      id.hashCode ^ title.hashCode ^ image.hashCode ^ price.hashCode ^ inventory.hashCode;

  @override
  String toString() {
    return '${JsonEncoder.withIndent('  ').convert(this)}';
  }
}
