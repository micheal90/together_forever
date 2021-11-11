import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'package:together_forever/core/services/cash_helper.dart';
import 'package:together_forever/core/services/firestore_user.dart';
import 'package:together_forever/models/user_model.dart';
import 'package:together_forever/screens/auth/otp_screen.dart';
import 'package:together_forever/screens/control_screen.dart';

class Authcontroller extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String? email, password, name, imageUrl;
  String code = '+961'; //'+49';
  String? phone;
  late String pin;
  late String _verificationCode;

  StreamController<ErrorAnimationType>? errorController;
  ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;

  ValueNotifier<bool> passwordShow = ValueNotifier(true);

  Rxn<User> _user = Rxn<User>();

  String? get user => _user.value?.uid;
  //LocalStorageUser localStorageUser = Get.find();

  @override
  void onInit() async {
    super.onInit();
    _user.bindStream(_firebaseAuth.authStateChanges());
    if (_firebaseAuth.currentUser != null) {
      await getCurrentUserData(_firebaseAuth.currentUser!.uid);
    }
    errorController = StreamController<ErrorAnimationType>();
  }

  @override
  void onClose() {
    errorController!.close();
    super.onClose();
  }

  changeVisibilePassword() {
    passwordShow.value = !passwordShow.value;
    print(passwordShow.value);
    update();
  }

  void googleSignInMethod() async {
    loading.value = true;
    try {
      GoogleSignInAccount? googleAccount = await _googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      await _firebaseAuth.signInWithCredential(credential).then((user) async {
        saveUser(user);

        Get.offAll(ControlScreen());
      });
    } catch (e) {
      Get.snackbar("Error Registration Account", e.toString(),
          snackPosition: SnackPosition.BOTTOM);
      print(e.toString());
    }
    loading.value = false;
    update();
  }

  void logInWithEmail() async {
    loading.value = true;
    try {
      await _firebaseAuth
          .signInWithEmailAndPassword(email: email!, password: password!)
          .then((user) async {
        getCurrentUserData(user.user!.uid);
        //saveUser(user);
        Get.offAll(ControlScreen());
      });
    } on FirebaseException catch (e) {
      Get.snackbar("Error LogIn Account", e.message.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
    loading.value = false;
    update();
  }

  void signUpWithEmail() async {
    loading.value = true;
    try {
      await _firebaseAuth
          .createUserWithEmailAndPassword(email: email!, password: password!)
          .then((user) async {
        saveUser(user);
        Get.offAll(ControlScreen());
      });
    } on FirebaseException catch (e) {
      Get.snackbar("Error Registration Account", e.message.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
    loading.value = false;
    update();
  }

  void signOut() {
    _firebaseAuth.signOut();
  }

  void saveUser(UserCredential userCredential) async {
    UserModel userModel = UserModel(
        userId: userCredential.user!.uid,
        email: email != null
            ? email
            : userCredential.user!.email != null
                ? userCredential.user!.email
                : '$code$phone@example.com',
        name: name != null
            ? name
            : userCredential.user!.displayName != null
                ? userCredential.user!.displayName
                : '$code$phone',
        imageUrl: imageUrl != null
            ? imageUrl
            : userCredential.user!.photoURL != null
                ? userCredential.user!.photoURL
                : '');
    await FireStoreUser.addUserToFireStore(userModel)
        .then((value) => debugPrint('setUser'));
    //await setUserDataLocal(await userCredential.user!.getIdToken());

    update();
  }

  setUserDataLocal(String token) async {
    await CashHelper.putData(key: 'token', value: token);
    update();
  }

  Future getCurrentUserData(String uId) async {
    await FireStoreUser.getCurrentUserFromFireStore(uId).then((value) {
      //setUserDataLocal();
      //print(value.data());
    });
  }

  verifyPhoneNumber() async {
    _loading.value = true;
    await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: '$code$phone',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _firebaseAuth.signInWithCredential(credential).then((user) {
            if (user.user != null) {
              print('User loged in');
              saveUser(user);
              Get.offAll(ControlScreen());
            }
          });
          _loading.value = false;
          update();
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            _loading.value = false;
            Get.snackbar('invalid phone number',
                'The provided phone number is not valid.',
                snackPosition: SnackPosition.BOTTOM);
            update();
          }
        },
        codeSent: (String verificationId, int? resendToken) {
          _verificationCode = verificationId;
          Get.to(OtpScreen());
          _loading.value = false;
          update();
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          _verificationCode = verificationId;
          _loading.value = false;
          update();
        },
        timeout: Duration(seconds: 60));
    print('done');
    update();
  }

  submitCode() async {
    _loading.value = true;
    try {
      await _firebaseAuth
          .signInWithCredential(PhoneAuthProvider.credential(
              verificationId: _verificationCode, smsCode: pin))
          .then((user) {
        if (user.user != null) {
          print('go to home');
          saveUser(user);
          Get.offAll(ControlScreen());
        }
      });
      _loading.value = false;
    } catch (e) {
      Get.snackbar(
        'Invalid OTP',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 20),
        mainButton: TextButton(onPressed: () => Get.back(), child: Text('OK')),
      );
      _loading.value = false;
    }
    update();
  }
}
