import 'package:flutter/material.dart';
import 'package:together_forever/models/meal_model.dart';
import 'package:together_forever/shared/constants.dart';
import 'package:together_forever/widgets/adds_item.dart';
import 'package:together_forever/widgets/custom_label.dart';
import 'package:together_forever/widgets/custom_text.dart';

class AddsWidget extends StatelessWidget {
  const AddsWidget({required this.meal, Key? key}) : super(key: key);
  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomLabel(text: 'ADDS'),
        ListView.separated(
           padding: const EdgeInsets.symmetric(horizontal: 10.0),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: meal.adds.length,
          itemBuilder: (context, index) => AddsItem(
            meal: meal,
            index: index,
          ),
          separatorBuilder: (context, index) => const Divider(),
        )
      ],
    );
  }
}
