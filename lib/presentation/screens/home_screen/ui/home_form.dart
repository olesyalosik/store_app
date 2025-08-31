import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/presentation/blocs/home_bloc/home_bloc.dart';
import 'package:store_app/presentation/screens/home_screen/ui/widgets/load_more_button.dart';
import 'package:store_app/presentation/screens/home_screen/ui/widgets/product_tile.dart';
import 'package:store_app/presentation/screens/home_screen/ui/widgets/theme_icon.dart';

class HomeForm extends StatefulWidget {
  const HomeForm({super.key});

  @override
  State<HomeForm> createState() => _HomeFormState();
}

class _HomeFormState extends State<HomeForm> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: EdgeInsetsGeometry.only(right: 10.0),
              child: Icon(Icons.filter_alt),
            ),
            Padding(
              padding: EdgeInsetsGeometry.only(right: 10.0),
              child: ThemeIcon(),
            ),
          ],
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeStateSuccess) {
              final products = state.products;
              return Scrollbar(
                thumbVisibility: true,
                controller: _scrollController,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CustomScrollView(
                    controller: _scrollController,
                    slivers: [
                      SliverGrid(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10.0,
                              crossAxisSpacing: 5.0,
                              childAspectRatio: 0.6,
                            ),
                        delegate: SliverChildBuilderDelegate(
                          (context, i) => ProductTile(product: products[i]),
                          childCount: products.length,
                        ),
                      ),

                      if (state.canLoadMore)
                        SliverToBoxAdapter(
                          child: state.isLoadingMore
                              ? Center(
                                  child: CircularProgressIndicator(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                )
                              : Center(child: LoadMoreButton()),
                        ),
                    ],
                  ),
                ),
              );
            } else if (state is HomeStateError) {
              return Center(child: Text(state.errorMessage));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
