import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeControl extends GetxController {
  // Change 'themeControl' to 'ThemeControl'
  var isDarkMode = false.obs;

  void setTheme() {
    isDarkMode.value = !isDarkMode.value;

    Get.changeTheme(
      isDarkMode.value ? ThemeData.dark() : ThemeData.light(),
    );
  }
}
