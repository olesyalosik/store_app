import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:store_app/domain/models/_models.dart';
import 'package:store_app/screens/details_screen/details_screen.dart';
import 'package:store_app/screens/home_screen/ui/widgets/add_to_cart_button.dart';

class ProductTile extends StatelessWidget {
  final ProductModel product;
  const ProductTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (context) => DetailsScreen(model: product),
            ),
          );
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.7,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.amber, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CachedNetworkImage(
                  imageUrl: product.images![0],
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: 120,
                ),
                Text(
                  product.title ?? 'Name is not applicable',
                  textAlign: TextAlign.center,
                ),
                Text((product.price ?? 0.0).toString()),
                AddToCartButton(addedToCart: product.itemsInCart),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
