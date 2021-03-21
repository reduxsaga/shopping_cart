import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:shopping_cart/models/product.dart';

@immutable
class Products {
  final List<Product> items;

  const Products({required this.items});

  factory Products.initial() {
    return Products(items: []);
  }

  Products copyWith({List<Product>? items}) {
    return Products(
      items: items ?? this.items,
    );
  }

  dynamic toJson() => {'items': items};

  factory Products.fromJson(Map<String, dynamic> json) {
    var items = List<Product>.from((json['items'] as List<dynamic>)
        .map<dynamic>((dynamic item) => Product.fromJson(item as Map<String, dynamic>)));

    return Products(items: items);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Products && runtimeType == other.runtimeType && items == other.items;

  @override
  int get hashCode => items.hashCode;

  @override
  String toString() {
    return '${JsonEncoder.withIndent('  ').convert(this)}';
  }
}
