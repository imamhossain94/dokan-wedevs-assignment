import 'package:flutter/material.dart';

class HomeTab  extends StatelessWidget  {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Home Tab",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}