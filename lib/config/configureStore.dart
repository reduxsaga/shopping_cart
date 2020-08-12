import 'package:shopping_cart/models/appState.dart';
import 'package:shopping_cart/reducers/index.dart';
import 'package:shopping_cart/sagas/index.dart';
import 'package:redux/redux.dart';
import 'package:redux_saga/redux_saga.dart';

Store<AppState> configureStore() {
  SagaMiddleware sagaMiddleware = createSagaMiddleware();

  final store = Store<AppState>(
    appReducer,
    initialState: AppState.initial(),
    middleware: [
      applyMiddleware(sagaMiddleware),
    ],
  );

  sagaMiddleware.setStore(store);

  sagaMiddleware.run(rootSaga);

  return store;
}
