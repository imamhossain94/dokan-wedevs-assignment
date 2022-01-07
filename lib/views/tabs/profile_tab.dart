import 'package:flutter/material.dart';

class ProfileTab  extends StatelessWidget  {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Profile Tab",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}