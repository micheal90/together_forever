import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final double fontSize;
  final Color color;
  final Alignment alignment;
  final FontWeight? fontWeight;
  final TextOverflow? overflow;
  final double? height;
  final int? maxLines;

  CustomText(
      {this.text = "",
      this.fontSize = 16,
      this.color = Colors.black,
      this.alignment = Alignment.topLeft,
      this.overflow,
      this.height,
      this.maxLines,
      this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(text!,
          overflow: overflow,
          maxLines: maxLines,
          style: TextStyle(
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: color,
              height: height)),
    );
  }
}
