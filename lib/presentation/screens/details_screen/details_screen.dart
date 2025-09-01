import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:store_app/core/di/app_di.dart';
import 'package:store_app/domain/domain.dart';
import 'package:store_app/navigation/app_router.dart';
import 'package:store_app/presentation/screens/details_screen/widgets/image_container.dart';
import 'package:store_app/presentation/shared_widgets/add_to_cart_button.dart';

@RoutePage()
class DetailsScreen extends StatefulWidget {
  final ProductModel model;
  const DetailsScreen({super.key, required this.model});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => appLocator.get<AppRouter>().pop(),
          child: Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: (widget.model.images ?? []).length == 1
                      ? Center(
                          child: ImageContainer(
                            image: (widget.model.images ?? [])[0],
                          ),
                        )
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: widget.model.images?.length ?? 0,
                          itemBuilder: (context, i) {
                            return ImageContainer(
                              image: (widget.model.images ?? [])[i],
                            );
                          },
                        ),
                ),
              ),

              Text(
                widget.model.title ?? '',
                textAlign: TextAlign.start,
                style: Theme.of(context).primaryTextTheme.bodyLarge,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 10,
                ),
                child: Divider(
                  color: Theme.of(context).primaryColor,
                  thickness: 2,
                ),
              ),
              Text(
                widget.model.description ?? '',
                textAlign: TextAlign.start,
                style: Theme.of(context).primaryTextTheme.bodySmall,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 10,
                ),
                child: Divider(
                  color: Theme.of(context).primaryColor,
                  thickness: 2,
                ),
              ),
              Text(
                "${(widget.model.price ?? 0.0).toString()} \$",
                textAlign: TextAlign.start,
                style: Theme.of(context).primaryTextTheme.bodyMedium,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 10,
                ),
                child: Divider(
                  color: Theme.of(context).primaryColor,
                  thickness: 2,
                ),
              ),
              AddToCartButton(
                productId: widget.model.id!,
                productModel: widget.model,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
