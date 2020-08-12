import 'package:meta/meta.dart';

@immutable
class Cart {
  final Map<int, int> quantityById;

  const Cart({@required this.quantityById});

  factory Cart.initial() {
    return Cart(quantityById: {});
  }

  Cart copyWith({Map<int, int> quantityById}) {
    return Cart(
      quantityById: quantityById ?? this.quantityById,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Cart && runtimeType == other.runtimeType && quantityById == other.quantityById;

  @override
  int get hashCode => quantityById.hashCode;
}
