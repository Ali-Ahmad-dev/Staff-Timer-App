import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timefolio/home/homeView.dart';
import 'package:timefolio/services/firestoreServices.dart';
import 'package:timefolio/services/getStorage.dart';

class FirebaseServices {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final getStorage = GetStorageServices();
  static final firestore = firestoreServices();

  FirebaseServices._privateConstructor();
  static final FirebaseServices instance =
      FirebaseServices._privateConstructor();

  bool isLoggedIn = false;
  bool isregister = false;

  Future createUser(String email, String password, String userName) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      await firestore.addUser(email, userName);
      await getStorage.setSession(true);
      await getStorage.saveUserLocally(email);
      isregister = true;
      Get.to(
        () => homeView(),
      );
    } on FirebaseAuthException catch (e) {
      isregister = false;

      Get.snackbar('Error', '${e.message}',
          colorText: Colors.white, snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      await getStorage.saveUserLocally(email);
      await getStorage.setSession(true);
      isLoggedIn = true;
      Get.to(
        () => homeView(),
      );
    } on FirebaseAuthException catch (e) {
      isLoggedIn = false;
      Get.snackbar('Error', '${e.message}',
          colorText: Colors.white, snackPosition: SnackPosition.BOTTOM);
    }
  }
}
