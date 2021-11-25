import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:together_forever/views/settings_screen/settings_screen.dart';
import 'package:together_forever/widgets/custom_list_tile.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            duration: Duration(
              milliseconds: 800,
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      'assets/images/together-forever-cover.jpg',
                    ))),
            child: null,
          ),
          CustomListTile(
            leading: Icons.shopping_cart_outlined,
            title: 'My Cart',
            onPressed: () {},
          ),
          CustomListTile(
            leading: Icons.shopping_bag_outlined,
            title: 'My Order',
            onPressed: () {},
          ),
          CustomListTile(
            leading: Icons.settings,
            title: 'Settings',
            onPressed: ()=>Get.toNamed(SettingsScreen.routeName),
          ),
          CustomListTile(
            leading: Icons.notifications_none_outlined,
            title: 'Notifications',
            onPressed: () {},
          ),
          CustomListTile(
            leading: Icons.location_on_rounded,
            title: 'Location',
            onPressed: () {},
          ),
          CustomListTile(
            leading: Icons.mail,
            title: 'Contact Us',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
