import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:together_forever/widgets/custom_text.dart';

class CustomizeScreen extends StatelessWidget {
  const CustomizeScreen({Key? key}) : super(key: key);
  static const routeName = '/customizeScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            snap: true,
            floating: true,
            expandedHeight: 150,
            flexibleSpace: FlexibleSpaceBar(
              background: FancyShimmerImage(
                imageUrl:
                    'https://image.freepik.com/free-photo/turkish-pide-with-minced-meat-kiymali-pide-traditional-turkish-cuisine-turkish-pizza-pita-with-meat-top-view-overhead_2829-20272.jpg',
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
                Container(
                  color: Colors.grey.shade300,
                  padding: const EdgeInsets.all(15.0),
                  child: const CustomText(
                    text: 'Customization',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomText(text: 'Regular'),
                    const SizedBox(
                      width: 15.0,
                    ),
                    CustomText(text: 'Less'),
                    const SizedBox(
                      width: 15.0,
                    ),
                    CustomText(text: 'Remove'),
                    const SizedBox(
                      width: 15.0,
                    ),
                  ],
                ),
                Row(children: [
                  
                ],)
              ],
            )
          ]))
        ],
      ),
    );
  }
}
