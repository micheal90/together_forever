import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:together_forever/controllers/auth_controller.dart';
import 'package:together_forever/screens/auth/phone_auth_screen.dart';
import 'package:together_forever/screens/auth/signup_screen.dart';
import 'package:together_forever/widgets/custom_text.dart';
import 'package:together_forever/widgets/custom_text_form_field.dart';
import 'package:together_forever/shared/constants.dart';
import 'package:together_forever/widgets/custom_elevated_button.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Authcontroller>(
      init: Get.find<Authcontroller>(),
      builder: (controller) => Scaffold(
        // extendBodyBehindAppBar: true,

        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomText(
                          text: 'Together Forever',
                          fontSize: 30,
                        ),
                        GestureDetector(
                          onTap: () => Get.to(SignUpScreen()),
                          child: const CustomText(
                            text: 'Sign Up',
                            fontSize: 18,
                            color: KPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const CustomText(
                      text: 'Sign in to Continue',
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // SvgPicture.asset(
                    //   'assets/images/logo.svg',
                    //   width: 200,
                    //   height: 180,
                    //   // fit: BoxFit.cover,
                    // ),
                    Image.asset(
                      'assets/images/logo2.png',
                      height: 150,
                      width: 150,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                      text: 'Email',
                      hint: 'example@gmail.com',
                      keyboardType: TextInputType.emailAddress,
                      validator: (String? value) {
                        if (!GetUtils.isEmail(value!.trim())) {
                          return 'Enter a valid email';
                        } else
                          return null;
                      },
                      onSave: (String? value) {
                        controller.email = value!.trim();
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                      text: 'Password',
                      hint: '*********',
                      keyboardType: TextInputType.visiblePassword,
                      suffixIcon: controller.passwordShow.value
                          ? GestureDetector(
                              onTap: () => controller.changeVisibilePassword(),
                              child: const Icon(
                                Icons.visibility_off,
                                color: KPrimaryColor,
                              ),
                            )
                          : GestureDetector(
                              onTap: () => controller.changeVisibilePassword(),
                              child: const Icon(
                                Icons.visibility,
                                color: KPrimaryColor,
                              ),
                            ),
                      isPassword: controller.passwordShow.value ? true : false,
                      validator: (String? value) {
                        if (value == null || value.length < 6) {
                          return 'Is too short';
                        } else
                          return null;
                      },
                      onSave: (String? value) {
                        controller.password = value!.trim();
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomText(
                      text: 'Forgot Password?',
                      alignment: Alignment.topRight,
                      fontSize: 14,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    controller.loading.value
                        ? const CircularProgressIndicator()
                        : CustomElevatedButton(
                            text: 'SIGN IN',
                            onPressed: () {
                              FocusScope.of(context).unfocus();
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                controller.logInWithEmail();
                              }
                            },
                          ),
                    const SizedBox(
                      height: 15,
                    ),
                    const CustomText(
                      text: '-OR-',
                      fontSize: 18,
                      alignment: Alignment.center,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      IconButton(
                          iconSize: 50,
                          onPressed: () {
                            controller.googleSignInMethod();
                          },
                          icon: Image.asset(
                            'assets/images/google.png',
                            width: 50,
                            height: 50,
                          )),
                      const SizedBox(
                        width: 20,
                      ),
                      IconButton(
                          iconSize: 50,
                          onPressed: () => Get.to(PhoneAuthScreen()),
                          icon: Image.asset(
                            'assets/images/phone.png',
                            width: 50,
                            height: 50,
                          )),
                    ]),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
