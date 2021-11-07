import 'package:flutter/material.dart';
import 'package:together_forever/models/meal_model.dart';
import 'package:together_forever/shared/constants.dart';
import 'package:together_forever/widgets/custom_text.dart';

class IngrediantRadio extends StatefulWidget {
  const IngrediantRadio({required this.meal, required this.index, Key? key})
      : super(key: key);
  final Meal meal;
  final int index;
  @override
  _IngrediantRadioState createState() => _IngrediantRadioState();
}

class _IngrediantRadioState extends State<IngrediantRadio> {
  Customization? _customization = Customization.REGULAR;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: widget.meal.customizeIngrediants[widget.index]['ingrediant'],
          ),
          Row(
            children: [
              Radio(
                value: Customization.REGULAR,
                groupValue: _customization,
                onChanged: (Customization? value) => setState(() {
                  _customization = value;
                  widget.meal.customizeIngrediants[widget.index]['value'] =
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
                  widget.meal.customizeIngrediants[widget.index]['value'] =
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
                  widget.meal.customizeIngrediants[widget.index]['value'] =
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
    );
  }
}
