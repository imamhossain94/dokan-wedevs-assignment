import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final IconData icons;
  final String hint;
  final bool isPassword, eyeVisibility;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.icons,
    required this.hint,
    required this.isPassword,
    required this.eyeVisibility
  }) : super(key: key);

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
      padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
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
      child: TextField(
        keyboardType: TextInputType.text,
        cursorColor: Colors.black,
        controller: widget.controller,
        textInputAction: TextInputAction.next,
        obscureText: passVisibility,
        decoration: InputDecoration(
          isDense: true,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 15),
          prefixIcon: IconButton(
            onPressed: () {},
            icon: Icon(widget.icons),
            color: const Color(0xFF7C8592),
          ),
          suffixIcon: widget.isPassword && widget.eyeVisibility?IconButton(
            onPressed: () {
              setState(() {
                passVisibility = !passVisibility;
              });
            },
            icon: Icon(passVisibility?FontAwesomeIcons.solidEye:FontAwesomeIcons.solidEyeSlash),
            color: const Color(0xFF7C8592),
          ):null,
          hintText: widget.hint,
          hintStyle: const TextStyle(
              color: Color(0xFF7C8592),
              fontSize: 20,
              fontFamily: "Roboto",
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal),
        ),
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}
