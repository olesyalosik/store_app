import 'package:flutter/material.dart';
import 'package:store_app/domain/models/_models.dart';
import 'package:store_app/screens/home_screen/widgets/add_to_cart_button.dart';

class ProductTile extends StatelessWidget {
  final ProductModel product;
  const ProductTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      child: Column(
        children: [
          if (product.images != null && product.images!.isNotEmpty)
            Image.network(product.images![0]),
          Text(product.title ?? 'Name is not applicable'),
          Text((product.price ?? 0.0).toString()),
          AddToCartButton(addedToCart: null),
        ],
      ),
    );
  }
}
