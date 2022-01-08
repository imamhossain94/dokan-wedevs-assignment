import 'package:dokan_wedevs_assignment/controllers/profile_tab_controller.dart';
import 'package:dokan_wedevs_assignment/views/components/custom_expansion_tile.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ProfileTab extends StatelessWidget {
  ProfileTab({Key? key}) : super(key: key);

  final profileTabController = Get.put(ProfileTabController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            AppBar(
              title: const Text(
                "My Account",
                style: TextStyle(
                    color: Color(0xFF222455),
                    fontSize: 26,
                    fontFamily: "Roboto",
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
              elevation: 0,
              backgroundColor: Colors.transparent,
            )
          ]),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: DottedBorder(
                    borderType: BorderType.Circle,
                    radius: const Radius.circular(70),
                    padding: const EdgeInsets.all(6),
                    color: const Color(0xFFFFADAD),
                    dashPattern: const [6, 3],
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(70)),
                      child: Container(
                        height: 140,
                        width: 140,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/resources/profile.png")

                          )
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Text(
                "John Smith",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 26,
                    fontFamily: "Roboto",
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                "info@johnsmith.com",
                style: TextStyle(
                    color: Color(0xFF535353),
                    fontSize: 26,
                    fontFamily: "Lato",
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.normal),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [

                        CustomExpansionTile(
                          title: "Account",
                          icon: FontAwesomeIcons.solidUser,
                          children: [
                            ListTile(
                              title: Text('Ios'),
                            ),
                            ListTile(
                              title: Text('Ios'),
                            ),
                            ListTile(
                              title: Text('Ios'),
                            )
                          ],
                        ),
                        CustomExpansionTile(
                          title: "Passwords",
                          icon: FontAwesomeIcons.lock,
                          children: []
                        ),
                        CustomExpansionTile(
                            title: "Notification",
                            icon: FontAwesomeIcons.solidBell,
                            children: []
                        ),
                        CustomExpansionTile(
                            title: "Wishlist",
                            icon: FontAwesomeIcons.solidHeart,
                            children: []
                        ),
                      ],
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
