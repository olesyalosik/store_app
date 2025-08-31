import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/domain/models/_models.dart';
import 'package:store_app/screens/cart/bloc/cart_bloc.dart';

class AddToCartButton extends StatelessWidget {
  final int productId;
  final ProductModel productModel;
  const AddToCartButton({
    super.key,
    required this.productId,
    required this.productModel,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartStateSuccess) {
          final currQuantity = state.addedToCart[productId] ?? 0;
          return currQuantity == 0
              ? GestureDetector(
                  onTap: () => BlocProvider.of<CartBloc>(
                    context,
                  ).add(AddToCartEvent(product: productModel)),
                  child: Container(
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                      color: Colors.orangeAccent,
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: 30.0,
                    child: Text('Add to cart', textAlign: TextAlign.center),
                  ),
                )
              : SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: 30.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => BlocProvider.of<CartBloc>(
                          context,
                        ).add(AddToCartEvent(product: productModel)),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.orangeAccent,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Icon(Icons.add),
                          ),
                        ),
                      ),
                      Text(currQuantity.toString()),
                      GestureDetector(
                        onTap: () => BlocProvider.of<CartBloc>(
                          context,
                        ).add(RemoveFromCartEvent(product: productModel)),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.orangeAccent,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Icon(Icons.remove),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
