import 'package:action_slider/action_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timefolio/home/homeController.dart';
import 'package:timefolio/records/users.dart';
import 'package:timefolio/styles/ColorSelect.dart';
import 'package:timefolio/userData/userData.dart';

class homeView extends StatelessWidget {

  final controller = Get.put(homeController(), );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: SafeArea(
          child:  Obx(() => controller.isLoading.value == true 
                  ? Center(
                      child:  SpinKitWave(
                        type: SpinKitWaveType.start,
                        size: 40,
                        color: Colors.green,
                      
                      ),
                    )
                  :  Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
               Get.to(() => users());
                        },
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            width: 60,
                            height: 65,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(50),
                              ),
                            ),
                            child: Icon(
                              Icons.menu,
                              color: Colors.green,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.defaultDialog(
                              title: "Are you sure you want to Logout?",
                              backgroundColor: Colors.white,
                              titleStyle: TextStyle(color: Colors.black),
                              buttonColor: Colors.red,
                              barrierDismissible: false,
                              radius: 20,
                              content: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      TextButton(
                                        onPressed: ()   {
                                        controller.logOut();
                   
                                       
                                        },
                                        child: Text(
                                          'Yes',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 22),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        child: Text(
                                          'No',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 22),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ));
                        },
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            width: 65,
                            height: 65,
                            decoration: BoxDecoration(
                              color: Colors.red.shade700,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(50),
                              ),
                            ),
                            child: Icon(
                              Icons.login_outlined,
                              color: Colors.white,
                              size: 35,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 12, top: 20, bottom: 10),
                      child: Text(
                        'Welcome,',
                        style: GoogleFonts.ubuntu(
                          textStyle: TextStyle(
                              color: Colors.grey,
                              letterSpacing: .5,
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 50, top: 3),
                      child: Obx(() => Text(
                            '${controller.currentUser.value}',
                            style: GoogleFonts.ubuntu(
                              textStyle: TextStyle(
                                  color: Color.fromARGB(255, 28, 142, 26),
                                  letterSpacing: .5,
                                  fontSize: 23),
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            controller.status.value == 'true' || controller.status.value == 'false' || controller.active.value == 'false' || controller.active.value == 'true'
                 
                    ? 
                     Neumorphic(
                        style: NeumorphicStyle(
                            shape: NeumorphicShape.concave,
                            boxShape: NeumorphicBoxShape.roundRect(
                                BorderRadius.circular(12)),
                            depth: 17,
                            lightSource: LightSource.topLeft,
                            color: Colors.white10),
                        child: Container(
                          height: 200,
                          width: Get.width - 50,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Checked In',
                                      style: GoogleFonts.ubuntu(
                                        textStyle: TextStyle(
                                            color: Colors.green,
                                            letterSpacing: .5,
                                            fontSize: 19),
                                      ),
                                    ),
                                    Text(
                                      '${controller.checkInTime.value.toString()}',
                                      style: GoogleFonts.ubuntu(
                                        textStyle: TextStyle(
                                            color: Colors.green,
                                            letterSpacing: .5,
                                            fontSize: 17),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Check Out',
                                      style: GoogleFonts.ubuntu(
                                        textStyle: TextStyle(
                                            color: Colors.red.shade600,
                                            letterSpacing: .5,
                                            fontSize: 17),
                                      ),
                                    ),
                                    Text(
                                      '${controller.checkOutTime.value.toString()}',
                                      style: GoogleFonts.ubuntu(
                                        textStyle: TextStyle(
                                            color: Colors.red,
                                            letterSpacing: .5,
                                            fontSize: 17),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Total Hours',
                                      style: GoogleFonts.ubuntu(
                                        textStyle: TextStyle(
                                            color: Colors.green,
                                            letterSpacing: .5,
                                            fontSize: 17),
                                      ),
                                    ),
                                    Text(
                                      '${controller.totalTime.value.toString()}',
                                      style: GoogleFonts.ubuntu(
                                        textStyle: TextStyle(
                                            color: Colors.green,
                                            letterSpacing: .5,
                                            fontSize: 17),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )  :   Text(
                        'Check In and Start Working!',
                        style: GoogleFonts.ubuntu(
                          textStyle: TextStyle(
                              color: Colors.green,
                              letterSpacing: .5,
                              fontSize: 20),
                        ),
                      ),
             
    
                   
                    controller.status.value == 'true' || controller.active.value == 'true'
                      ?      Padding(
                            padding: const EdgeInsets.only(bottom: 70),
                             child: ActionSlider.standard(
                            icon: Icon(
                              Icons.arrow_forward_ios_sharp,
                              color: Colors.white,
                              size: 30,
                            ),
                            width: 310.0,
                            actionThresholdType: ThresholdType.release,
                            child: const Text(
                              'Slide to Check Out',
                              style: TextStyle(
                                color: Color.fromARGB(255, 152, 33, 24),
                                fontSize: 20,
                              ),
                            ),
                            action: (con) async {
                              con.loading(); //starts loading animation
                              await Future.delayed(const Duration(seconds: 1));
                              con.success(); 
                              controller.active.value = 'false';
                              controller.checkOut();
                              //starts success animation
                              await Future.delayed(const Duration(seconds: 1));
                              con.reset(); //resets the slider
                            },
                            backgroundColor: Colors.redAccent.shade100,
                            toggleColor: Colors.red.shade700,
                            loadingIcon: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                            successIcon: Icon(
                              Icons.check,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                        )

                      : controller.status.value == 'false' || controller.active.value == 'false' ?
                      
                      Padding(
                          padding: const EdgeInsets.only(bottom: 50),
                          child: Center(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Thank You ',
                                      style: GoogleFonts.ubuntu(
                                        textStyle: TextStyle(
                                            color: Colors.black54,
                                            letterSpacing: .5,
                                            fontSize: 18),
                                      ),
                                    ),
                                    Text(
                                      '${controller.currentUser.value.toString()},',
                                      style: GoogleFonts.ubuntu(
                                        textStyle: TextStyle(
                                            color: Colors.green,
                                            letterSpacing: .5,
                                            fontSize: 20),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'You are done for today!',
                                      style: GoogleFonts.ubuntu(
                                        textStyle: TextStyle(
                                            color: Colors.black54,
                                            letterSpacing: .5,
                                            fontSize: 18),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ) :
                         Padding(
                      padding: const EdgeInsets.only(bottom: 70),
                      child: ActionSlider.standard(
                        icon: Icon(
                          Icons.arrow_forward_ios_sharp,
                          color: Colors.white,
                          size: 30,
                        ),
                        width: 310.0,
                        actionThresholdType: ThresholdType.release,
                        child: const Text(
                          'Slide to Check In',
                          style: TextStyle(
                            color: Color.fromARGB(255, 7, 129, 11),
                            fontSize: 20,
                          ),
                        ),
                        action: (cont) async {
                          cont.loading(); //starts loading animation
                          await Future.delayed(const Duration(seconds: 1));
                          cont.success(); //starts success animation
               controller.checkIn();
                          controller.active.value = 'true';
                          await Future.delayed(const Duration(seconds: 1));
                          cont.reset(); //resets the slider
                        },
                        backgroundColor: Colors.greenAccent,
                        toggleColor: Colors.greenAccent.shade700,
                        loadingIcon: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                        successIcon: Icon(
                          Icons.check,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ) 
                  
            ],
          ),
        ),
        ),
      ),
    );
  }
}
