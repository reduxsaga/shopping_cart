import 'package:shopping_cart/actions/index.dart';
import 'package:redux/redux.dart';
import 'package:shopping_cart/models/products.dart';

final productsReducer = combineReducers<Products>([
  TypedReducer<Products, ReceiveProducts>(_receiveProductsReducer),
  TypedReducer<Products, AddToCart>(_addToCartProductsReducer),
  TypedReducer<Products, RemoveFromCart>(_removeFromCartProductsReducer),
]);

Products _receiveProductsReducer(Products state, ReceiveProducts action) {
  return state.copyWith(items: [...state.items, ...action.products.items]);
}

Products _addToCartProductsReducer(Products state, AddToCart action) {
  return state.copyWith(
      items: state.items
          .map((e) => e.id == action.productId ? e.copyWith(inventory: e.inventory - 1) : e)
          .toList());
}

Products _removeFromCartProductsReducer(Products state, RemoveFromCart action) {
  return state.copyWith(
      items: state.items
          .map((e) => e.id == action.productId ? e.copyWith(inventory: e.inventory + 1) : e)
          .toList());
}
