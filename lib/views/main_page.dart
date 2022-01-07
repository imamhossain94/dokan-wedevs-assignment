import 'package:dokan_wedevs_assignment/controllers/main_controller.dart';
import 'package:dokan_wedevs_assignment/views/tabs/cart_tab.dart';
import 'package:dokan_wedevs_assignment/views/tabs/home_tab.dart';
import 'package:dokan_wedevs_assignment/views/tabs/menu_tab.dart';
import 'package:dokan_wedevs_assignment/views/tabs/profile_tab.dart';
import 'package:dokan_wedevs_assignment/views/tabs/search_tab.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  final mainController = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
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
          onPressed: () => mainController.changeTab(4),
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
              icon: Obx(()=>Icon(
                FontAwesomeIcons.home,
                color: mainController.currentIndex.value == 0
                    ? const Color(0xFFFF679B)
                    : const Color(0xFF6E7FAA),
              )),
              onPressed: () => mainController.changeTab(0),
            ),
            IconButton(
              icon: Obx(()=>Icon(
                FontAwesomeIcons.thLarge,
                color: mainController.currentIndex.value == 1
                    ? const Color(0xFFFF679B)
                    : const Color(0xFF6E7FAA),
              )),
              onPressed: () => mainController.changeTab(1),
            ),
            IconButton(
              icon: Obx(()=>Icon(
                FontAwesomeIcons.shoppingCart,
                color: mainController.currentIndex.value == 2
                    ? const Color(0xFFFF679B)
                    : const Color(0xFF6E7FAA),
              )),
              onPressed: () => mainController.changeTab(2),
            ),
            IconButton(
              icon: Obx(()=>Icon(
                FontAwesomeIcons.solidUser,
                color: mainController.currentIndex.value == 3
                    ? const Color(0xFFFF679B)
                    : const Color(0xFF6E7FAA),
              )),
              onPressed: () => mainController.changeTab(3),
            ),
          ],
        ),
      ),
    );
  }

  Widget getBody() {
    List<Widget> pages = [
      HomeTab(),
      const MenuTab(),
      const CartTab(),
      const ProfileTab(),
      const SearchTab(),
    ];
    return Obx(() => IndexedStack(
          index: mainController.currentIndex.value,
          children: pages,
        ));
  }
}
