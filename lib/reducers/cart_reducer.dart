import 'package:shopping_cart/actions/index.dart';
import 'package:shopping_cart/models/cart.dart';
import 'package:redux/redux.dart';

final cartReducer = combineReducers<Cart>([
  TypedReducer<Cart, AddToCart>(_addToCartReducer),
  TypedReducer<Cart, RemoveFromCart>(_removeFromCartReducer),
  TypedReducer<Cart, CheckoutSuccess>(_checkoutSuccessReducer),
]);

Cart _addToCartReducer(Cart state, AddToCart action) {
  return state.copyWith(quantityById: {
    ...state.quantityById,
    action.productId: (state.quantityById[action.productId] ?? 0) + 1
  });
}

Cart _removeFromCartReducer(Cart state, RemoveFromCart action) {
  int quantity = state.quantityById[action.productId] - 1;
  var newState = state.copyWith(quantityById: {...state.quantityById});
  if (quantity > 0)
    newState.quantityById[action.productId] = quantity;
  else
    newState.quantityById.remove(action.productId);
  return newState;
}

Cart _checkoutSuccessReducer(Cart state, CheckoutSuccess action) {
  return Cart.initial();
}