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
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                    },
                  ),
                )
              ],
            )
          ]),
        ),
        body: Column(
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
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
                      onPressed: () {},
                      icon: const Icon(
                        FontAwesomeIcons.filter,
                        size: 20,
                        color: Color(0xFFB6BED4),
                      ),
                      label: const Text(
                        "Filters",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: "Lato",
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.normal),
                      )),
                  const Spacer(),
                  DropdownButton<String>(
                      value: "Sort by",
                      icon: const Icon(
                        FontAwesomeIcons.caretDown,
                        size: 28,
                        color: Color(0xFFB6BED4),),
                      //iconSize: 42,
                      underline: SizedBox(),
                      onChanged: (String? newValue) {},
                      items: <String>[
                        'Sort by',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: "Lato",
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.normal),),
                        );
                      }).toList()),
                  IconButton(
                    icon: const Icon(
                      FontAwesomeIcons.tasks,
                      color: Colors.black,
                      size: 24,
                    ),
                    onPressed: () {
                    },
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
