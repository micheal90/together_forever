import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:get/get.dart';
import 'package:together_forever/shared/constants.dart';
import 'package:together_forever/controllers/auth_controller.dart';
import 'package:together_forever/views/auth/signin_screen.dart';
import 'package:together_forever/widgets/custom_elevated_button.dart';
import 'package:together_forever/widgets/custom_text.dart';

class PhoneAuthScreen extends StatelessWidget {
  
  String code = '+961';
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController phoneController = TextEditingController();

  PhoneAuthScreen({Key? key}) : super(key: key);
  void _onCountryChange(CountryCode countryCode) {
    code = countryCode.toString();
    print('New Country selected: ' + countryCode.toString());
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Authcontroller>(
      init: Get.find<Authcontroller>(),
      builder: (controller) => Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon:const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: () => Get.offAll(SignInScreen()),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CustomText(
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
                    height: 80,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CountryCodePicker(
                        onChanged: _onCountryChange,
                        // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                        initialSelection: 'lb',
                        favorite:const ['+961', 'lb','+49','de'],
                        // optional. Shows only country name and flag
                        showCountryOnly: false,
                        // optional. Shows only country name and flag when popup is closed.
                        showOnlyCountryWhenClosed: false,
                        // optional. aligns the flag and the Text left
                        alignLeft: false,
                      ),
                      Expanded(
                        child: Form(
                          key: _formKey,
                          child: TextFormField(
                            controller: phoneController,
                            keyboardType: TextInputType.number,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'Enter phone number';
                              } else
                                return null;
                            },
                            decoration: InputDecoration(
                              hintText: 'Phone',
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  controller.loading.value
                      ? CircularProgressIndicator(
                          color: KPrimaryColor,
                        )
                      : CustomElevatedButton(
                          text: 'SignUp',
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              FocusScope.of(context).unfocus();
                              controller.code = code;
                              controller.phone = phoneController.text;
                              controller.verifyPhoneNumber();
                            }
                          },
                        )
                ],
              ),
            ),
          )),
    );
  }
}
