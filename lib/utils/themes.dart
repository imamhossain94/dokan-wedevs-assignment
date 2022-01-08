import 'package:dokan_wedevs_assignment/utils/constants.dart';
import 'package:flutter/material.dart';

class Themes {
  static final light = ThemeData.light().copyWith(
    backgroundColor: scaffoldBackgroundLight,
    unselectedWidgetColor: const Color(0xFFFF708A),

  );
  static final dark = ThemeData.dark().copyWith(
    backgroundColor: scaffoldBackgroundDark,
    unselectedWidgetColor: const Color(0xFFFF708A),

  );
}