import 'package:flutter/material.dart';
import 'package:get/get.dart';

import "counter_controller.dart";
import 'homepage.dart';
import 'main.dart';

class SecoundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CounterController counterController = Get.find();
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Obx(() => Text(
                  'Counter : ${counterController.count}',
                  style: TextStyle(fontSize: 20),
                )),
          ),
          TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text('go back'))
        ],
      ),
    );
  }
}
