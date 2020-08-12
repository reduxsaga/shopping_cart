import 'package:flutter/material.dart';

class CartButton extends StatelessWidget {
  final int itemCount;

  CartButton({@required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
            height: 150.0,
            width: 30.0,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/cart');
              },
              child: Stack(
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                    ),
                    onPressed: null,
                  ),
                  itemCount == 0
                      ? Container()
                      : Positioned(
                          child: Stack(
                          children: <Widget>[
                            Icon(Icons.brightness_1, size: 20.0, color: Colors.orange[500]),
                            Positioned(
                                width: 20,
                                height: 20,
                                child: Center(
                                  child: Text(
                                    itemCount.toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10.0,
                                        fontWeight: FontWeight.w500),
                                  ),
                                )),
                          ],
                        )),
                ],
              ),
            )));
  }
}
