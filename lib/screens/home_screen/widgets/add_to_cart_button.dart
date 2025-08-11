import 'package:flutter/material.dart';

class AddToCartButton extends StatelessWidget {
  final int? addedToCart;
  const AddToCartButton({super.key, required this.addedToCart});

  @override
  Widget build(BuildContext context) {
    if (addedToCart == null || addedToCart == 0) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.orangeAccent,
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        width: MediaQuery.of(context).size.width * 0.3,
        height: 30.0,
      );
    } else {
      return SizedBox(
        width: MediaQuery.of(context).size.width * 0.3,
        height: 30.0,
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.orangeAccent,
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              child: Icon(Icons.add),
            ),
            Text(addedToCart!.toString()),
            Container(
              decoration: BoxDecoration(
                color: Colors.orangeAccent,
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              child: Icon(Icons.remove),
            ),
          ],
        ),
      );
    }
  }
}
