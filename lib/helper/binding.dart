import 'package:get/get.dart';
import 'package:together_forever/controllers/auth_controller.dart';
import 'package:together_forever/controllers/customize_meal_controller.dart';
import 'package:together_forever/controllers/phone_auth_controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Authcontroller());
    Get.lazyPut(() => PhoneAuthController());
    Get.lazyPut(() => CustomizeMealController(),fenix: true);
  }
}
