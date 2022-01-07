import 'package:flutter/material.dart';

class MenuTab  extends StatelessWidget  {
  const MenuTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Menu Tab",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}