import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:store_app/presentation/screens/cart/ui/cart_form.dart';

@RoutePage()
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CartForm();
  }
}
