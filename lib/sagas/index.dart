import 'package:shopping_cart/actions/index.dart';
import 'package:shopping_cart/models/cart.dart';
import 'package:shopping_cart/models/products.dart';
import 'package:redux_saga/redux_saga.dart';
import 'package:shopping_cart/reducers/selectors.dart';
import 'package:shopping_cart/services/index.dart';

rootSaga() sync* {
  yield All({
    #t1: Fork(getAllProducts),
    #t2: Fork(watchGetProducts),
    #t3: Fork(trigGetProducts),
    #t4: Fork(watchCheckout)
  });
}

getAllProducts({action}) sync* {
  var products = Result<Products>();
  yield Call(getProductsAPI, result: products);
  yield Put(ReceiveProducts(products.value));
}

watchGetProducts() sync* {
  // takeEvery will fork a new 'getAllProducts` task on each GetAllProducts actions
  // concurrent GetAllProducts actions are allowed
  yield TakeEvery(getAllProducts, pattern: GetAllProducts);
}

trigGetProducts() sync* {
  // simulate get all products event
  // by firing at a specific interval
  while (true) {
    yield Delay(Duration(seconds: 10));
    yield Put(GetAllProducts());
  }
}

watchCheckout() sync* {
  while (true) {
    yield Take(pattern: Checkout);
    //Blocking Call
    //It means that watchCheckout will ignore any Checkout event until
    //the current checkout completes, either by success or by Error.
    //i.e. concurrent Checkout are not allowed
    //This needs to be enforced by the UI also (disable checkout button)
    yield Call(checkout);
  }
}

checkout() sync* {
  yield Try(() sync* {
    var cart = Result<Cart>();
    yield Select(selector: getCart, result: cart);
    yield Call(buyProductsAPI, args: [cart.value]);
    yield Put(CheckoutSuccess(cart.value));
  }, Catch: (e, s) sync* {
    yield Put(CheckoutFailure(e));
  });
}
