import 'package:flutter/material.dart';
import 'package:together_forever/models/meal_model.dart';
import 'package:together_forever/shared/constants.dart';
import 'package:together_forever/widgets/custom_label.dart';
import 'package:together_forever/widgets/custom_text.dart';

class BoosterWidget extends StatefulWidget {
  const BoosterWidget({
    Key? key,
    required this.meal,
  }) : super(key: key);

  final Meal meal;

  @override
  State<BoosterWidget> createState() => _BoosterWidgetState();
}

class _BoosterWidgetState extends State<BoosterWidget> {
  Booster _booster = Booster.REGULAR;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomLabel(text: 'MEAL BOOSTER'),
        Column(
          children: [
            radioTile(Booster.REGULAR),
            radioTile(Booster.FRIES_WITH_PEPCI),
            radioTile(Booster.FRIES_WITH_DITE_PEPCI),
            radioTile(Booster.FRIES_WITH_7UP),
            radioTile(Booster.FRIES_WITH_DITE_7UP),
            radioTile(Booster.FRIES_WITH_BEER),
          ],
        ),
      ],
    );
  }

  RadioListTile<Booster> radioTile(value) {
    return RadioListTile(
        dense: false,
        isThreeLine: false,
        contentPadding: EdgeInsets.zero,
        title: CustomText(
          text: convertToString(value),
        ),
        value: value,
        groupValue: _booster,
        onChanged: (Booster? value) {
          setState(() {
            _booster = value!;
            widget.meal.booster = value.toString();
            //print(widget.meal.booster);
          });
        });
  }

  convertToString(Booster value) {
    if (value == Booster.REGULAR) {
      return 'Regular + 1.5 Euro';
    } else if (value == Booster.FRIES_WITH_PEPCI) {
      return 'Fries whith pepci + 1.5 Euro';
    } else if (value == Booster.FRIES_WITH_DITE_PEPCI) {
      return 'Fries whith dite pepci + 1.5 Euro';
    } else if (value == Booster.FRIES_WITH_7UP) {
      return 'Fries whith 7up + 1.5 Euro';
    } else if (value == Booster.FRIES_WITH_DITE_7UP) {
      return 'Fries whith dite 7up + 1.5 Euro';
    } else {
      return 'Fries whith beer + 2 Euro';
    }
  }
}
