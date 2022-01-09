import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomIconButton extends StatelessWidget {
  final Icon icon;
  final VoidCallback onPressed;

  const CustomIconButton(
      {Key? key, required this.icon, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(10),
      color: Colors.white, // Button color
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        splashColor: Colors.grey, // Splash color
        onTap: onPressed,
        child: SizedBox(
            width: 15.w,
            height: 15.w,
            child: icon
        ),
      ),
    );
  }
}
