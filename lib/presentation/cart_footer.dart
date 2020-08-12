import 'package:flutter/material.dart';

class CartFooterControl extends StatelessWidget {
  CartFooterControl({
    @required this.total,
    @required this.itemCount,
    @required this.onCheckout,
    @required this.checkoutPending,
    @required this.failed,
    @required this.error,
  });

  final double total;
  final int itemCount;
  final Function onCheckout;
  final bool checkoutPending;
  final bool failed;
  final dynamic error;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          checkoutPending ? LinearProgressIndicator() : Container(),
          checkoutPending
              ? Text(
                  'Please wait while checking out your cart',
                  style: TextStyle(color: Colors.red),
                )
              : Container(),
          failed
              ? Row(
                  children: [
                    Icon(
                      Icons.error_outline,
                      color: Colors.red,
                    ),
                    Expanded(
                      child: Text(
                        'Checkout failed : $error',
                        style: TextStyle(color: Colors.red),
                        overflow: TextOverflow.clip,
                      ),
                    ),
                  ],
                )
              : Container(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your Cart',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(itemCount == 0
                      ? 'Please add some products to cart.'
                      : '$itemCount items in the cart'),
                  Text('Total : \$$total'),
                ],
              ),
              FlatButton(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.shopping_cart),
                        Icon(Icons.check),
                      ],
                    ),
                    Text('Checkout'),
                  ],
                ),
                onPressed: itemCount == 0 || checkoutPending ? null : onCheckout,
              )
            ],
          ),
        ],
      ),
    ));
  }
}
