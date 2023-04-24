import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:timefolio/splashScreen/splashScreen.dart';

class splashScreen extends StatelessWidget {

final controller = Get.put(splashScreenController());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: Get.height,
      width: Get.width,
      child: Center(
         child: Image.asset('assets/sai.webp',
         
         height: 190,
         width: 190,
         )
      ),
    );
  }
}