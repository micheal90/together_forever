import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:together_forever/shared/constants.dart';
import 'package:together_forever/widgets/app_drawer.dart';
import 'package:together_forever/widgets/custom_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GoogleSignIn googleSignIn = GoogleSignIn();

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  int _indexImage = 0;
  final List<String> imageList = [
    'https://image.freepik.com/free-photo/minestrone-italian-vegetable-soup-with-pasta-dark-table_2829-20843.jpg',
    'https://img.freepik.com/free-photo/spaghetti-alla-puttanesca-italian-pasta-dish-with-tomatoes-black-olives-capers-anchovies-basil-top-view-flat-lay_2829-20793.jpg?size=338&ext=jpg',
    'https://image.freepik.com/free-photo/preparation-ingredients-fetapasta-trending-feta-bake-pasta-recipe-made-cherry-tomatoes-feta-cheese-garlic-herbs-top-view-copy-space_2829-20702.jpg',
    'https://image.freepik.com/free-photo/turkish-pide-with-minced-meat-kiymali-pide-traditional-turkish-cuisine-turkish-pizza-pita-with-meat-top-view-overhead_2829-20272.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: CustomText(
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search for a product',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(KBorderRadius)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
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
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
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
                      child: Image.network(
                        imageList[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                    itemCount: imageList.length,
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(imageList.length, (index) {
                          return Container(
                            width: 20.0,
                            height: 3.0,
                            margin: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 4.0),
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: _indexImage == index
                                    ? Colors.black
                                    : Colors.grey),
                          );
                        })),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: const AppDrawer(),
    );
  }
}
