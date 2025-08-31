part of 'cart_bloc.dart';

class CartState {}

class CartStateSuccess extends CartState {
  final Set<ProductModel> products;
  final Map<int, int> addedToCart;
  CartStateSuccess({required this.products, required this.addedToCart});
}

class CartStateError extends CartState {
  final String errorMessage;

  CartStateError({required this.errorMessage});
}
