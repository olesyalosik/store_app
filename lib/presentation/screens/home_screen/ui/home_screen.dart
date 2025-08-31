import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:store_app/presentation/screens/home_screen/ui/home_form.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeForm();
  }
}
