import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
        color: const Color(0xFF7C8592),
      ),
      trailing: Icon(
        isExpanded?FontAwesomeIcons.chevronRight:FontAwesomeIcons.chevronDown,
        color: const Color(0xFF7C8592),
        size: 20,
      ),
      onExpansionChanged: (value){
        setState(() {
          isExpanded = !value;
        });
      },
      title: Text(
        widget.title,
        style: const TextStyle(
            color: Color(0xFF222455),
            fontSize: 24,
            fontFamily: "Roboto",
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.normal),
      ),
      children: widget.children,
    );
  }
}
