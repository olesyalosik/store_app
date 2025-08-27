import 'package:flutter/material.dart';
import 'package:store_app/core/di/app_di.dart';
import 'package:store_app/data/di/data_di.dart';
import 'package:store_app/screens/home_screen/ui/home_screen.dart';

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
    return MaterialApp(home: HomeScreen());
  }
}
