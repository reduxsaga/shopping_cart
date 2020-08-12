import 'package:meta/meta.dart';

@immutable
class CartStatus {
  final bool checkoutPending;
  final bool failed;
  final dynamic error;

  const CartStatus({@required this.checkoutPending, @required this.failed, @required this.error});

  factory CartStatus.initial() {
    return CartStatus(checkoutPending: false, failed: false, error: null);
  }

  CartStatus copyWith({bool checkoutPending, bool failed, dynamic error}) {
    return CartStatus(
      checkoutPending: checkoutPending ?? this.checkoutPending,
      failed: failed ?? this.failed,
      error: error ?? this.error,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartStatus &&
          runtimeType == other.runtimeType &&
          checkoutPending == other.checkoutPending &&
          failed == other.failed &&
          error == other.error;

  @override
  int get hashCode => checkoutPending.hashCode ^ failed.hashCode ^ error.hashCode;
}
