import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:together_forever/models/meal_model.dart';
import 'package:together_forever/screens/customize_screen/customize_screen.dart';
import 'package:together_forever/widgets/custom_text.dart';

class GridItem extends StatefulWidget {
  const GridItem({required this.meal, Key? key}) : super(key: key);
  final Meal meal;

  @override
  _GridItemState createState() => _GridItemState();
}

class _GridItemState extends State<GridItem> {
  bool isPressed = false;
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          setState(() {
            isPressed = true;
          });
        },
        child: isPressed == false
            ? SizedBox(
                width: 200,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        FancyShimmerImage(
                          imageUrl: widget.meal.imageUrl,
                          boxFit: BoxFit.cover,
                          height: 140,
                        ),
                        Positioned(
                            bottom: 2,
                            right: 0,
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.rectangle,
                                  border: Border.all(color: Colors.amber),
                                  borderRadius: const BorderRadius.horizontal(
                                      left: Radius.circular(15.0))),
                              child: CustomText(
                                text: 'Euro ${widget.meal.price}',
                              ),
                            ))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 2,
                          child: CustomText(
                            text: widget.meal.title,
                            color: Colors.amber,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: IconButton(
                              onPressed: () {},
                              icon: widget.meal.isFavorite
                                  ? const Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    )
                                  : const Icon(
                                      Icons.favorite_border,
                                      color: Colors.red,
                                    )),
                        )
                      ],
                    ),
                    const Divider(
                      color: Colors.amber,
                      endIndent: 30,
                      height: 0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: CustomText(
                        text: widget.meal.subTitle,
                        fontSize: 14,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
              )
            : Container(
                color: Colors.grey.shade100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                isPressed = false;
                              });
                            },
                            icon: const Icon(Icons.arrow_back)),
                        Expanded(
                          child: CustomText(
                            text: widget.meal.title,
                            color: Colors.amber,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            padding: const EdgeInsets.only(bottom: 30.0),
                            onPressed: () {
                              setState(() {
                                if (count > 1) {
                                  count--;
                                }
                              });
                            },
                            icon: const Icon(
                              Icons.minimize,
                              size: 35,
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          count.toString(),
                          style: const TextStyle(
                              color: Colors.amber,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                count++;
                              });
                            },
                            icon: const Icon(
                              Icons.add,
                              size: 35,
                            )),
                      ],
                    ),
                    IntrinsicWidth(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Divider(
                            color: Colors.amber,
                          ),
                          IntrinsicHeight(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                    onPressed: () {},
                                    child: const Text('ADD Quick',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold))),
                                const VerticalDivider(
                                  color: Colors.amber,
                                ),
                                TextButton(
                                    onPressed: () =>
                                        Get.toNamed(CustomizeScreen.routeName,arguments: widget.meal.id),
                                    child: const Text('CUSTOMIZE',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold))),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ));
  }
}
