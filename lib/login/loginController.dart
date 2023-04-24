import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timefolio/login/loginView.dart';
import '../home/homeView.dart';
import '../services/firebaseServices.dart';
import '../services/getStorage.dart';

class LoginController extends GetxController {
  FirebaseServices _firebaseServices = FirebaseServices.instance;
  static final _services = GetStorageServices();
  RxBool hidePassword = true.obs;
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  Login() async {
    await _firebaseServices.signIn(
        emailController.value.text, passwordController.value.text);
       if( _firebaseServices.isLoggedIn == true) {
        emailController.value.text = '';
        passwordController.value.text = '';
       }
       
  }

  dynamic checking_session() async {
    var session = await _services.getSession();
    if (session == true) {
      Get.to(
        () => homeView(),
      );
    } else {
      Get.to(
        () => LoginView(),
      );
    }
  }

  @override
  void onInit() {
    checking_session();

    // TODO: implement onInit
  }
 
}
