import 'package:flutter/material.dart';
import 'package:together_forever/shared/constants.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(KBorderRadius),
          color: Colors.grey.shade200,
        ),
        child: TextFormField(
          onTap: (){},
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.search),
            hintText: 'Search for a product',
            enabledBorder: InputBorder.none,
            border: InputBorder.none,
            errorBorder: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
