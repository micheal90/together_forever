import 'package:flutter/material.dart';
import 'package:together_forever/shared/constants.dart';
import 'package:together_forever/widgets/custom_text.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    Key? key,
    required this.leading,
    required this.title,
    required this.onPressed,
  }) : super(key: key);
  final IconData leading;
  final String title;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        leading,
        color: KPrimaryColor,
      ),
      title: CustomText(
        text: title,
        fontWeight: FontWeight.bold,
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: KPrimaryColor,
      ),
      onTap: onPressed,
    );
  }
}
