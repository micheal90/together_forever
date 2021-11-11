import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:together_forever/controllers/auth_controller.dart';
import 'package:together_forever/widgets/custom_text.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(),
          TextButton(
              onPressed: () => Get.find<Authcontroller>().signOut(),
              child: CustomText(
                text: 'logOut',
              ))
        ],
      ),
    );
  }
}
