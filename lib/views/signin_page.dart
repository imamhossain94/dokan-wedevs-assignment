import 'package:dokan_wedevs_assignment/controllers/signin_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'components/custom_icon_button.dart';
import 'components/custom_text_field.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);

  final signInController = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                  height: 200, child: Image.asset("assets/resources/logo.png")),
              const Text(
                "Sign In",
                style: TextStyle(
                    fontSize: 25,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomTextField(
                controller: TextEditingController(),
                icons: FontAwesomeIcons.solidEnvelope,
                hint: "Email",
                isPassword: false,
                eyeVisibility: false,
              ),
              CustomTextField(
                controller: TextEditingController(),
                icons: FontAwesomeIcons.lock,
                hint: "Password",
                isPassword: true,
                eyeVisibility: true,
              ),
              Container(
                  alignment: Alignment.centerRight,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(
                          color: Color(0xFFA4A9AF),
                          fontSize: 18,
                          fontFamily: "Roboto",
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.normal),
                    ),
                  )),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width - 60,
                  height: 60,
                  child: CupertinoButton(
                      onPressed: () {},
                      child: const Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: "Roboto",
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.normal),
                      ),
                      color: const Color(0xFFF75F55))
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomIconButton(
                    icon: const Icon(
                      FontAwesomeIcons.facebookF,
                      color: Color(0xFF3B5998),
                    ),
                    onPressed: () {},
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  CustomIconButton(
                    icon: const Icon(
                      FontAwesomeIcons.google,
                      color: Color(0xFFF14336),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Create New Account",
                  style: TextStyle(
                      color: Color(0xFF383C40),
                      fontSize: 20,
                      fontFamily: "Roboto",
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.normal),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
