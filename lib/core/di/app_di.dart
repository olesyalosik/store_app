import 'package:get_it/get_it.dart';
import 'package:store_app/navigation/app_router.dart';

/// Global instance of GetIt used for managing dependencies in the app.
final GetIt appLocator = GetIt.instance;

/// Instance of the class responsible for initializing app dependencies.
final AppDI appDI = AppDI();

/// Class for setting up and registering all dependencies in the application.
///
/// Used for dependency injection via [GetIt].
class AppDI {
  /// Initializes the application dependencies.
  ///
  void initDependencies() {
    _initAppRouter();
  }
}

/// Initializes and registers the application router.
///
/// Registers AppRouter as a singleton in appLocator.
void _initAppRouter() {
  appLocator.registerSingleton<AppRouter>(AppRouter());
}
