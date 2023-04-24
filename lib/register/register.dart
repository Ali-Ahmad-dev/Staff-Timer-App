import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timefolio/register/registerController.dart';

import '../login/loginView.dart';
import '../styles/ColorSelect.dart';
import '../styles/textStyle.dart';

class RegisterView extends StatelessWidget {
  RegisterView({Key? key}) : super(key: key);
  final RegisterController controller = Get.put(RegisterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: Get.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                Color.fromARGB(255, 184, 89, 190),
                Color.fromARGB(255, 56, 208, 200)
              ])),
          child: Center(
            child: Container(
              height: Get.height - 150,
              width: Get.width - 70,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(150),
                    topLeft: Radius.circular(100),
                  )),
              child: Column(
                children: [
                  SizedBox(
                    height: 70,
                  ),
                  Text(
                    'Register',
                    style: TextStyles().headingText,
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  TextField(
                    controller: controller.userName.value,
                    decoration: new InputDecoration(
                        contentPadding: EdgeInsets.all(17),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              new BorderSide(color: ColorSelect.primaryClr),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        border: new OutlineInputBorder(
                            borderSide:
                                new BorderSide(color: ColorSelect.primaryClr),
                            borderRadius: BorderRadius.circular(50)),
                        hintText: 'Username',
                        prefixIcon: const Icon(
                          Icons.person,
                          color: ColorSelect.primaryClr,
                        ),
                        suffixStyle: const TextStyle(color: Colors.green)),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextField(
                    controller: controller.emailController.value,
                    decoration: new InputDecoration(
                        contentPadding: EdgeInsets.all(17),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              new BorderSide(color: ColorSelect.primaryClr),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        border: new OutlineInputBorder(
                            borderSide:
                                new BorderSide(color: ColorSelect.primaryClr),
                            borderRadius: BorderRadius.circular(50)),
                        hintText: 'Email',
                        prefixIcon: const Icon(
                          Icons.email,
                          color: ColorSelect.primaryClr,
                        ),
                        suffixStyle: const TextStyle(color: Colors.green)),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Obx(() => TextField(
                        controller: controller.passwordController.value,
                        obscureText: controller.hidePassword.value,
                        decoration: new InputDecoration(
                            contentPadding: EdgeInsets.all(17),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  new BorderSide(color: ColorSelect.primaryClr),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            border: new OutlineInputBorder(
                                borderSide: new BorderSide(
                                    color: ColorSelect.primaryClr),
                                borderRadius: BorderRadius.circular(50)),
                            hintText: 'Password',
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: ColorSelect.primaryClr,
                            ),
                             suffixIcon: IconButton(
                                    color: ColorSelect.primaryClr,
                                    icon: controller.hidePassword.value
                                        ? Icon(Icons.visibility_off)
                                        : Icon(Icons.visibility),
                                    onPressed: () {
                                      controller.hidePassword.value =
                                          !controller.hidePassword.value;
                                    },
                                  ),
                            suffixStyle: const TextStyle(color: Colors.green)),
                      )),
                  SizedBox(
                    height: 40,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: MaterialButton(
                      onPressed: () {
                        controller.Register();
                      },
                      color: ColorSelect.primaryClr,
                      textColor: Colors.white,
                      child: Text(
                        'Register',
                        style: TextStyles().bodyTextWhite,
                      ),
                      padding: EdgeInsets.only(
                          top: 8, bottom: 8, left: 50, right: 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 200,
                    child: Divider(
                      color: ColorSelect.primaryClr,
                      thickness: 1,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () => Get.to(() => LoginView()),
                    child: Text(
                      'Already have an account?',
                      style: TextStyles().bodyTextUnderline,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
