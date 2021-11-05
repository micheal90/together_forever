import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:together_forever/shared/constants.dart';
import 'package:together_forever/widgets/custom_text.dart';

class GridItem extends StatefulWidget {
  const GridItem(
      {required this.imageUrl,
      required this.title,
      required this.subTitle,
      required this.price,
      Key? key})
      : super(key: key);
  final String imageUrl, title, subTitle;
  final double price;
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
            ? Column(
                children: [
                  Stack(
                    children: [
                      FancyShimmerImage(
                        imageUrl: widget.imageUrl,
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
                              text: 'Euro ${widget.price}',
                            ),
                          ))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: CustomText(
                      text: widget.title,
                      color: Colors.amber,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Divider(
                    color: Colors.amber,
                    endIndent: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: CustomText(
                      text: widget.subTitle,
                      fontSize: 14,
                    ),
                  ),
                ],
              )
            : Container(
                color: Colors.grey.shade100,
                child: Stack(
                  children: [
                    Positioned(
                      top: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  isPressed = false;
                                });
                              },
                              icon: const Icon(Icons.arrow_back)),
                          const SizedBox(
                            width: 10.0,
                          ),
                          CustomText(
                            text: widget.title,
                            color: Colors.amber,
                          )
                        ],
                      ),
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: Row(
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
                        )),
                    Positioned(
                        bottom: 20,
                        left: 0,
                        right: 0,
                        child: IntrinsicWidth(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Divider(
                                color: Colors.amber,
                              ),
                              IntrinsicHeight(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                        onPressed: () {},
                                        child: const Text('CUSTOMIZE',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold))),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ));
  }
}
