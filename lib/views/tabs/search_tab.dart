import 'package:flutter/material.dart';

class SearchTab  extends StatelessWidget  {
  const SearchTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Search Tab",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}