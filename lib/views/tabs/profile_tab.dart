import 'package:dokan_wedevs_assignment/controllers/profile_tab_controller.dart';
import 'package:dokan_wedevs_assignment/utils/extension.dart';
import 'package:dokan_wedevs_assignment/views/components/custom_expansion_tile.dart';
import 'package:dokan_wedevs_assignment/views/components/custom_form_field.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
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
                      child: Obx(() => Container(
                            height: 140,
                            width: 140,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: profileTabController.currentUser
                                                .value.id !=
                                            null
                                        ? NetworkImage(profileTabController
                                            .currentUser
                                            .value
                                            .avatarUrls!["96"]!)
                                        : const AssetImage("assets/resources/profile.png") as ImageProvider,
                                    fit: BoxFit.fill)),
                          )),
                    ),
                  ),
                ),
              ),
              Obx(
                () => Text(
                  profileTabController.currentUser.value.name??"",
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 26,
                      fontFamily: "Roboto",
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Obx(() => Text(
                    profileTabController.currentUser.value.email??"",
                    style: const TextStyle(
                        color: Color(0xFF535353),
                        fontSize: 26,
                        fontFamily: "Lato",
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.normal),
                  )),
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
                      children: [
                        CustomExpansionTile(
                          title: "Account",
                          icon: FontAwesomeIcons.solidUser,
                          children: [
                            CustomFormField(
                              title: "Email",
                              hint: "youremail@xmail.com",
                              controller: profileTabController.emailController.value,
                            ),
                            CustomFormField(
                              title: "Full Name",
                              hint: "William Bennett",
                              controller: profileTabController.fullNameController.value,
                            ),
                            CustomFormField(
                              title: "Street Address",
                              hint: "465 Nolan Causeway Suite 079",
                              controller: profileTabController.streetAddressController.value,
                            ),
                            CustomFormField(
                              title: "Apt, Suite, Bldg (optional)",
                              hint: "Unit 512",
                              controller: profileTabController.aptSuiteBldgController.value,
                            ),
                            CustomFormField(
                              title: "Zip Code",
                              hint: "77017",
                              controller: profileTabController.zipCodeController.value,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 30, horizontal: 15),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          side: const BorderSide(
                                              width: 0.5,
                                              color: Color(0xFFD2DBE0))),
                                      elevation: 0,
                                      child: SizedBox(
                                          height: 50,
                                          child: CupertinoButton(
                                              onPressed: () {
                                                Get.back();
                                              },
                                              padding: EdgeInsets.zero,
                                              child: const Text(
                                                "Cancel",
                                                style: TextStyle(
                                                    color: Color(0xFF818995),
                                                    fontSize: 20,
                                                    fontFamily: "Roboto",
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                              color: Colors.white)),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                        height: 50,
                                        child: CupertinoButton(
                                            onPressed: () async{

                                              showLoaderDialog(context);

                                              String? error = await profileTabController.updateProfile();

                                              if (error != null) {
                                                Get.back();
                                                Get.defaultDialog(title: "Oops!", middleText: "Failed to Update!!");
                                              } else {
                                                Get.back();
                                              }

                                            },
                                            padding: EdgeInsets.zero,
                                            child: const Text(
                                              "Save",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontFamily: "Lato",
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight:
                                                      FontWeight.normal),
                                            ),
                                            color: const Color(0xFF1ABC9C))),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const CustomExpansionTile(
                            title: "Passwords",
                            icon: FontAwesomeIcons.lock,
                            children: []),
                        const CustomExpansionTile(
                            title: "Notification",
                            icon: FontAwesomeIcons.solidBell,
                            children: []),
                        const CustomExpansionTile(
                            title: "Wishlist",
                            icon: FontAwesomeIcons.solidHeart,
                            children: []),
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
