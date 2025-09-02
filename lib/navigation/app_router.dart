import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:store_app/domain/models/_models.dart';
import 'package:store_app/presentation/screens/cart/ui/cart_screen.dart';
import 'package:store_app/presentation/screens/details_screen/details_screen.dart';
import 'package:store_app/presentation/screens/home_screen/ui/home_screen.dart';
import 'package:store_app/presentation/screens/main_screen/main_screen.dart';

part 'app_router.gr.dart';

/// class which describes all routes and navigation in the app

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: MainRoute.page,
      initial: true,
      path: '/main',
      children: [
        AutoRoute(page: HomeRoute.page, path: 'home'),
        AutoRoute(page: CartRoute.page, path: 'cart'),
      ],
    ),
    AutoRoute(page: DetailsRoute.page, path: '/details'),
  ];
}
