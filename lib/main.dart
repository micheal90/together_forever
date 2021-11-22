import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:together_forever/core/services/cash_helper.dart';
import 'package:together_forever/views/category_screen/category_screen.dart';
import 'package:together_forever/views/customize_screen/customize_screen.dart';
import 'package:together_forever/shared/constants.dart';
import 'package:together_forever/helper/binding.dart';
import 'package:together_forever/views/control_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CashHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
      //initialRoute: CustomizeScreen.routeName,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const ControlScreen()),
        GetPage(
          name: CategoryScreen.routeName,
          page: () => const CategoryScreen(),
        ),
        GetPage(
          name: CustomizeScreen.routeName,
          page: () => const CustomizeScreen(),
        )
      ],
    );
  }
}
