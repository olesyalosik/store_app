import 'package:store_app/core/di/app_di.dart';
import 'package:store_app/data/dio/client.dart';
import 'package:store_app/data/repositories/products_repository_impl.dart';
import 'package:store_app/data/services/network_services/products_service.dart';
import 'package:store_app/domain/repositories/products_repository.dart';

final DataDI dataDI = DataDI();

class DataDI {
  void initDependencies() {
    appLocator.registerSingleton<Client>(Client());

    appLocator.registerSingleton<ProductsService>(
      ProductsService(client: appLocator.get<Client>()),
    );

    appLocator.registerLazySingleton<ProductsRepositoryAbstract>(
      () => ProductsRepository(
        productsService: appLocator.get<ProductsService>(),
      ),
    );
  }
}
