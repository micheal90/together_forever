import 'package:flutter/material.dart';
import 'package:together_forever/widgets/custom_list_tile_appbar.dart';

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
          CustomListTileAppBar(
            leading: Icons.settings,
            title: 'Settings',
            onPressed: () {},
          ),
          CustomListTileAppBar(
            leading: Icons.shopping_cart_outlined,
            title: 'My Cart',
            onPressed: () {},
          ),
          CustomListTileAppBar(
            leading: Icons.shopping_bag_outlined,
            title: 'My Order',
            onPressed: () {},
          ),
          CustomListTileAppBar(
            leading: Icons.mail,
            title: 'Contact Us',
            onPressed: () {},
          ),
          CustomListTileAppBar(
            leading: Icons.notifications_none_outlined,
            title: 'Notifications',
            onPressed: () {},
          ),
          CustomListTileAppBar(
            leading: Icons.location_on_rounded,
            title: 'Location',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
