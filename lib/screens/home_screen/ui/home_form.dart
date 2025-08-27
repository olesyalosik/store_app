import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/screens/home_screen/bloc/home_bloc.dart';
import 'package:store_app/screens/home_screen/ui/widgets/load_more_button.dart';
import 'package:store_app/screens/home_screen/ui/widgets/product_tile.dart';

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
        bottomNavigationBar: BottomNavigationBar(
          elevation: 100.0,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.abc), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.abc), label: ''),
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
                              ? Center(child: CircularProgressIndicator())
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
