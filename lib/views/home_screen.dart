import 'package:carousel_slider/carousel_slider.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shimmer/shimmer.dart';
import 'package:together_forever/shared/constants.dart';
import 'package:together_forever/shared/size_config.dart';
import 'package:together_forever/widgets/app_drawer.dart';
import 'package:together_forever/widgets/category_item.dart';
import 'package:together_forever/widgets/custom_app_bar.dart';
import 'package:together_forever/widgets/custom_text.dart';
import 'package:together_forever/widgets/search_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GoogleSignIn googleSignIn = GoogleSignIn();

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  int _indexImage = 0;
  final List<String> imageCoverList = [
    'https://image.freepik.com/free-photo/minestrone-italian-vegetable-soup-with-pasta-dark-table_2829-20843.jpg',
    'https://img.freepik.com/free-photo/spaghetti-alla-puttanesca-italian-pasta-dish-with-tomatoes-black-olives-capers-anchovies-basil-top-view-flat-lay_2829-20793.jpg?size=338&ext=jpg',
    'https://image.freepik.com/free-photo/preparation-ingredients-fetapasta-trending-feta-bake-pasta-recipe-made-cherry-tomatoes-feta-cheese-garlic-herbs-top-view-copy-space_2829-20702.jpg',
    'https://image.freepik.com/free-photo/turkish-pide-with-minced-meat-kiymali-pide-traditional-turkish-cuisine-turkish-pizza-pita-with-meat-top-view-overhead_2829-20272.jpg',
  ];
  List<Map<String, String>> categoriesList = [];

  @override
  void initState() {
    super.initState();

    categoriesList = [
      {
        'title': 'Sandwich',
        'imageUrl':
            'https://cdn.pixabay.com/photo/2016/03/05/19/02/hamburger-1238246_960_720.jpg',
      },
      {
        'title': 'Pizza',
        'imageUrl':
            'https://cdn.pixabay.com/photo/2017/02/15/10/57/pizza-2068272_960_720.jpg',
      },
      {
        'title': 'Meal',
        'imageUrl':
            'https://cdn.pixabay.com/photo/2015/12/08/00/26/food-1081707_960_720.jpg',
      },
      {
        'title': 'Sandwich',
        'imageUrl':
            'https://cdn.pixabay.com/photo/2016/03/05/19/02/hamburger-1238246_960_720.jpg',
      },
      {
        'title': 'Pizza',
        'imageUrl':
            'https://cdn.pixabay.com/photo/2017/02/15/10/57/pizza-2068272_960_720.jpg',
      },
      {
        'title': 'Meal',
        'imageUrl':
            'https://cdn.pixabay.com/photo/2015/12/08/00/26/food-1081707_960_720.jpg',
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: KScaffoldColor,
      appBar: const CustomAppBar(title: 'TOGETHER FOREVER',),
      
      body: ListView(
        padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
        children: [
          // const SearchWidget(),
          coverSection(context),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: CustomText(
              text: 'Categories',
              fontSize: 26.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => CategoryItem(
              title: categoriesList[index]['title']!,
              imageUrl: categoriesList[index]['imageUrl']!,
            ),
            itemCount: categoriesList.length,
          ),
        ],
      ),
      drawer: const AppDrawer(),
    );
  }

  Widget categorySection2() {
    return ListView.separated(
      //shrinkWrap: true,
      itemBuilder: (context, index) => SizedBox(
        width: SizeConfig.screenWidth,
        child: Stack(
          children: [
            FancyShimmerImage(
              imageUrl: categoriesList[index]['imageUrl']!,
            ),
            CustomText(
              text: categoriesList[index]['title']!,
              alignment: Alignment.center,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            )
          ],
        ),
      ),
      separatorBuilder: (context, index) => const SizedBox(
        width: 25.0,
      ),
      itemCount: categoriesList.length,
    );
  }

  Widget categorySection() => SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => SizedBox(
          width: 100,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(KBorderRadius),
                border: Border.all(color: Colors.grey)),
            child: GridTile(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(KBorderRadius),
                child: FancyShimmerImage(
                  imageUrl: categoriesList[index]['imageUrl']!,
                ),
              ),
              footer: CustomText(
                text: categoriesList[index]['title']!,
                alignment: Alignment.center,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(
          width: 25.0,
        ),
        itemCount: categoriesList.length,
      ));

  Widget coverSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        //alignment: AlignmentDirectional.bottomCenter,
        fit: StackFit.expand,
        children: [
          CarouselSlider.builder(
            options: CarouselOptions(
              //height: 400,
              aspectRatio: 1,
              viewportFraction: 1,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _indexImage = index;
                });
              },

              scrollDirection: Axis.horizontal,
              disableCenter: true,
            ),
            itemBuilder: (context, index, realIndex) => ClipRRect(
              borderRadius: BorderRadius.circular(KBorderRadius),
              child: FancyShimmerImage(
                imageUrl: imageCoverList[index],
              ),
            ),
            itemCount: imageCoverList.length,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(imageCoverList.length, (index) {
                  return Container(
                    width: 20.0,
                    height: 3.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color:
                            _indexImage == index ? Colors.black : Colors.grey),
                  );
                })),
          ),
        ],
      ),
    );
  }
}
