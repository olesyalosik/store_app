import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/di/app_di.dart';
import 'package:store_app/domain/repositories/products_repository.dart';
import 'package:store_app/screens/home_screen/bloc/home_bloc.dart';
import 'package:store_app/screens/home_screen/ui/home_form.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc(
        productsRepository: appLocator.get<ProductsRepositoryAbstract>(),
      )..add(InitEvent()),
      child: HomeForm(),
    );
  }
}
