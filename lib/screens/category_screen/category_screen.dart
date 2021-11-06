import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:together_forever/shared/constants.dart';
import 'package:together_forever/widgets/app_drawer.dart';
import 'package:together_forever/widgets/custom_app_bar.dart';
import 'package:together_forever/widgets/custom_text.dart';
import 'package:together_forever/widgets/tabbar_item.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);
  static const routeName = '/categoryScreen';

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> categoriesList = [
    'Sandwitch',
    'Pizza',
    'Meal',
   
  ];
  @override
  void initState() {
    _tabController = TabController(
      length: categoriesList.length,
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        tabBar: TabBar(
            isScrollable: true,
            controller: _tabController,
            indicatorColor: Colors.amber,
            labelColor: Colors.amber,
            unselectedLabelColor: Colors.black,
            labelStyle:
                const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            tabs: categoriesList
                .map((e) => Tab(
                      text: e,
                    ))
                .toList()),
      ),
      body: TabBarView(
          controller: _tabController,
          physics: const BouncingScrollPhysics(),
          children: categoriesList
              .map((e) => TabBarItem(
                    category: e,
                  ))
              .toList()),
      drawer: const AppDrawer(),
    );
  }

  AppBar appBarCustom() {
    return AppBar(
      centerTitle: true,
      backgroundColor: KPrimaryColor,
      elevation: 0,
      title: const CustomText(
        text: 'Together Forever',
        fontSize: 20,
        fontWeight: FontWeight.bold,
        alignment: Alignment.center,
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        )
      ],
      bottom: TabBar(
          isScrollable: true,
          controller: _tabController,
          indicatorColor: Colors.red,
          labelColor: Colors.red,
          unselectedLabelColor: Colors.black,
          labelStyle: const TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
          tabs: categoriesList
              .map((e) => Tab(
                    text: e,
                  ))
              .toList()),
    );
  }
}
