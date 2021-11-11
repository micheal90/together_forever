import 'package:flutter/material.dart';
import 'package:together_forever/models/meal_model.dart';
import 'package:together_forever/widgets/grid_item.dart';

class TabBarItem extends StatelessWidget {
  TabBarItem({
    required this.category,
    Key? key,
  }) : super(key: key);
  final String category;
  final items = {
    'Sandwitch': [
      Meal(
        title: 'Big Mac Burger Big Mac Burger',
        subTitle: 'Sint nisi velit sit laboris adipisicing Lorem.',
        imageUrl:
            'https://img.freepik.com/free-photo/big-hamburger-with-double-beef-french-fries_252907-8.jpg?size=338&ext=jpg',
        price: 5.0,
        isFavorite: true,
        customizeIngrediants: [
          {'ingrediant': 'Tomato', 'value': 'REGULAR'},
          {'ingrediant': 'Ketchup', 'value': 'REGULAR'},
          {'ingrediant': 'Coleslaw', 'value': 'REGULAR'},
          {'ingrediant': 'Frise', 'value': 'REGULAR'},
        ],
        booster: 'REGULAR',
        adds: [
          {'title': 'CORN', 'PRICE': 0.5},
          {'title': 'CHEDDER CHEESE', 'PRICE': 0.5},
          {'title': 'EXTRA CHEESE', 'PRICE': 1},
          {'title': 'HOT SOUCE', 'PRICE': 0.5},
        ],
      ),
      Meal(
        title: 'Big Mac Burger',
        subTitle: 'Sint nisi velit sit laboris adipisicing Lorem.',
        imageUrl:
            'https://img.freepik.com/free-photo/big-hamburger-with-double-beef-french-fries_252907-8.jpg?size=338&ext=jpg',
        price: 3.0,
        customizeIngrediants: [
          {'ingrediant': 'Tomato', 'value': 'REGULAR'},
          {'ingrediant': 'Ketchup', 'value': 'REGULAR'},
          {'ingrediant': 'Coleslaw', 'value': 'REGULAR'},
          {'ingrediant': 'Frise', 'value': 'REGULAR'},
        ],
        booster: 'REGULAR',
        adds: [
          {'title': 'CORN', 'PRICE': 0.5},
          {'title': 'CHEDDER CHEESE', 'PRICE': 0.5},
          {'title': 'EXTRA CHEESE', 'PRICE': 1},
          {'title': 'HOT SOUCE', 'PRICE': 0.5},
        ],
      ),
      Meal(
        title: 'Big Mac Burger',
        subTitle: 'Sint nisi velit sit laboris adipisicing Lorem.',
        imageUrl:
            'https://img.freepik.com/free-photo/big-hamburger-with-double-beef-french-fries_252907-8.jpg?size=338&ext=jpg',
        price: 3.0,
        customizeIngrediants: [
          {'ingrediant': 'Tomato', 'value': 'REGULAR'},
          {'ingrediant': 'Ketchup', 'value': 'REGULAR'},
          {'ingrediant': 'Coleslaw', 'value': 'REGULAR'},
          {'ingrediant': 'Frise', 'value': 'REGULAR'},
        ],
        booster: 'REGULAR',
        adds: [
          {'title': 'CORN', 'PRICE': 0.5},
          {'title': 'CHEDDER CHEESE', 'PRICE': 0.5},
          {'title': 'EXTRA CHEESE', 'PRICE': 1},
          {'title': 'HOT SOUCE', 'PRICE': 0.5},
        ],
      ),
      Meal(
        title: 'Big Mac Burger',
        subTitle: 'Sint nisi velit sit laboris adipisicing Lorem.',
        imageUrl:
            'https://img.freepik.com/free-photo/big-hamburger-with-double-beef-french-fries_252907-8.jpg?size=338&ext=jpg',
        price: 6.0,
        customizeIngrediants: [
          {'ingrediant': 'Tomato', 'value': 'REGULAR'},
          {'ingrediant': 'Ketchup', 'value': 'REGULAR'},
          {'ingrediant': 'Coleslaw', 'value': 'REGULAR'},
          {'ingrediant': 'Frise', 'value': 'REGULAR'},
        ],
        booster: 'REGULAR',
        adds: [
          {'title': 'CORN', 'PRICE': 0.5},
          {'title': 'CHEDDER CHEESE', 'PRICE': 0.5},
          {'title': 'EXTRA CHEESE', 'PRICE': 1},
          {'title': 'HOT SOUCE', 'PRICE': 0.5},
        ],
      ),
    ],
    'Pizza': [
      Meal(
        title: 'Big Mac Burger',
        subTitle: 'Sint nisi velit sit laboris adipisicing Lorem.',
        imageUrl:
            'https://img.freepik.com/free-photo/big-hamburger-with-double-beef-french-fries_252907-8.jpg?size=338&ext=jpg',
        price: 3.0,
        customizeIngrediants: [
          {'ingrediant': 'Tomato', 'value': 'REGULAR'},
          {'ingrediant': 'Ketchup', 'value': 'REGULAR'},
          {'ingrediant': 'Coleslaw', 'value': 'REGULAR'},
          {'ingrediant': 'Frise', 'value': 'REGULAR'},
        ],
        booster: 'REGULAR',
        adds: [
          {'title': 'CORN', 'PRICE': 0.5},
          {'title': 'CHEDDER CHEESE', 'PRICE': 0.5},
          {'title': 'EXTRA CHEESE', 'PRICE': 1},
          {'title': 'HOT SOUCE', 'PRICE': 0.5},
        ],
      ),
      Meal(
        title: 'Big Mac Burger',
        subTitle: 'Sint nisi velit sit laboris adipisicing Lorem.',
        imageUrl:
            'https://img.freepik.com/free-photo/big-hamburger-with-double-beef-french-fries_252907-8.jpg?size=338&ext=jpg',
        price: 7.0,
        customizeIngrediants: [
          {'ingrediant': 'Tomato', 'value': 'REGULAR'},
          {'ingrediant': 'Ketchup', 'value': 'REGULAR'},
          {'ingrediant': 'Coleslaw', 'value': 'REGULAR'},
          {'ingrediant': 'Frise', 'value': 'REGULAR'},
        ],
        booster: 'REGULAR',
        adds: [
          {'title': 'CORN', 'PRICE': 0.5},
          {'title': 'CHEDDER CHEESE', 'PRICE': 0.5},
          {'title': 'EXTRA CHEESE', 'PRICE': 1},
          {'title': 'HOT SOUCE', 'PRICE': 0.5},
        ],
      ),
    ],
    'Meal': [
      Meal(
        title: 'Big Mac Burger',
        subTitle: 'Sint nisi velit sit laboris adipisicing Lorem.',
        imageUrl:
            'https://img.freepik.com/free-photo/big-hamburger-with-double-beef-french-fries_252907-8.jpg?size=338&ext=jpg',
        price: 3.0,
        customizeIngrediants: [
          {'ingrediant': 'Tomato', 'value': 'REGULAR'},
          {'ingrediant': 'Ketchup', 'value': 'REGULAR'},
          {'ingrediant': 'Coleslaw', 'value': 'REGULAR'},
          {'ingrediant': 'Frise', 'value': 'REGULAR'},
        ],
        booster: 'REGULAR',
        adds: [
          {'title': 'CORN', 'PRICE': 0.5},
          {'title': 'CHEDDER CHEESE', 'PRICE': 0.5},
          {'title': 'EXTRA CHEESE', 'PRICE': 1},
          {'title': 'HOT SOUCE', 'PRICE': 0.5},
        ],
      ),
    ],
  };

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 2.0),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          childAspectRatio: 3 / 4,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          maxCrossAxisExtent: 250,
          mainAxisExtent: 250),
      itemCount: items[category]!.length,
      itemBuilder: (BuildContext context, int index) => GridItem(
        meal: items[category]![index],
      ),
    );
  }
}
