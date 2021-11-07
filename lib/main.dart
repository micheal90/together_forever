import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:together_forever/core/services/cash_helper.dart';
import 'package:together_forever/screens/category_screen/category_screen.dart';
import 'package:together_forever/screens/customize_screen/customize_screen.dart';
import 'package:together_forever/shared/constants.dart';
import 'package:together_forever/helper/binding.dart';
import 'package:together_forever/screens/control_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CashHelper.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Binding(),
      title: 'Together Forever',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //primaryColor: KPrimaryColor,
        primarySwatch: primarySwatch,

        fontFamily: 'RobotoCondensed',
      ),
      initialRoute: CustomizeScreen.routeName,
      getPages: [
        GetPage(name: '/', page: () => ControlScreen()),
        GetPage(
          name: CategoryScreen.routeName,
          page: () => const CategoryScreen(),
        ),
        GetPage(
          name: CustomizeScreen.routeName,
          page: () =>const CustomizeScreen(),
        )
      ],
    );
  }
}
