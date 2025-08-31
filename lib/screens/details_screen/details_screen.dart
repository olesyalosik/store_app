import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:store_app/domain/models/_models.dart';
import 'package:store_app/screens/details_screen/widgets/image_container.dart';
import 'package:store_app/screens/shared/add_to_cart_button.dart';

@RoutePage()
class DetailsScreen extends StatefulWidget {
  final ProductModel model;
  const DetailsScreen({super.key, required this.model});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
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
                child: Scrollbar(
                  controller: _scrollController,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: (widget.model.images ?? []).length == 1
                        ? Center(
                            child: ImageContainer(
                              image: (widget.model.images ?? [])[0],
                            ),
                          )
                        : ListView.builder(
                            controller: _scrollController,
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
              ),
              Text(widget.model.title ?? '', textAlign: TextAlign.start),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 10,
                ),
                child: Divider(color: Colors.amber, thickness: 2),
              ),
              Text(widget.model.description ?? '', textAlign: TextAlign.start),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 10,
                ),
                child: Divider(color: Colors.amber, thickness: 2),
              ),
              Text(
                (widget.model.price ?? 0).toString(),
                textAlign: TextAlign.start,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 10,
                ),
                child: Divider(color: Colors.amber, thickness: 2),
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
