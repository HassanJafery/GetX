import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/theme_controler.dart';
import 'homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Initialize the themeController here
  static final ThemeControl themeController = Get.put(ThemeControl());

  @override
  Widget build(BuildContext context) {
    return Obx(() => GetMaterialApp(
          title: 'flutter getx',
          theme: themeController.isDarkMode.value
              ? ThemeData.dark()
              : ThemeData.light(),
          home: HomePage(),
        ));
  }
}
