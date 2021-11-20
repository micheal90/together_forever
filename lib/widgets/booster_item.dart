import 'package:flutter/material.dart';
import 'package:together_forever/models/meal_model.dart';
import 'package:together_forever/shared/constants.dart';
import 'package:together_forever/shared/size_config.dart';
import 'package:together_forever/widgets/custom_text.dart';

class BoosterItem extends StatefulWidget {
  const BoosterItem({required this.meal, Key? key}) : super(key: key);
  final Meal meal;
  //final int index;
  @override
  _BoosterItemState createState() => _BoosterItemState();
}

class _BoosterItemState extends State<BoosterItem> {
  Booster _booster = Booster.REGULAR;
  @override
  Widget build(BuildContext context) {
    return RadioListTile(
        title: CustomText(
          text: widget.meal.booster,
        ),
        value: Booster.REGULAR,
        groupValue: _booster,
        onChanged: (Booster? value) {
          setState(() {
            _booster = value!;
            widget.meal.booster = value.toString();
            print(widget.meal.booster);
          });
        });
  }
}
