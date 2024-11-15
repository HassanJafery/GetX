import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/secound_page.dart';
import 'package:getx_app/theme_controler.dart'; // Make sure this is the correct path
import 'counter_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final CounterController counterController = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    final ThemeControl themeControl =
        Get.find(); // Ensure this is now 'ThemeControl'

    return Scaffold(
      appBar: AppBar(title: Text('GetX Counter Example')),
      body: Column(
        children: [
          Center(
            child: Obx(
              () => Text(
                "Count: ${counterController.count}",
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Get.off(SecoundPage());
            },
            child: Text('Next'),
          ),
          TextButton(
            onPressed: () {
              themeControl.setTheme(); // Correctly reference setTheme
            },
            child: Text('Dark Mode'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: counterController.increment,
        child: Icon(Icons.add),
      ),
    );
  }
}
