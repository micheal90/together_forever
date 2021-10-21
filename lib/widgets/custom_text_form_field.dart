import 'package:flutter/material.dart';
import 'package:together_forever/widgets/custom_text.dart';

class CustomTextFormField extends StatelessWidget {
  final String? text, hint;
  final Function? onSave;
  final Function? validator;
  final TextInputType? keyboardType;
  final bool isPassword;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  CustomTextFormField(
      {this.text,
      this.hint,
      this.isPassword = false,
      this.onSave,
      this.validator,
      this.keyboardType,
      this.prefixIcon,
      this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        CustomText(
          text: text,
          color: Colors.grey,
        ),
        TextFormField(
          onSaved: onSave as void Function(String?)?,
          obscureText: isPassword,
          validator: validator as String? Function(String?)?,
          keyboardType: keyboardType,
          decoration: InputDecoration(
              fillColor: Colors.white,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              hintText: hint,
              hintStyle: TextStyle(
                color: Colors.black,
              )),
        ),
      ]),
    );
  }
}
