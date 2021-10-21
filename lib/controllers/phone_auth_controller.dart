import 'package:get/get.dart';

class PhoneAuthController extends GetxController {
  // FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  // String code = '+49';
  // String phone;
  // String _verificationCode;
  // StreamController<ErrorAnimationType> errorController;

  // @override
  // void onInit() {
  //   errorController = StreamController<ErrorAnimationType>();
  //   //verifyPhoneNumber();
  //   super.onInit();
  // }

  // @override
  // void onClose() {
  //   errorController.close();
  //   super.onClose();
  // }

  // verifyPhoneNumber() async {
  //   await _firebaseAuth
  //       .verifyPhoneNumber(
  //           phoneNumber: '$code$phone',
  //           verificationCompleted: (PhoneAuthCredential credential) async {
  //             await _firebaseAuth
  //                 .signInWithCredential(credential)
  //                 .then((value) => print('User loged in'));
  //           },
  //           verificationFailed: (FirebaseAuthException e) {
  //             print(e.toString());
  //           },
  //           codeSent: (String verificationId, int resendToken) {
  //             _verificationCode = verificationId;
  //           },
  //           codeAutoRetrievalTimeout: (String verificationId) {
  //             _verificationCode = verificationId;
  //           },
  //           timeout: Duration(seconds: 60))
  //       .then((value) => Get.to(OtpScreen()));
  // }

  // submitCode(String pin) async {
  //   try {
  //     await _firebaseAuth
  //         .signInWithCredential(PhoneAuthProvider.credential(
  //             verificationId: _verificationCode, smsCode: pin))
  //         .then((value) {
  //       if (value.user != null) {
  //         print('go to home');
  //         Authcontroller().saveUser(value);
  //         Get.offAll(ControlScreen());
  //       }
  //     });
  //   } catch (e) {
  //     Get.snackbar('Invalid OTP', e.toString());
  //   }
  // }
}
