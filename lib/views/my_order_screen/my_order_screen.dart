import 'package:flutter/material.dart';
import 'package:together_forever/views/my_order_screen/order_details_screen.dart';
import 'package:together_forever/widgets/custom_elevated_button.dart';
import 'package:together_forever/widgets/custom_label.dart';
import 'package:together_forever/widgets/custom_text.dart';

class MyOrderScreen extends StatelessWidget {
  const MyOrderScreen({Key? key}) : super(key: key);
  static const routeName = '/myOrderScreen';


  Future bottomSheetFun(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) =>const OrderDetailsBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.transparent,
        //centerTitle: true,
        title: const CustomText(
          text: 'MY ORDER',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          //alignment: Alignment.center,
          color: Colors.white,
        ),
        elevation: 0,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: Colors.grey.shade300,
          margin: const EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    CustomText(
                      text: 'ORDER DATE',
                      fontWeight: FontWeight.bold,
                    ),
                    CustomText(
                      text: '2020-11-23 15:11',
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    CustomText(
                      text: 'ORDER STATUS',
                      fontWeight: FontWeight.bold,
                    ),
                    CustomText(
                      text: 'confirmed',
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    CustomText(
                      text: 'ORDER NUMBER',
                      fontWeight: FontWeight.bold,
                    ),
                    CustomText(
                      text: '234587',
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    CustomText(
                      text: 'TOTAL',
                      fontWeight: FontWeight.bold,
                    ),
                    CustomText(
                      text: '15 EURO',
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CustomElevatedButton(
                    text: 'VIEW',
                    onPressed: () => bottomSheetFun(context),
                  ),
                ),
              ],
            ),
          ),
        ),
        itemCount: 4,
      ),
    );
  }
}
