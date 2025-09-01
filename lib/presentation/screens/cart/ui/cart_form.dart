import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/presentation/blocs/cart_bloc/cart_bloc.dart';
import 'package:store_app/presentation/screens/cart/ui/widgets/cart_tile.dart';

class CartForm extends StatelessWidget {
  const CartForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Cart',
            style: Theme.of(context).primaryTextTheme.bodyLarge,
          ),
        ),
        body: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartStateSuccess) {
              return state.products.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.sentiment_dissatisfied,
                            size: 48,
                            color: Theme.of(context).primaryColor,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'No products yet',
                            style: Theme.of(context).primaryTextTheme.bodyLarge,
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
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
