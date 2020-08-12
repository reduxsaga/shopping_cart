import 'package:flutter/material.dart';
import 'package:shopping_cart/containers/cart_container.dart';
import 'package:shopping_cart/containers/cart_footer_container.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: CartContainer(),
      bottomNavigationBar: CartFooterContainer(),
    );
  }
}
