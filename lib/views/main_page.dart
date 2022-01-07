import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      floatingActionButton: Container(
        height: 56,
        width: 56,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          gradient: const LinearGradient(
            colors: [Color(0xFFFF9472), Color(0xFFF2709C)],
          ),
        ),
        child: FloatingActionButton(
          isExtended: true,
          elevation: 0,
          onPressed: () {},
          child: const Icon(FontAwesomeIcons.search),
          backgroundColor: Colors.transparent,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: const Icon(
                FontAwesomeIcons.home,
                color: Color(0xFF6E7FAA),
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                FontAwesomeIcons.thLarge,
                color: Color(0xFF6E7FAA),
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                FontAwesomeIcons.shoppingCart,
                color: Color(0xFF6E7FAA),
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                FontAwesomeIcons.solidUser,
                color: Color(0xFF6E7FAA),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }







}
