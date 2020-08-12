import 'package:shopping_cart/models/cart.dart';
import 'package:shopping_cart/models/products.dart';
import 'package:shopping_cart/services/products.dart';

const APITimeout = Duration(seconds: 1);
// max different items
const MaxCheckout = 2;

Future<Products> getProductsAPI() async {
  return Future<Products>.delayed(APITimeout, () => Products.fromJson(productsData));
}

Future<Cart> buyProductsAPI(Cart cart) async {
  return Future<Cart>.delayed(APITimeout, () {
    if (cart.quantityById.keys.length <= MaxCheckout) {
      return cart;
    } else {
      throw Exception('You can buy $MaxCheckout items at maximum in a checkout');
    }
  });
}
