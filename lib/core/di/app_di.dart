import 'package:get_it/get_it.dart';
import 'package:store_app/navigation/app_router.dart';

final GetIt appLocator = GetIt.instance;

final AppDI appDI = AppDI();

class AppDI {
  void initDependencies() {
    _initAppRouter();
  }
}

void _initAppRouter() {
  appLocator.registerSingleton<AppRouter>(AppRouter());
}
