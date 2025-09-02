import 'package:store_app/core/di/app_di.dart';
import 'package:store_app/data/dio/client.dart';
import 'package:store_app/data/repositories/cart_repository_impl.dart';
import 'package:store_app/data/repositories/products_repository_impl.dart';
import 'package:store_app/data/services/database_sevices/cart_database_service.dart';
import 'package:store_app/data/services/network_services/products_service.dart';
import 'package:store_app/domain/repositories/cart_repository.dart';
import 'package:store_app/domain/repositories/products_repository.dart';

/// Global instance of DataDI used to initialize data layer dependencies.
final DataDI dataDI = DataDI();

class DataDI {
  void initDependencies() {
    ///
    /// Register DIO client
    appLocator.registerSingleton<Client>(Client());

    ///
    /// Register Product Service
    appLocator.registerSingleton<ProductsService>(
      ProductsService(client: appLocator.get<Client>()),
    );

    ///
    /// Register Products Repository
    appLocator.registerLazySingleton<ProductsRepositoryAbstract>(
      () => ProductsRepository(
        productsService: appLocator.get<ProductsService>(),
      ),
    );

    ///
    /// Register Cart service
    appLocator.registerLazySingleton<CartDatabaseService>(
      () => CartDatabaseService(),
    );

    ///
    /// Register Cart repository
    appLocator.registerLazySingleton<CartRepositoryAbstract>(
      () => CartRepositoryImpl(
        databaseService: appLocator.get<CartDatabaseService>(),
      ),
    );
  }
}
