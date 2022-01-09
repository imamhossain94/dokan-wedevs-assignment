import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final IconData icons;
  final String hint;
  final bool isPassword, eyeVisibility;

  const CustomTextField(
      {Key? key,
      required this.controller,
      required this.icons,
      required this.hint,
      required this.isPassword,
      required this.eyeVisibility})
      : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool passVisibility;

  @override
  void initState() {
    super.initState();
    passVisibility = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(vertical: 1.2.h, horizontal: 8.w),
      height: 7.h,
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
      child: TextField(
        keyboardType: TextInputType.text,
        cursorColor: Colors.black,
        controller: widget.controller,
        textInputAction: TextInputAction.next,
        obscureText: passVisibility,
        textAlign: TextAlign.left,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: IconButton(
            onPressed: () {},
            icon: Icon(
              widget.icons,
              size: 18.sp,
            ),
            color: const Color(0xFF7C8592),
          ),
          suffixIcon: widget.isPassword && widget.eyeVisibility
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      passVisibility = !passVisibility;
                    });
                  },
                  icon: Icon(
                    passVisibility
                        ? FontAwesomeIcons.solidEye
                        : FontAwesomeIcons.solidEyeSlash,
                    size: 18.sp,
                  ),
                  color: const Color(0xFF7C8592),
                )
              : null,
          hintText: widget.hint,
          hintStyle: TextStyle(
              color: const Color(0xFF7C8592),
              fontSize: 14.sp,
              fontFamily: "Roboto",
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal),
        ),
        style: TextStyle(color: Colors.black, fontSize: 14.sp),
      ),
    );
  }
}
