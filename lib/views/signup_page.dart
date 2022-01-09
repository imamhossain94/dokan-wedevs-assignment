import 'package:dokan_wedevs_assignment/controllers/signup_controller.dart';
import 'package:dokan_wedevs_assignment/utils/extension.dart';
import 'package:dokan_wedevs_assignment/views/signin_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
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
                padding: EdgeInsets.symmetric(vertical: 5.h),
                child: Stack(
                  children: [
                    SizedBox(
                      height: 40.w,
                      width: 40.w,
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.w),
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
                        height: 12.w, width: 12.w,
                        alignment: Alignment.center,
                        decoration:  BoxDecoration(
                          borderRadius: BorderRadius.circular(6.w),
                          gradient:  const LinearGradient(
                            colors: [Color(0xFFFF9472), Color(0xFFF2709C)],
                          ),
                        ),
                        child: Icon(FontAwesomeIcons.camera, size: 12.sp, color: Colors.white,)
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
              SizedBox(
                height: 5.h,
              ),
              Container(
                height: 7.h,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 3.5.h, vertical: 0),
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
                          Get.defaultDialog(title: "Oops!", middleText: "Email/Password may incorrect!");
                        } else {
                          Get.back();
                          Get.offAll(const SignInPage());
                        }
                      }else{
                        Get.defaultDialog(title: "Oops!", middleText: "Check Information");
                      }

                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontFamily: "Roboto",
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.normal),
                    ),
                    color: const Color(0xFFF75F55)),
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomIconButton(
                    icon: Icon(
                      FontAwesomeIcons.facebookF,
                      color: const Color(0xFF3B5998),
                      size: 14.sp,
                    ),
                    onPressed: () {},
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  CustomIconButton(
                    icon: Icon(
                      FontAwesomeIcons.google,
                      color: const Color(0xFFF14336),
                      size: 14.sp,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(
                      //color: Color(0xFF383C40),
                        fontSize: 14.sp,
                        fontFamily: "Roboto",
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.normal),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.offAll(const SignInPage());
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                          color: const Color(0xFF2893E3),
                          fontSize: 14.sp,
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
