import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:together_forever/controllers/customize_meal_controller.dart';
import 'package:together_forever/models/meal_model.dart';
import 'package:together_forever/shared/constants.dart';
import 'package:together_forever/widgets/custom_text.dart';

class BoosterRadioTile extends StatelessWidget {
  final Booster value;
  final Meal meal;
  const BoosterRadioTile({
    Key? key,
    required this.value,
    required this.meal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomizeMealController>(
      init: Get.find<CustomizeMealController>(),
      builder: (controller) => RadioListTile(
          dense: false,
          isThreeLine: false,
          contentPadding: EdgeInsets.zero,
          title: CustomText(
            text: convertBoosterToString(value),
          ),
          value: value,
          groupValue: controller.booster,
          onChanged: (Booster? value) => controller.selectMealBooster(value!,meal.id)),
    );
  }

  
}
