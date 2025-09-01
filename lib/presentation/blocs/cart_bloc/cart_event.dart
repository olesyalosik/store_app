part of 'cart_bloc.dart';

abstract class CartEvent {}

class CartInitEvent extends CartEvent {}

class AddToCartEvent extends CartEvent {
  final ProductModel product;
  AddToCartEvent({required this.product});
}

class RemoveFromCartEvent extends CartEvent {
  final ProductModel product;
  RemoveFromCartEvent({required this.product});
}

class DeleteFromCart extends CartEvent {
  final ProductModel product;
  DeleteFromCart({required this.product});
}
