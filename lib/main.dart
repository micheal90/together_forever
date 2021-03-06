import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:together_forever/core/services/cash_helper.dart';
import 'package:together_forever/views/add_address_screen/add_address_screen.dart';
import 'package:together_forever/views/category_screen/category_screen.dart';
import 'package:together_forever/views/checkout_screen/checkout_screen.dart';
import 'package:together_forever/views/customize_screen/customize_screen.dart';
import 'package:together_forever/shared/constants.dart';
import 'package:together_forever/helper/binding.dart';
import 'package:together_forever/views/control_screen.dart';
import 'package:together_forever/views/favorite_screen/favorite_screen.dart';
import 'package:together_forever/views/my_order_screen/my_order_screen.dart';
import 'package:together_forever/views/profile_screen/profile_screen.dart';
import 'package:together_forever/views/settings_screen/settings_screen.dart';

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
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: KPrimaryColor,
              systemNavigationBarColor: KPrimaryColor),
          actionsIconTheme: IconThemeData(color: Colors.white),
        iconTheme: IconThemeData(color: Colors.white),
        ),
        scaffoldBackgroundColor: KScaffoldColor,
        //primaryColor: KPrimaryColor,
        primarySwatch: primarySwatch,

        fontFamily: 'RobotoCondensed',
      ),
      //initialRoute: MyOrderScreen.routeName,
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
        ),
        GetPage(
            name: CheckOutScreen.routeName, page: () => const CheckOutScreen()),
        GetPage(name: FavoriteScreen.routeName, page: () => FavoriteScreen()),
        GetPage(
          name: SettingsScreen.routeName,
          page: () => const SettingsScreen(),
        ),
        GetPage(
          name: ProfileScreen.routeName,
          page: () => const ProfileScreen(),
        ),
        GetPage(
          name: AddAddressScreen.routeName,
          page: () => const AddAddressScreen(),
        ),
        GetPage(
          name: MyOrderScreen.routeName,
          page: () => const MyOrderScreen(),
        ),
      ],
    );
  }
}
