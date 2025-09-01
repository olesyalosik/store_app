import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/domain/domain.dart';
import 'package:store_app/presentation/blocs/cart_bloc/cart_bloc.dart';
import 'package:store_app/presentation/shared_widgets/add_to_cart_button.dart';

class CartTile extends StatelessWidget {
  final ProductModel product;
  const CartTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: BoxBorder.all(
          color: Theme.of(context).primaryColor,
          width: 2.0,
        ),
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
              flex: 1,
              child: CachedNetworkImage(
                imageUrl: product.thumbnail!,
                height: 50,
              ),
            ),
            Flexible(
              flex: 2,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      product.title!,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).primaryTextTheme.bodySmall,
                    ),
                    Text(
                      "${(product.price ?? 0.0).toString()} \$",
                      style: Theme.of(context).primaryTextTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: AddToCartButton(
                productId: product.id!,
                productModel: product,
              ),
            ),
            Flexible(
              flex: 1,
              child: GestureDetector(
                onTap: () => BlocProvider.of<CartBloc>(
                  context,
                ).add(DeleteFromCart(product: product)),
                child: Icon(
                  Icons.delete,
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
