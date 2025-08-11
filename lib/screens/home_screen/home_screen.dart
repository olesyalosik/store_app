import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Products'),
          leading: Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
    );
  }
}