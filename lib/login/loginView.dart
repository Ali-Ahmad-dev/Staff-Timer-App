import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timefolio/login/loginController.dart';

import '../register/register.dart';
import '../styles/ColorSelect.dart';
import '../styles/textStyle.dart';

class LoginView extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());

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
                Color.fromARGB(255, 79, 56, 198),
                Color.fromARGB(255, 208, 119, 116)
              ])),
          child: Center(
            child: Container(
              height: Get.height - 200,
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
                    height: 50,
                  ),
                  Text(
                    'Login',
                    style: TextStyles().headingText,
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Obx(() => TextField(
                        controller: controller.emailController.value,
                        decoration: InputDecoration(
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
                            hintText: 'Username',
                            prefixIcon: const Icon(
                              Icons.person,
                              color: ColorSelect.primaryClr,
                            ),
                            suffixStyle: const TextStyle(color: Colors.green)),
                      )),
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
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 8),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'Forget Password?',
                        style: TextStyles().smallText,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: MaterialButton(
                      onPressed: () {
                        controller.Login();
                      },
                      color: ColorSelect.primaryClr,
                      textColor: Colors.white,
                      child: Text(
                        'Login',
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
                    onTap: () => Get.to(
                      () => RegisterView(),
                    ),
                    child: Text(
                      'Dont have an account?',
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
