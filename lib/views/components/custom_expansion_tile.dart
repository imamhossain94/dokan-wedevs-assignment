import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

class CustomExpansionTile extends StatefulWidget {
  final IconData icon;
  final String title;
  final List<Widget> children;

  const CustomExpansionTile(
      {Key? key,
      required this.children,
      required this.icon,
      required this.title})
      : super(key: key);

  @override
  _CustomExpansionTileState createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {

  bool isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: Icon(
        widget.icon,
        size: 18.sp,
        color: const Color(0xFF7C8592),
      ),
      trailing: Icon(
        isExpanded?FontAwesomeIcons.chevronRight:FontAwesomeIcons.chevronDown,
        color: const Color(0xFF7C8592),
        size: 14.sp,
      ),
      onExpansionChanged: (value){
        setState(() {
          isExpanded = !value;
        });
      },
      title: Text(
        widget.title,
        style: TextStyle(
            color: const Color(0xFF222455),
            fontSize: 16.sp,
            fontFamily: "Roboto",
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.normal),
      ),
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      children: widget.children,
    );
  }
}
