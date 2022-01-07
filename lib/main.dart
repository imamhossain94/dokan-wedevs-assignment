import 'package:dokan_wedevs_assignment/views/signin_page.dart';
import 'package:flutter/material.dart';

import 'services/theme_service.dart';
import 'utils/themes.dart';
import 'utils/themes_mode.dart';
import 'views/signup_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    ThemesMode().init(context);

    return MaterialApp(
      title: 'Dokan',
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeService().theme,
      debugShowCheckedModeBanner: false,
      home: SignUpPage(),
    );
  }
}
