import 'package:shopping_cart/config/configureStore.dart';
import 'package:shopping_cart/models/appState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:shopping_cart/pages/cart.dart';
import 'package:shopping_cart/pages/home.dart';
import 'config/configureStore.dart';
import 'models/appState.dart';

void main() {
  runApp(MyApp(store: configureStore()));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  MyApp({required this.store}) : super();

  @override
  Widget build(BuildContext context) {
    return new StoreProvider<AppState>(
        store: store,
        child: MaterialApp(
          title: 'Redux Saga Shopping Cart Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          debugShowCheckedModeBanner: false,
          routes: {
            '/': (context) => HomePage(),
            '/cart': (context) => CartPage(),
          },
        ));
  }
}
