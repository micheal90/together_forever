import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:together_forever/shared/constants.dart';
import 'package:together_forever/controllers/auth_controller.dart';
import 'package:together_forever/screens/auth/phone_auth_screen.dart';
import 'package:together_forever/widgets/custom_elevated_button.dart';

import 'package:together_forever/widgets/custom_text.dart';

class OtpScreen extends StatelessWidget {
  //TextEditingController textEditingController = TextEditingController();
  // ..text = '123456';

  //StreamController<ErrorAnimationType> errorController;

  String _currentText = '';
  final GlobalKey<FormState> _otpKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Authcontroller>(
      init: Get.find<Authcontroller>(),
      builder: (controller) => controller.loading.value
          ? Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  color: KPrimaryColor,
                ),
              ),
            )
          : Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                title: CustomText(
                  text: 'Together Forever',
                  fontSize: 30,
                ),
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                  onPressed: () => Get.off(PhoneAuthScreen()),
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    CustomText(
                      text: 'Phone Number Verification',
                      alignment: Alignment.center,
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CustomText(
                      text:
                          'Enter the code sent to ${controller.code} ${controller.phone}',
                      alignment: Alignment.center,
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 30),
                        child: PinCodeTextField(
                          key: _otpKey,

                          appContext: context,
                          pastedTextStyle: TextStyle(
                            color: Colors.green.shade600,
                            fontWeight: FontWeight.bold,
                          ),

                          length: 6,
                          obscureText: false,
                          obscuringCharacter: '*',
                          animationType: AnimationType.fade,
                          validator: (String? v) {
                            if (v!.length < 6) {
                              return 'Enter all fields';
                            } else {
                              return null;
                            }
                          },
                          pinTheme: PinTheme(
                              shape: PinCodeFieldShape.box,
                              borderRadius: BorderRadius.circular(5),
                              fieldHeight: 50,
                              fieldWidth: 40,
                              borderWidth: 2,
                              activeColor: KPrimaryColor,
                              inactiveFillColor: Colors.grey.shade500,
                              // disabledColor: Colors.white,
                              activeFillColor: Colors.grey.shade500),
                          cursorColor: Colors.black,
                          animationDuration: Duration(milliseconds: 300),
                          textStyle: TextStyle(
                              fontSize: 30,
                              height: 1.6,
                              color: Colors.blueGrey),
                          //backgroundColor: null,
                          //enableActiveFill: true,

                          errorAnimationController: controller.errorController,
                          //controller: textEditingController,
                          keyboardType: TextInputType.number,

                          onCompleted: (value) {
                            controller.pin = value;
                            controller.submitCode();
                          },

                          // onTap: () {
                          //   print('Pressed');
                          // },
                          onChanged: (value) {
                            print(value);

                            _currentText = value;
                          },
                          beforeTextPaste: (text) {
                            print('Allowing to paste $text');
                            //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                            //but you can show anything you want here, like your pop up saying wrong paste format or etc
                            return true;
                          },
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          text: 'Didn\'t receive the code? ',
                        ),
                        TextButton(
                            onPressed: () {
                              Get.off(PhoneAuthScreen());
                            },
                            child: CustomText(
                              text: 'RESEND',
                              color: KPrimaryColor,
                              fontSize: 18,
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: controller.loading.value
                          ? CircularProgressIndicator(
                              color: KPrimaryColor,
                            )
                          : CustomElevatedButton(
                              text: 'SIGN IN',
                              onPressed: () {
                                if (_currentText.length < 6) {
                                  Get.snackbar('Enter OTP code!',
                                      'Please enter the code sent to the phone number ',
                                      duration: Duration(seconds: 5),
                                      snackPosition: SnackPosition.BOTTOM);
                                  return;
                                }
                                controller.submitCode();
                              },
                            ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
