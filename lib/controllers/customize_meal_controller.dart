import 'package:get/get.dart';
import 'package:together_forever/models/meal_model.dart';
import 'package:together_forever/shared/constants.dart';

class CustomizeMealController extends GetxController {
  List<Meal> meals = [
    Meal(
      id: '1',
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
        {'title': 'CORN', 'price': 0.5,'count':0},
        {'title': 'CHEDDER CHEESE', 'price': 0.5,'count':0},
        {'title': 'EXTRA CHEESE', 'price': 1,'count':0},
        {'title': 'HOT SOUCE', 'price': 0.5,'count':0},
      ],
    ),
    Meal(
      id: '2',
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
        {'title': 'CORN', 'price': 0.5,'count':0},
        {'title': 'CHEDDER CHEESE', 'price': 0.5,'count':0},
        {'title': 'EXTRA CHEESE', 'price': 1,'count':0},
        {'title': 'HOT SOUCE', 'price': 0.5,'count':0},
      ],
    ),
    Meal(
      id: '3',
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
        {'title': 'CORN', 'price': 0.5,'count':0},
        {'title': 'CHEDDER CHEESE', 'price': 0.5,'count':0},
        {'title': 'EXTRA CHEESE', 'price': 1,'count':0},
        {'title': 'HOT SOUCE', 'price': 0.5,'count':0},
      ],
    )
  ];



  Booster _booster = Booster.REGULAR;
  Booster get booster => _booster;

  void selectMealBooster(Booster value, String mealId) {
    _booster = value;
    findMealById(mealId).booster = convertBoosterToString(value);
    update();
  }

  Meal findMealById(String id) =>
      meals.firstWhere((element) => element.id == id);
}
