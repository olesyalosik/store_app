import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/core.dart';
import 'package:store_app/core_ui/core_ui.dart';
import 'package:store_app/data/data.dart';
import 'package:store_app/domain/domain.dart';
import 'package:store_app/navigation/navigation.dart';
import 'package:store_app/presentation/blocs/blocs.dart';

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
