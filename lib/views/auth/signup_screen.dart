import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:together_forever/shared/constants.dart';
import 'package:together_forever/controllers/auth_controller.dart';
import 'package:together_forever/views/auth/signin_screen.dart';
import 'package:together_forever/widgets/custom_elevated_button.dart';
import 'package:together_forever/widgets/custom_text.dart';
import 'package:together_forever/widgets/custom_text_form_field.dart';

class SignUpScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey();

  SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Authcontroller>(
      init: Get.find<Authcontroller>(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () => Get.back(),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const CustomText(
                      text: 'Together Forever',
                      fontSize: 30,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const CustomText(
                      text: 'SignUp to Continue',
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Image.asset(
                      'assets/images/logo2.png',
                      height: 150,
                      width: 150,
                    ),
                    const SizedBox(
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
                    const SizedBox(
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
                      keyboardType: TextInputType.emailAddress,
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
                      height: 60,
                    ),
                    controller.loading.value
                        ? const CircularProgressIndicator()
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
