import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:together_forever/shared/constants.dart';
import 'package:together_forever/controllers/auth_controller.dart';
import 'package:together_forever/screens/auth/signin_screen.dart';
import 'package:together_forever/widgets/custom_elevated_button.dart';
import 'package:together_forever/widgets/custom_text.dart';
import 'package:together_forever/widgets/custom_text_form_field.dart';

class SignUpScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Authcontroller>(
      init: Get.find<Authcontroller>(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () => Get.offAll(SignInScreen()),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 30),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomText(
                      text: 'Together Forever',
                      fontSize: 40,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomText(
                      text: 'SignUp to Continue',
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Image.asset(
                      'assets/images/logo2.png',
                      height: 150,
                      width: 150,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                      text: 'Name',
                      hint: 'Enter you name',
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Enter a name please';
                        } else
                          return null;
                      },
                      onSave: (String? value) {
                        controller.name = value!.trim();
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                      text: 'Email',
                      hint: 'example@gmail.com',
                      validator: (String? value) {
                        if (value == null || !value.contains('@')) {
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
                      height: 60,
                    ),
                    controller.loading.value
                        ? CircularProgressIndicator()
                        : CustomElevatedButton(
                            text: 'SIGN UP',
                            onPressed: () {
                              FocusScope.of(context).unfocus();

                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                controller.signUpWithEmail();
                              }
                            },
                          ),
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
