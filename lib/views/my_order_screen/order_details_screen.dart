import 'package:flutter/material.dart';
import 'package:together_forever/widgets/custom_label.dart';
import 'package:together_forever/widgets/custom_text.dart';

class OrderDetailsBottomSheet extends StatelessWidget {
  const OrderDetailsBottomSheet({Key? key}) : super(key: key);
  final String? _address = 'Damascus babtoma\nkasaa street\nphone 09984565478';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const CustomLabel(text: 'DETAILS'),
          detailsSection(),
          const CustomLabel(text: 'DELIVERY INFORMATION'),
          deliverInfoSection(),
          const CustomLabel(text: 'ITEMS'),
          itemsSection(),
          const CustomLabel(text: 'COST'),
          costSection(),
        ],
      ),
    );
  }

  Widget costSection() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomText(
                text: 'Subtotal',
                fontSize: 18,
              ),
              CustomText(
                text: '25.0 EURO',
              ),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              CustomText(
                text: 'Delivery Fees',
                fontSize: 18,
              ),
              CustomText(
                text: '3.0 EURO',
              ),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              CustomText(
                text: 'Discount',
                fontSize: 18,
              ),
              CustomText(
                text: '0.0 EURO',
              ),
            ],
          ),
          const Divider(),
          Container(
            color: Colors.grey.shade300,
            padding: const EdgeInsets.all(4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                CustomText(
                  text: 'Total',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                CustomText(
                  text: '13.0 EURO',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget itemsSection() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).primaryColor,
          child: FittedBox(
              child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              '\$10.0',
              style: const TextStyle(color: Colors.white),
            ),
          )),
        ),
        title: Text(
          'title',
          style: Theme.of(context).textTheme.bodyText2,
        ),
        subtitle: Text('Total: \$20.0'),
        trailing: Text(
          'X2',
        ),
      ),
      itemCount: 2,
    );
  }

  Widget deliverInfoSection() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              CustomText(
                text: 'Delivery Mode',
                fontWeight: FontWeight.bold,
              ),
              CustomText(
                text: 'Delivery',
              ),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomText(
                text: 'Address',
                fontWeight: FontWeight.bold,
              ),
              CustomText(
                text: _address,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget detailsSection() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
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
        ],
      ),
    );
  }
}
