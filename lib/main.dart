import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/di/app_di.dart';
import 'package:store_app/core_ui/themes/app_themes.dart';
import 'package:store_app/data/di/data_di.dart';
import 'package:store_app/domain/repositories/cart_repository.dart';
import 'package:store_app/domain/repositories/products_repository.dart';
import 'package:store_app/navigation/app_router.dart';
import 'package:store_app/presentation/blocs/cart_bloc/cart_bloc.dart';
import 'package:store_app/presentation/blocs/home_bloc/home_bloc.dart';
import 'package:store_app/presentation/blocs/theme_bloc/theme_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  dataDI.initDependencies();
  appDI.initDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => HomeBloc(
            productsRepository: appLocator.get<ProductsRepositoryAbstract>(),
          )..add(HomeInitEvent()),
        ),
        BlocProvider(
          create: (_) =>
              CartBloc(cartRepository: appLocator.get<CartRepositoryAbstract>())
                ..add(CartInitEvent()),
        ),
        BlocProvider(create: (_) => ThemeBloc()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) => MaterialApp.router(
          theme: state.isDark ? AppThemes.dark : AppThemes.light,
          routerConfig: appLocator.get<AppRouter>().config(),
        ),
      ),
    );
  }
}
