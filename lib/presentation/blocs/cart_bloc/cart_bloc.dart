import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/domain/models/_models.dart';
import 'package:store_app/domain/repositories/cart_repository.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepositoryAbstract _cartRepository;
  Map<int, int> addedToCartProducts = {};
  Set<ProductModel> products = {};
  CartBloc({required CartRepositoryAbstract cartRepository})
    : _cartRepository = cartRepository,
      super(CartStateSuccess(products: {}, addedToCart: {})) {
    on<AddToCartEvent>(_addToCart);
    on<RemoveFromCartEvent>(_removeFromCart);
    on<DeleteFromCart>(_delete);
    on<CartInitEvent>(_init);
  }

  Future<void> _init(CartInitEvent event, Emitter<CartState> emit) async {
    await _updateCart(emit);
  }

  Future<void> _addToCart(AddToCartEvent event, Emitter<CartState> emit) async {
    await _cartRepository.addItem(product: event.product);
    await _updateCart(emit);
  }

  Future<void> _removeFromCart(
    RemoveFromCartEvent event,
    Emitter<CartState> emit,
  ) async {
    await _cartRepository.removeItem(product: event.product);
    await _updateCart(emit);
  }

  Future<void> _delete(DeleteFromCart event, Emitter<CartState> emit) async {
    await _cartRepository.deleteItem(product: event.product);
    await _updateCart(emit);
  }

  Future<void> _updateCart(Emitter<CartState> emit) async {
    final response = await _cartRepository.getCartProducts();
    products.clear();
    addedToCartProducts.clear();
    for (final item in response) {
      products.add(item.$1);
      addedToCartProducts[item.$1.id!] = item.$2;
    }
    emit(
      CartStateSuccess(products: products, addedToCart: addedToCartProducts),
    );
  }
}
