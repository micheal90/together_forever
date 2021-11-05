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
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          hintText: 'Search for a product',
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(KBorderRadius)),
        ),
      ),
    );
  }
}
