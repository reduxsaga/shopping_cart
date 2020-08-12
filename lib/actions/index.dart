import 'package:shopping_cart/models/cart.dart';
import 'package:shopping_cart/models/products.dart';

class ReceiveProducts {
  final Products products;

  ReceiveProducts(this.products);
}

class AddToCart {
  final int productId;

  AddToCart(this.productId);
}

class RemoveFromCart {
  final int productId;

  RemoveFromCart(this.productId);
}

class GetAllProducts {}

class Checkout {}

class CheckoutSuccess {
  Cart cart;

  CheckoutSuccess(this.cart);
}

class CheckoutFailure {
  dynamic error;

  CheckoutFailure(this.error);
}
