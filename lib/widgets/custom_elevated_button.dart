import 'package:flutter/material.dart';

import 'package:together_forever/shared/constants.dart';
import 'package:together_forever/widgets/custom_text.dart';

class CustomElevatedButton extends StatelessWidget {
  final String? text;
  final Function? onPressed;

  const CustomElevatedButton({
    Key? key,
    this.text,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed as void Function()?,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: CustomText(
          text: text,
          alignment: Alignment.center,
          color: Colors.white,
        ),
      ),
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),)),
        backgroundColor: MaterialStateProperty.all(KPrimaryColor),
      ),
    );
  }
}
