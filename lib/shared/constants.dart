import 'package:flutter/material.dart';

MaterialColor primarySwatch = MaterialColor(0xff00c569, color);
const String USER_DATA = 'userData';

const KPrimaryColor = Color(0xff00c569);
const KBackgroundColor = Color(0xfff8f5e3);
const KScaffoldColor = Color(0xfff8f5e3);

Map<int, Color> color = {
  50: Color.fromRGBO(0, 171, 103, .1),
  100: Color.fromRGBO(0, 171, 103, .2),
  200: Color.fromRGBO(0, 171, 103, .3),
  300: Color.fromRGBO(0, 171, 103, .4),
  400: Color.fromRGBO(0, 171, 103, .5),
  500: Color.fromRGBO(0, 171, 103, .6),
  600: Color.fromRGBO(0, 171, 103, .7),
  700: Color.fromRGBO(0, 171, 103, .8),
  800: Color.fromRGBO(0, 171, 103, .9),
  900: Color.fromRGBO(0, 171, 103, 1),
};
const double KBorderRadius = 15.0;
const double KPadding = 15.0;
// ignore: constant_identifier_names
enum Customization { REGULAR, LESS, REMOVE }
enum Booster {
  REGULAR,
  FRIES_WITH_PEPCI,
  FRIES_WITH_DITE_PEPCI,
  FRIES_WITH_7UP,
  FRIES_WITH_DITE_7UP,
  FRIES_WITH_BEER
}
enum OrderMethod{DELIVERY,TAKEAWAY}
enum DeliverTime{IMMEDIATE,SCHEDULED}
enum PaymentMethod{CASH,CREDIT}

convertBoosterToString(Booster value) {
    if (value == Booster.REGULAR) {
      return 'Regular';
    } else if (value == Booster.FRIES_WITH_PEPCI) {
      return 'Fries with pepci + 1.5 Euro';
    } else if (value == Booster.FRIES_WITH_DITE_PEPCI) {
      return 'Fries with dite pepci + 1.5 Euro';
    } else if (value == Booster.FRIES_WITH_7UP) {
      return 'Fries with 7up + 1.5 Euro';
    } else if (value == Booster.FRIES_WITH_DITE_7UP) {
      return 'Fries with dite 7up + 1.5 Euro';
    } else {
      return 'Fries with beer + 2 Euro';
    }
  }
