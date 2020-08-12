import 'package:flutter/material.dart';
import 'package:shopping_cart/containers/cart_button_container.dart';
import 'package:shopping_cart/containers/products_container.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
        actions: <Widget>[CartButtonContainer()],
      ),
      body: ProductsContainer(),
    );
  }
}
