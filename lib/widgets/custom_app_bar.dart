import 'package:flutter/material.dart';
import 'package:together_forever/shared/constants.dart';
import 'package:together_forever/widgets/custom_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({this.tabBar, Key? key}) : super(key: key);

  final TabBar? tabBar;

  @override
  Size get preferredSize =>
      Size.fromHeight(tabBar == null ? kToolbarHeight : 80);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: KPrimaryColor,
      elevation: 0,
      title: const CustomText(
        text: 'TOGETHER FOREVER',
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        alignment: Alignment.center,
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        )
      ],
      bottom: tabBar,
    );
  }
}
