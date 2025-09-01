import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:store_app/core/di/app_di.dart';
import 'package:store_app/domain/models/_models.dart';
import 'package:store_app/navigation/app_router.dart';
import 'package:store_app/presentation/shared_widgets/add_to_cart_button.dart';

class ProductTile extends StatelessWidget {
  final ProductModel product;
  const ProductTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),

      child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).primaryColor, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => appLocator.get<AppRouter>().push(
                  DetailsRoute(model: product),
                ),
                child: Column(
                  children: [
                    CachedNetworkImage(
                      imageUrl: product.thumbnail!,
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: 120,
                    ),
                    Text(
                      product.title ?? 'Name is not applicable',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).primaryTextTheme.bodySmall,
                    ),
                    Text(
                      "${(product.price ?? 0.0).toString()} \$",
                      style: Theme.of(context).primaryTextTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              AddToCartButton(productId: product.id!, productModel: product),
            ],
          ),
        ),
      ),
    );
  }
}
