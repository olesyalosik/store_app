import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/domain/models/_models.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  Map<int, int> addedToCartProducts = {};
  Set<ProductModel> products = {};
  CartBloc() : super(CartStateSuccess(products: {}, addedToCart: {})) {
    on<AddToCartEvent>(_addToCart);
    on<RemoveFromCartEvent>(_removeFromCart);
    on<DeleteFromCart>(_delete);
  }

  Future<void> _addToCart(AddToCartEvent event, Emitter<CartState> emit) async {
    final currQuantity = addedToCartProducts[event.product.id] ?? 0;
    addedToCartProducts[event.product.id!] = currQuantity + 1;
    products.add(event.product);
    emit(
      CartStateSuccess(products: products, addedToCart: addedToCartProducts),
    );
  }

  Future<void> _removeFromCart(
    RemoveFromCartEvent event,
    Emitter<CartState> emit,
  ) async {
    final currQuantity = addedToCartProducts[event.product.id] ?? 0;
    if (currQuantity > 0) {
      addedToCartProducts[event.product.id!] = currQuantity - 1;
    }
    if (currQuantity - 1 == 0) {
      products.remove(event.product);
    }
    emit(
      CartStateSuccess(products: products, addedToCart: addedToCartProducts),
    );
  }

  Future<void> _delete(DeleteFromCart event, Emitter<CartState> emit) async {
    addedToCartProducts[event.product.id!] = 0;
    products.remove(event.product);
    emit(
      CartStateSuccess(products: products, addedToCart: addedToCartProducts),
    );
  }
}
