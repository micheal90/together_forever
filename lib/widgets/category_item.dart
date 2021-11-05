import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:together_forever/screens/category_screen/category_screen.dart';
import 'package:together_forever/shared/size_config.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({Key? key, required this.title, required this.imageUrl})
      : super(key: key);

  final String imageUrl, title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>Get.toNamed(CategoryScreen.routeName),
      child: SizedBox(
        height: 200,
        child: Stack(
          fit: StackFit.expand,
          children: [
            FancyShimmerImage(imageUrl: imageUrl),
            Positioned(
                bottom: 0,
                child: Container(
                    padding: const EdgeInsets.all(10.0),
                    width: SizeConfig.screenWidth,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.5),
                        ])),
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 26.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    )))
          ],
        ),
      ),
    );
  }
}
