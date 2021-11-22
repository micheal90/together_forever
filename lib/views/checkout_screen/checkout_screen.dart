import 'package:flutter/material.dart';
import 'package:together_forever/widgets/custom_text.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({Key? key}) : super(key: key);
  static const routeName = '/checkoutScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomText(
            text: 'Your Order',
          ),
          Expanded(
              child: ListView.builder(
            itemBuilder: (context, index) => Card(
              elevation: 10,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Theme.of(context).primaryColor,
                  child: FittedBox(
                      child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text('\$price'),
                  )),
                ),
                title: Text(
                  'title',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                subtitle:
                    Text('Total: \$ 3000'),
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
                                constraints: BoxConstraints(),
                                padding: EdgeInsets.zero,
                                onPressed: (){},
                                icon:const Icon(
                                  Icons.remove_circle_outline,
                                )),
                            Text('quantity'),
                            IconButton(
                                padding: EdgeInsets.zero,
                                constraints: BoxConstraints(),
                                onPressed: (){},
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
                            onPressed: (){},
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
          ))
        ],
      ),
    );
  }
}
