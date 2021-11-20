import 'package:flutter/material.dart';

import 'package:together_forever/models/meal_model.dart';
import 'package:together_forever/shared/constants.dart';
import 'package:together_forever/widgets/custom_text.dart';

class AddsItem extends StatefulWidget {
  const AddsItem({
    Key? key,
    required this.meal,
    required this.index,
  }) : super(key: key);
  final Meal meal;
  final int index;

  @override
  _AddsItemState createState() => _AddsItemState();
}

class _AddsItemState extends State<AddsItem> {
  var count = 0;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (count > 0)
            Container(
              width: 3,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: KPrimaryColor,
              ),
            ),
          if (count > 0)
            const SizedBox(
              width: 2,
            ),
          const CircleAvatar(
            backgroundImage: AssetImage(
              'assets/images/logo2.png',
            ),
            maxRadius: 25.0,
          ),
        ],
      ),
      title: CustomText(
        text: widget.meal.adds[widget.index]['title'],
      ),
      subtitle: CustomText(
        text:
            '+ ' + widget.meal.adds[widget.index]['price'].toString() + ' Euro',
      ),
      trailing: count == 0
          ? null
          : FittedBox(
              child: Row(
                children: [
                  Text('$count x'),
                  IconButton(
                      onPressed: () => setState(() {
                         count = 0;
                         widget.meal.adds[widget.index]['count'] = count;
                      }),
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                        size: 30.0,
                      ))
                ],
              ),
            ),
      onTap: () => setState(() {
        count++;
        widget.meal.adds[widget.index]['count'] = count;
      }),
    );
  }
}
