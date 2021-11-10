import 'package:flutter/material.dart';
import 'package:together_forever/models/meal_model.dart';
import 'package:together_forever/shared/constants.dart';
import 'package:together_forever/widgets/booster_item.dart';
import 'package:together_forever/widgets/custom_label.dart';
import 'package:together_forever/widgets/custom_text.dart';

class CustomizationWidget extends StatefulWidget {
  const CustomizationWidget({required this.meal, Key? key}) : super(key: key);
  final Meal meal;

  @override
  State<CustomizationWidget> createState() => _CustomizationWidgetState();
}

class _CustomizationWidgetState extends State<CustomizationWidget> {
  Customization? _customization = Customization.REGULAR;

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
        customizeItem(),
      ],
    );
  }

  SizedBox customizeItem() {
    return SizedBox(
        height: 200,
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: widget.meal.customizeIngrediants[index]['ingrediant'],
                ),
                Row(
                  children: [
                    Radio(
                      value: Customization.REGULAR,
                      groupValue: _customization,
                      onChanged: (Customization? value) => setState(() {
                        _customization = value;
                        widget.meal.customizeIngrediants[index]['value'] =
                            value.toString();
                      }),
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    Radio(
                      value: Customization.LESS,
                      groupValue: _customization,
                      onChanged: (Customization? value) => setState(() {
                        _customization = value;
                        widget.meal.customizeIngrediants[index]['value'] =
                            value.toString();
                      }),
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    Radio(
                      value: Customization.REMOVE,
                      groupValue: _customization,
                      onChanged: (Customization? value) => setState(() {
                        _customization = value;
                        widget.meal.customizeIngrediants[index]['value'] =
                            value.toString();
                      }),
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                  ],
                ),
              ],
            ),
          ),
          itemCount: widget.meal.customizeIngrediants.length,
        ),
      );
  }
}
