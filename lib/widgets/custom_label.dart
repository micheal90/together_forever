import 'package:flutter/material.dart';
import 'package:together_forever/widgets/custom_text.dart';

class CustomLabel extends StatelessWidget {
  const CustomLabel({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade300,
      padding: const EdgeInsets.all(10.0),
      child: CustomText(
        text: text,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}