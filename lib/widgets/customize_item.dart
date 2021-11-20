import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:together_forever/controllers/customize_meal_controller.dart';
import 'package:together_forever/models/meal_model.dart';
import 'package:together_forever/shared/constants.dart';
import 'package:together_forever/widgets/custom_text.dart';

class CustomizeItem extends StatefulWidget {
  const CustomizeItem({required this.meal, required this.index, Key? key})
      : super(key: key);
  final Meal meal;
  final int index;
  @override
  _CustomizeItemState createState() => _CustomizeItemState();
}

class _CustomizeItemState extends State<CustomizeItem> {
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

                  widget.meal
                          .customizeIngrediants[widget.index]['value'] =
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
                  widget.meal
                          .customizeIngrediants[widget.index]['value'] =
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
                  widget.meal
                          .customizeIngrediants[widget.index]['value'] =
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
