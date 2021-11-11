import 'package:flutter/material.dart';

class AdditionalInstuctions extends StatelessWidget {
  const AdditionalInstuctions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        //border: Border.all(),
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.grey.shade200,
      ),
      child: TextField(
        decoration: const InputDecoration(
          hintText: 'Additional Instructions',
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
        ),
        onChanged: (String? value) {
          debugPrint(value);
        },
      ),
    );
  }
}
