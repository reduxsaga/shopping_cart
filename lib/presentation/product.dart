import 'package:flutter/material.dart';

class ProductControl extends StatelessWidget {
  ProductControl({
    required this.price,
    required this.inventory,
    required this.title,
    required this.onAddToCart,
    required this.image,
  });

  final double price;
  final int inventory;
  final String title;
  final VoidCallback onAddToCart;
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
                inventory == 0
                    ? Text('Sold out', style: TextStyle(color: Colors.red))
                    : Text('Stock : $inventory'),
              ],
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextButton(
                    child: Column(
                      children: [
                        Icon(Icons.add_shopping_cart),
                        Text(
                          'Add',
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                    onPressed: inventory == 0 ? null : onAddToCart,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
