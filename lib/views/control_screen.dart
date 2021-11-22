import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:together_forever/controllers/auth_controller.dart';
import 'package:together_forever/views/auth/signin_screen.dart';
import 'package:together_forever/views/home_screen.dart';

class ControlScreen extends GetWidget<Authcontroller> {
  const ControlScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Get.find<Authcontroller>().user == null
          ? SignInScreen()
          : const HomeScreen();
    });
  }
}
