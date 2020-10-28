import 'package:flutter/material.dart';
import 'package:german_dict/ui/pages/about.dart';
import '../core/hive.dart';
import '../ui/pages/details_page.dart';
import '../ui/pages/intro_page.dart';
import '../core/scrollbehavior.dart';
import '../core/theme.dart';
import 'package:get/route_manager.dart';

import '../core/theme_controller.dart';
import '../ui/pages/home_page.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  final HiveWrapper hive = Get.find();

  @override
  Widget build(BuildContext context) {
    ThemeController.to.getThemeModeFromPreferences();

    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => HomePage()),
        GetPage(name: '/home', page: () => HomePage()),
        GetPage(name: '/about', page: () => About()),
        GetPage(
            name: '/details',
            page: () => DetailsPage(),
            transition: Transition.cupertino),
        GetPage(name: '/intro', page: () => IntroPage())
      ],
      title: 'German Dictionary',
      theme: AppTheme.lightTheme(),
      darkTheme: AppTheme.darkTheme(),
      themeMode: ThemeMode.light,
      home: ScrollConfiguration(behavior: MyBehavior(), child: HomePage()),
    );
  }
}
