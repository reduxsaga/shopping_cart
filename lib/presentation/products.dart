import 'package:flutter/material.dart';
import 'package:shopping_cart/models/products.dart';
import 'package:shopping_cart/presentation/product.dart';

class ProductsControl extends StatelessWidget {
  final Products products;
  final Function(int) onAddToCart;

  ProductsControl({@required this.products, @required this.onAddToCart});

  @override
  Widget build(BuildContext context) {
    return products.items.length == 0
        ? Center(child: CircularProgressIndicator())
        : ListView.builder(
            itemCount: products.items.length,
            itemBuilder: (BuildContext context, int index) {
              return ProductControl(
                price: products.items[index].price,
                inventory: products.items[index].inventory,
                title: products.items[index].title,
                image: products.items[index].image,
                onAddToCart: () => onAddToCart(products.items[index].id),
              );
            },
          );
  }
}
