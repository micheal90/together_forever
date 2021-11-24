import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:together_forever/shared/constants.dart';
import 'package:together_forever/widgets/custom_elevated_button.dart';
import 'package:together_forever/widgets/custom_label.dart';
import 'package:together_forever/widgets/custom_text.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({Key? key}) : super(key: key);
  static const routeName = '/checkoutScreen';

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  final _formKey = GlobalKey<FormState>();
  DateTime? _selectedDateTime;

  List<Map<String, dynamic>> additionalInstruction = [
    {
      'title': 'CONTACTLESS DELIVERY',
      'value': false,
    },
    {
      'title': 'DONT RING BELL',
      'value': false,
    },
    {'title': 'GET CHANGE', 'value': false, 'change': null},
    {
      'title': 'NO CUTLERY',
      'value': false,
    },
    {
      'title': 'CALL ON ARRIVAL',
      'value': false,
    },
  ];

  OrderMethod _orderMethod = OrderMethod.DELIVERY;
  DeliverTime _deliverTime = DeliverTime.IMMEDIATE;
  String? _address = 'Damascus babtoma\nkasaa street\nphone 09984565478';
  String? _voucher;
  PaymentMethod _paymentMethod = PaymentMethod.CASH;

  void selectTimeDate(BuildContext context) {
    DatePicker.showDateTimePicker(
      context,
      onConfirm: (time) {
        print(time);
        setState(() {
          _selectedDateTime = time;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //extendBodyBehindAppBar: true,
      appBar: AppBar(
        // backgroundColor: Colors.transparent,
        //centerTitle: true,
        title: const CustomText(
          text: 'CHECKOUT',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          //alignment: Alignment.center,
          color: Colors.white,
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
          child: Column(children: [
        const CustomLabel(text: 'YOUR ORDER'),
        orderSection(),
        const CustomLabel(text: 'ORDER METHOD'),
        orderMethodSection(),
        const CustomLabel(text: 'DELIVERY ADDRESS'),
        deliverySection(),
        const CustomLabel(text: 'VOUCHER/COUPON'),
        voucherSection(),
        const CustomLabel(text: 'DELIVER TIME'),
        deliverTimeSection(),
        const CustomLabel(text: 'PAYMENT METHOD'),
        paymentMethodSection(),
        const CustomLabel(text: 'ADDITIONAL INSTRUCTIONS'),
        additionalInstructionSection(),
        const CustomLabel(text: 'PRICE'),
        priceSection(),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: CustomElevatedButton(
            text: 'SUBMIT',
            onPressed: () async {
              if (!_formKey.currentState!.validate()) return;
              _formKey.currentState!.save();
            },
          ),
        ),
      ])),
    );
  }

  Padding priceSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
          Row(
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
          const Text(
            'All items and delivery prices include 11% VAT',
            style: TextStyle(decoration: TextDecoration.underline),
          ),
        ],
      ),
    );
  }

  Form additionalInstructionSection() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CheckboxListTile(
              secondary: const Icon(Icons.phone_disabled_outlined),
              selected: additionalInstruction[0]['value'] ? true : false,
              title: CustomText(
                text: additionalInstruction[0]['title'],
              ),
              value: additionalInstruction[0]['value'],
              onChanged: (value) => setState(() {
                    additionalInstruction[0]['value'] = value!;
                  })),
          CheckboxListTile(
              secondary: const Icon(Icons.notifications_off),
              selected: additionalInstruction[1]['value'] ? true : false,
              title: CustomText(
                text: additionalInstruction[1]['title'],
              ),
              value: additionalInstruction[1]['value'],
              onChanged: (value) => setState(() {
                    additionalInstruction[1]['value'] = value!;
                  })),
          CheckboxListTile(
              secondary: const Icon(Icons.attach_money),
              selected: additionalInstruction[2]['value'] ? true : false,
              title: CustomText(
                text: additionalInstruction[2]['title'],
              ),
              subtitle: additionalInstruction[2]['value'] == true
                  ? TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Get Change',
                        border: InputBorder.none,
                        errorBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                      ),
                      keyboardType: TextInputType.number,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please, enter the change';
                        }
                      },
                      onSaved: (newValue) {
                        additionalInstruction[2]['change'] =
                            newValue.toString();
                      },
                    )
                  : null,
              value: additionalInstruction[2]['value'],
              onChanged: (value) => setState(() {
                    additionalInstruction[2]['value'] = value!;
                  })),
          CheckboxListTile(
              secondary: const Icon(Icons.no_meals),
              selected: additionalInstruction[3]['value'] ? true : false,
              title: CustomText(
                text: additionalInstruction[3]['title'],
              ),
              value: additionalInstruction[3]['value'],
              onChanged: (value) => setState(() {
                    additionalInstruction[3]['value'] = value!;
                  })),
          CheckboxListTile(
              secondary: const Icon(Icons.call),
              selected: additionalInstruction[4]['value'] ? true : false,
              title: CustomText(
                text: additionalInstruction[4]['title'],
              ),
              value: additionalInstruction[4]['value'],
              onChanged: (value) => setState(() {
                    additionalInstruction[4]['value'] = value!;
                  })),
        ],
      ),
    );
  }

  Row paymentMethodSection() {
    return Row(
      children: [
        Expanded(
          child: RadioListTile(
            title: const CustomText(text: 'CASH ON DELIVERY'),
            value: PaymentMethod.CASH,
            groupValue: _paymentMethod,
            onChanged: (PaymentMethod? value) => setState(() {
              _paymentMethod = value!;
            }),
          ),
        ),
        Expanded(
          child: RadioListTile(
            title: const CustomText(text: 'CREDIT CARD'),
            value: PaymentMethod.CREDIT,
            groupValue: _paymentMethod,
            onChanged: (PaymentMethod? value) => setState(() {
              _paymentMethod = value!;
            }),
          ),
        ),
      ],
    );
  }

  Widget deliverTimeSection() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: RadioListTile(
                title: const CustomText(text: 'Immediate'),
                value: DeliverTime.IMMEDIATE,
                groupValue: _deliverTime,
                onChanged: (DeliverTime? value) => setState(() {
                  _deliverTime = value!;
                }),
              ),
            ),
            Expanded(
              child: RadioListTile(
                title: const CustomText(text: 'Scheduled'),
                value: DeliverTime.SCHEDULED,
                groupValue: _deliverTime,
                onChanged: (DeliverTime? value) => setState(
                  () {
                    _deliverTime = value!;
                    selectTimeDate(context);
                  },
                ),
              ),
            ),
          ],
        ),
        if (_selectedDateTime != null && _deliverTime == DeliverTime.SCHEDULED)
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              DateFormat.yMd().add_Hm().format(_selectedDateTime!),
              style: const TextStyle(
                fontSize: 16,
                decoration: TextDecoration.underline,
              ),
            ),
          )
      ],
    );
  }

  Padding voucherSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Voucher/Coupon',
                border: InputBorder.none,
                errorBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
              ),
              onChanged: (value) => setState(() {
                _voucher = value;
              }),
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.send,
                color: KPrimaryColor,
              ))
        ],
      ),
    );
  }

  Padding deliverySection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TextField(
              maxLines: 3,
              decoration: InputDecoration(
                  hintText: _address,
                  border: InputBorder.none,
                  errorBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  enabled: false),
            ),
          ),
          TextButton(onPressed: () {}, child: const Text('OTHER')),
        ],
      ),
    );
  }

  Row orderMethodSection() {
    return Row(
      children: [
        Expanded(
          child: RadioListTile(
            title: const CustomText(text: 'Delivery'),
            value: OrderMethod.DELIVERY,
            groupValue: _orderMethod,
            onChanged: (OrderMethod? value) => setState(() {
              _orderMethod = value!;
            }),
          ),
        ),
        Expanded(
          child: RadioListTile(
            title: const CustomText(text: 'Takeaway'),
            value: OrderMethod.TAKEAWAY,
            groupValue: _orderMethod,
            onChanged: (OrderMethod? value) => setState(() {
              _orderMethod = value!;
            }),
          ),
        ),
      ],
    );
  }

  Widget orderSection() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => Card(
        elevation: 10,
        child: ListTile(
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
          //isThreeLine: true,
          trailing: FittedBox(
            child: IntrinsicHeight(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    //mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          iconSize: 28,
                          constraints: const BoxConstraints(),
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          icon: const Icon(
                            Icons.remove_circle_outline,
                          )),
                      Text(
                        '2',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                          iconSize: 28,
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          onPressed: () {},
                          icon: const Icon(
                            Icons.add_circle_outline,
                          )),
                    ],
                  ),
                  const VerticalDivider(
                    thickness: 1,
                    color: Colors.black,
                    // indent: 5,
                    // endIndent: 5,
                  ),
                  IconButton(
                      constraints: const BoxConstraints(),
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
      itemCount: 2,
    );
  }
}
