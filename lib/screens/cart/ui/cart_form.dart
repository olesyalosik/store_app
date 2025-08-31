import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/screens/cart/bloc/cart_bloc.dart';
import 'package:store_app/screens/cart/ui/widgets/cart_tile.dart';

class CartForm extends StatelessWidget {
  const CartForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Cart')),
        body: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartStateSuccess) {
              return ListView.builder(
                padding: EdgeInsets.all(10.0),
                itemBuilder: (context, i) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: CartTile(product: state.products.elementAt(i)),
                ),
                itemCount: state.products.length,
              );
            } else if (state is CartStateError) {
              return Center(child: Text(state.errorMessage));
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
