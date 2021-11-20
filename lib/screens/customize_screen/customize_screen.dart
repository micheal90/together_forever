import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:together_forever/controllers/customize_meal_controller.dart';
import 'package:together_forever/models/meal_model.dart';
import 'package:together_forever/shared/constants.dart';
import 'package:together_forever/widgets/adds_item.dart';
import 'package:together_forever/widgets/booster_radio_tile.dart';
import 'package:together_forever/widgets/custom_elevated_button.dart';
import 'package:together_forever/widgets/custom_label.dart';
import 'package:together_forever/widgets/custom_text.dart';
import 'package:together_forever/widgets/customize_item.dart';

class CustomizeScreen extends StatefulWidget {
  const CustomizeScreen({Key? key}) : super(key: key);
  static const routeName = '/customizeScreen';

  @override
  State<CustomizeScreen> createState() => _CustomizeScreenState();
}

class _CustomizeScreenState extends State<CustomizeScreen> {
  // String mealId = Get.arguments;
  String mealId = '1';
  late Meal meal;
  @override
  void initState() {
    super.initState();
    meal = Get.find<CustomizeMealController>().findMealById(mealId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 180,
            leading: IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )),
            flexibleSpace: FlexibleSpaceBar(
              background: FancyShimmerImage(
                imageUrl: meal.imageUrl,
                boxFit: BoxFit.cover,
              ),
              title: const Text(
                'SliverAppBar',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Column(
              children: [
                customizeSection(),
                boosterSection(),
                addsSection(),
                additionalSection(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
                  child: CustomElevatedButton(
                    text: 'ADD TO CART',
                    onPressed: () {
                      debugPrint(meal.toMap().toString());
                    },
                  ),
                )
              ],
            ),
          ]))
        ],
      ),
    );
  }

  Widget customizeSection() => Column(
        children: [
          const CustomLabel(text: 'Customization'),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
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
  Widget boosterSection() => Column(
        children: [
          const CustomLabel(text: 'MEAL BOOSTER'),
          Column(
            children: [
              BoosterRadioTile(meal: meal, value: Booster.REGULAR),
              BoosterRadioTile(meal: meal, value: Booster.FRIES_WITH_PEPCI),
              BoosterRadioTile(
                  meal: meal, value: Booster.FRIES_WITH_DITE_PEPCI),
              BoosterRadioTile(meal: meal, value: Booster.FRIES_WITH_7UP),
              BoosterRadioTile(meal: meal, value: Booster.FRIES_WITH_DITE_7UP),
              BoosterRadioTile(meal: meal, value: Booster.FRIES_WITH_BEER),
            ],
          ),
        ],
      );
  Widget addsSection() => Column(
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
  Widget additionalSection() => Container(
        height: 80,
        margin: const EdgeInsets.all(10.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          //border: Border.all(),
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.grey.shade200,
        ),
        child: TextField(
          decoration: const InputDecoration(
            hintText: 'Additional Instructions',
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            errorBorder: InputBorder.none,
          ),
          maxLines: 3,
          onChanged: (String? value) {
            setState(() {
              meal.additional = value;
            });
          },
        ),
      );
}
