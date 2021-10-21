import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:together_forever/controllers/auth_controller.dart';
import 'package:together_forever/screens/home_screen.dart';
import 'package:together_forever/screens/auth/signin_screen.dart';

class ControlScreen extends GetWidget<Authcontroller> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Get.find<Authcontroller>().user == null
          ? SignInScreen()
          : HomeScreen();
    });
  }
}
