import 'package:dokan_wedevs_assignment/controllers/signup_controller.dart';
import 'package:dokan_wedevs_assignment/utils/extension.dart';
import 'package:dokan_wedevs_assignment/views/signin_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'components/custom_icon_button.dart';
import 'components/custom_text_field.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  final signUpController = Get.put(SignUpController());


  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();




  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Stack(
                  children: [
                    SizedBox(
                      height: 140,
                      width: 140,
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(70),
                        ),
                        child: const Center(
                          child: Icon(FontAwesomeIcons.solidUser, color: Color(0xFF7C8592),),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 44, width: 44,
                        alignment: Alignment.center,
                        decoration:  BoxDecoration(
                          borderRadius: BorderRadius.circular(22),
                          gradient:  const LinearGradient(
                            colors: [Color(0xFFFF9472), Color(0xFFF2709C)],
                          ),
                        ),
                        child: const Icon(FontAwesomeIcons.camera, size: 13, color: Colors.white,)
                      ),
                    )
                  ],
                ),
              ),

              CustomTextField(
                controller: nameController,
                icons: FontAwesomeIcons.solidUser,
                hint: "Name",
                isPassword: false,
                eyeVisibility: false,
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
                eyeVisibility: false,
              ),
              CustomTextField(
                controller: confirmPasswordController,
                icons: FontAwesomeIcons.lock,
                hint: "Confirm Password",
                isPassword: true,
                eyeVisibility: false,
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width - 60,
                  height: 60,
                  child: CupertinoButton(
                      onPressed: () async{

                        showLoaderDialog(context);

                        String name = nameController.text;
                        String email = emailController.text;
                        String password = passwordController.text;
                        String confirmPassword = confirmPasswordController.text;

                        bool nameValid = name.isNotEmpty?true:false;
                        bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
                        bool passValid = password.isNotEmpty && confirmPassword.isNotEmpty && password == confirmPassword?true:false;

                        if(nameValid && emailValid && passValid) {
                          String? error = await signUpController.register(
                              username: name,
                              email: email,
                              password: password
                          );

                          if (error != null) {
                            Get.back();
                            Get.defaultDialog(title: "Oop!", middleText: "Email/Password may incorrect!");
                          } else {
                            Get.back();
                            Get.offAll(const SignInPage());
                          }
                        }else{
                          Get.defaultDialog(title: "Oop!", middleText: "Check Information");
                        }

                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: "Roboto",
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.normal),
                      ),
                      color: const Color(0xFFF75F55))),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account?",
                    style: TextStyle(
                      //color: Color(0xFF383C40),
                        fontSize: 20,
                        fontFamily: "Roboto",
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.normal),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.offAll(const SignInPage());
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                          color: Color(0xFF2893E3),
                          fontSize: 20,
                          fontFamily: "Roboto",
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )


            ],
          ),
        ),
      ),
    );
  }

}
