import 'package:flutter/material.dart';
import 'package:together_forever/models/meal_model.dart';
import 'package:together_forever/shared/constants.dart';
import 'package:together_forever/widgets/booster_item.dart';
import 'package:together_forever/widgets/custom_label.dart';
import 'package:together_forever/widgets/custom_text.dart';
import 'package:together_forever/widgets/customize_item.dart';

class CustomizationWidget extends StatelessWidget {
  const CustomizationWidget({required this.meal, Key? key}) : super(key: key);
  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomLabel(text: 'Customization'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              CustomText(
                text: 'REGULAR',
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                width: 15.0,
              ),
              CustomText(
                text: 'LESS',
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                width: 15.0,
              ),
              CustomText(
                text: 'REMOVE',
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                width: 15.0,
              ),
            ],
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => CustomizeItem(
            meal: meal,
            index: index,
          ),
          itemCount: meal.customizeIngrediants.length,
        ),
      ],
    );
  }
}
