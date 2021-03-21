import 'package:shopping_cart/actions/index.dart';
import 'package:shopping_cart/models/appState.dart';
import 'package:shopping_cart/models/products.dart';
import 'package:shopping_cart/presentation/products.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

class ProductsContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (BuildContext context, vm) {
        return ProductsControl(
          products: vm.products,
          onAddToCart: vm.onAddToCart,
        );
      },
    );
  }
}

class _ViewModel {
  final Products products;
  final Function(int) onAddToCart;

  _ViewModel({required this.products, required this.onAddToCart});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        products: store.state.products,
        onAddToCart: (productId) => store.dispatch(AddToCart(productId)));
  }
}
