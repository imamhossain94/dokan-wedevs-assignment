import 'package:dokan_wedevs_assignment/controllers/home_tab_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class HomeTab extends StatelessWidget {
  HomeTab({Key? key}) : super(key: key);

  final homeTabController = Get.put(HomeTabController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppBar(
                title: const Text(
                  "Product List",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 26,
                      fontFamily: "Roboto",
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold),
                ),
                centerTitle: true,
                elevation: 0,
                backgroundColor: Colors.transparent,
                actions: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: IconButton(
                      icon: const Icon(
                        FontAwesomeIcons.search,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        // do something
                      },
                    ),
                  )
                ],
              )
            ]
          ),
        ),
        body: Column(
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 3,
                      blurRadius: 4,
                      offset: const Offset(0, 4), // changes position of shadow
                    ),
                  ]),
              child: Row(
                children: [
                  TextButton.icon(
                      onPressed: (){},
                      icon: Icon(FontAwesomeIcons.filter),
                      label: Text("Filters")
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
