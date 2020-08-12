import 'package:flutter/material.dart';

class CartItemControl extends StatelessWidget {
  CartItemControl({
    @required this.price,
    @required this.quantity,
    @required this.title,
    @required this.onRemoveFromCart,
    @required this.image,
  });

  final double price;
  final int quantity;
  final String title;
  final Function onRemoveFromCart;
  final int image;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(5),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(IconData(image, fontFamily: 'MaterialIcons'), size: 70),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title),
                Text('Price : \$$price'),
                Text('Quantity : $quantity'),
              ],
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  FlatButton(
                    child: Column(
                      children: [
                        Icon(Icons.remove_shopping_cart),
                        Text(
                          'Remove',
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                    onPressed: onRemoveFromCart,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
