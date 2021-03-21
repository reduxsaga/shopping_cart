import 'package:flutter/material.dart';
import 'package:shopping_cart/models/product.dart';
import 'cart_item.dart';

class CartControl extends StatelessWidget {
  final Map<Product, int> cartProductsByQuantity;
  final Function(int) onRemoveFromCart;
  final bool checkoutPending;

  CartControl(
      {required this.cartProductsByQuantity,
      required this.onRemoveFromCart,
      required this.checkoutPending});

  @override
  Widget build(BuildContext context) {
    var cartProducts = cartProductsByQuantity.keys.toList();
    return cartProducts.length == 0
        ? Center(child: Text('Your cart is empty'))
        : ListView.builder(
            itemCount: cartProducts.length,
            itemBuilder: (BuildContext context, int index) {
              return CartItemControl(
                price: cartProductsByQuantity[cartProducts[index]]! * cartProducts[index].price,
                quantity: cartProductsByQuantity[cartProducts[index]]!,
                title: cartProducts[index].title,
                image: cartProducts[index].image,
                onRemoveFromCart:
                    checkoutPending ? null : () => onRemoveFromCart(cartProducts[index].id),
              );
            },
          );
  }
}
