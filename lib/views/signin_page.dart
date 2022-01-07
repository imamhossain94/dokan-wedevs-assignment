import 'package:dokan_wedevs_assignment/controllers/signin_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'components/custom_text_field.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);

  final signInController = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/resources/logo.png"),
              const Text(
                "Sign In",
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal
                ),
              ),


              CustomTextField(
                controller: TextEditingController(),
                icons: FontAwesomeIcons.solidEnvelope,
                hint: "Email",
                isPassword: true,
                eyeVisibility: true,
              )



            ],
          ),
        ),
      ),
    );
  }


  Widget todoItem({String? title, String? subTitle, VoidCallback? onPressed}) {
    return Card(
      color: Colors.redAccent,
      elevation: 5,
      child: ListTile(
        title:  Text(
          title!, style: const TextStyle(color: Colors.white),
        ),
        subtitle: Text(subTitle!, style: const TextStyle(color: Colors.white),),
        trailing: const Icon(
          Icons.delete,
          color: Colors.black,
        ),
        onTap: onPressed,
      ),
    );
  }


}
