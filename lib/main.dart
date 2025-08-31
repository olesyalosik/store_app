import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/di/app_di.dart';
import 'package:store_app/data/di/data_di.dart';
import 'package:store_app/domain/repositories/products_repository.dart';
import 'package:store_app/navigation/app_router.dart';
import 'package:store_app/screens/cart/bloc/cart_bloc.dart';
import 'package:store_app/screens/home_screen/bloc/home_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  dataDI.initDependencies();
  appDI.initDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => HomeBloc(
            productsRepository: appLocator.get<ProductsRepositoryAbstract>(),
          )..add(InitEvent()),
        ),
        BlocProvider(create: (_) => CartBloc()),
      ],
      child: MaterialApp.router(
        routerConfig: appLocator.get<AppRouter>().config(),
      ),
    );
  }
}
