import 'package:flutter/material.dart';

class CartTab  extends StatelessWidget  {
  const CartTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Cart Tab",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}