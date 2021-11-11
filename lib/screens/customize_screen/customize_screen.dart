import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:together_forever/models/meal_model.dart';
import 'package:together_forever/widgets/additional_instructions.dart';
import 'package:together_forever/widgets/adds_widget.dart';
import 'package:together_forever/widgets/booster_item.dart';
import 'package:together_forever/widgets/booster_widget.dart';
import 'package:together_forever/widgets/custom_elevated_button.dart';
import 'package:together_forever/widgets/custom_label.dart';
import 'package:together_forever/widgets/custom_text.dart';
import 'package:together_forever/widgets/customization_widget.dart';

class CustomizeScreen extends StatefulWidget {
  const CustomizeScreen({Key? key}) : super(key: key);
  static const routeName = '/customizeScreen';

  @override
  State<CustomizeScreen> createState() => _CustomizeScreenState();
}

class _CustomizeScreenState extends State<CustomizeScreen> {
  late Meal meal;
  @override
  void initState() {
    super.initState();
    meal = Meal(
      title: 'title',
      subTitle: 'subTitle',
      imageUrl:
          'https://image.freepik.com/free-photo/turkish-pide-with-minced-meat-kiymali-pide-traditional-turkish-cuisine-turkish-pizza-pita-with-meat-top-view-overhead_2829-20272.jpg',
      price: 5.0,
      customizeIngrediants: [
        {'ingrediant': 'Tomato', 'value': 'REGULAR'},
        {'ingrediant': 'Ketchup', 'value': 'REGULAR'},
        {'ingrediant': 'Coleslaw', 'value': 'REGULAR'},
        {'ingrediant': 'Frise', 'value': 'REGULAR'},
 
      ],
      booster: 'Regular',
      adds: [
        {'title': 'CORN', 'price': 0.5},
        {'title': 'CHEDDER CHEESE', 'price': 0.5},
        {'title': 'EXTRA CHEESE', 'price': 1},
        {'title': 'HOT SOUCE', 'price': 0.5},
      ],
    );
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
                CustomizationWidget(
                  meal: meal,
                ),
                BoosterWidget(meal: meal),
                AddsWidget(
                  meal: meal,
                ),
                const AdditionalInstuctions(),
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
}
