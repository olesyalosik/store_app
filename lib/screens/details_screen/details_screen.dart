import 'package:flutter/material.dart';
import 'package:store_app/domain/models/_models.dart';

class DetailsScreen extends StatelessWidget {
  final ProductModel model;
  const DetailsScreen({super.key, 
  required this.model,});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text(model.title ?? ''),
      ),
    ),);
  }
}