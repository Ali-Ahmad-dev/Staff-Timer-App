import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/firebaseServices.dart';

class RegisterController extends GetxController {
final _firebaseServices =  FirebaseServices.instance;
  RxBool hidePassword = true.obs;

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final userName = TextEditingController().obs;


  Future<void> Register() async {
    await _firebaseServices.createUser(
        emailController.value.text, passwordController.value.text,userName.value.text );

        if(_firebaseServices.isregister == true){
          emailController.value.text = '';
          passwordController.value.text = '';
          userName.value.text = '';
        }
  }
}
