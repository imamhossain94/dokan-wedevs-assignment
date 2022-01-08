import 'package:dokan_wedevs_assignment/controllers/signin_controller.dart';
import 'package:dokan_wedevs_assignment/services/get_storage_service.dart';
import 'package:dokan_wedevs_assignment/utils/extension.dart';
import 'package:dokan_wedevs_assignment/views/main_page.dart';
import 'package:dokan_wedevs_assignment/views/signup_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'components/custom_icon_button.dart';
import 'components/custom_text_field.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final signInController = Get.put(SignInController());

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

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
                controller: emailController,
                icons: FontAwesomeIcons.solidEnvelope,
                hint: "Email",
                isPassword: false,
                eyeVisibility: false,
              ),
              CustomTextField(
                controller: passwordController,
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
                    onPressed: () async {

                    },
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
                      onPressed: () async {

                        showLoaderDialog(context);

                        String email = emailController.text;
                        String password = passwordController.text;
                        bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
                        bool passValid = password.isNotEmpty?true:false;

                        if(emailValid && passValid) {
                          String? error = await signInController.login(
                              email: email,
                              password: password);

                          if (error != null) {
                            Get.back();
                            Get.defaultDialog(title: "Oops!", middleText: "Email/Password may incorrect!");
                          } else {
                            Get.back();
                            Get.offAll(MainPage());
                          }
                        }else{
                          Get.back();
                          Get.defaultDialog(title: "Oops!", middleText: "Check Information");
                        }

                      },
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
                onPressed: () {
                  Get.offAll(SignUpPage());
                },
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
