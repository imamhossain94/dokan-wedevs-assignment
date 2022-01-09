import 'package:dokan_wedevs_assignment/views/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';

import 'services/get_storage_service.dart';
import 'services/theme_service.dart';
import 'utils/themes.dart';
import 'utils/themes_mode.dart';
import 'views/main_page.dart';
import 'views/signup_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    ThemesMode().init(context);

    return Sizer(
        builder: (context, orientation, deviceType) {
          return GetMaterialApp(
            title: 'Dokan',
            theme: Themes.light,
            darkTheme: Themes.dark,
            themeMode: ThemeService().theme,
            debugShowCheckedModeBanner: false,
            home: getCurrentUser() != null?MainPage():const SignInPage(),
          );
        }
    );


  }

}
