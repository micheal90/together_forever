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
            padding: const EdgeInsets.only(top: 10, left: 20, right: 30),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: 'Together Forever',
                          fontSize: 40,
                        ),
                        GestureDetector(
                          onTap: () => Get.to(SignUpScreen()),
                          child: CustomText(
                            text: 'Sign Up',
                            fontSize: 18,
                            color: KPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomText(
                      text: 'Sign in to Continue',
                      color: Colors.grey,
                    ),
                    SizedBox(
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
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                      text: 'Email',
                      hint: 'example@gmail.com',
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
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                      text: 'Password',
                      hint: '*********',
                      suffixIcon: controller.passwordShow.value
                          ? GestureDetector(
                              onTap: () => controller.changeVisibilePassword(),
                              child: Icon(
                                Icons.visibility_off,
                                color: KPrimaryColor,
                              ),
                            )
                          : GestureDetector(
                              onTap: () => controller.changeVisibilePassword(),
                              child: Icon(
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
                    SizedBox(
                      height: 20,
                    ),
                    CustomText(
                      text: 'Forgot Password?',
                      alignment: Alignment.topRight,
                      fontSize: 14,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    controller.loading.value
                        ? CircularProgressIndicator()
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
                    SizedBox(
                      height: 15,
                    ),
                    CustomText(
                      text: '-OR-',
                      fontSize: 18,
                      alignment: Alignment.center,
                    ),
                    SizedBox(
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
                      SizedBox(
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
