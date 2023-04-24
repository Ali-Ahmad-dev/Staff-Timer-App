import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timefolio/records/userController.dart';
import 'package:timefolio/userData/userData.dart';

class users extends StatelessWidget {
  final userController controller = Get.put(userController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        iconTheme:
            IconThemeData(color: Color.fromARGB(255, 12, 132, 16), size: 30),
        title: Text(
          'Details',
          style: TextStyle(
            color: Color.fromARGB(255, 12, 132, 16),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
              child: Obx(() => controller.isLoading.value == true
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 80),
                        child: CircularProgressIndicator(
                          color: Colors.green,
                        ),
                      ),
                    )
                  : Column(
                      children: [
                        ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.dates.length,
                            itemBuilder: (context, index) => InkWell(
                                  onTap: () {
                                    Get.to(() => usersData(),
                                        arguments:
                                            controller.dates[index].toString());
                                  },
                                  child: Container(
                                      margin: EdgeInsets.only(
                                          top: 10, left: 7, right: 7),
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: Colors.greenAccent.shade100,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              controller.dates[index]
                                                  .toString(),
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Color.fromARGB(
                                                    255, 6, 132, 12),
                                              ),
                                            ),
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios_outlined,
                                            color:
                                                Color.fromARGB(255, 6, 116, 10),
                                          ),
                                        ],
                                      )),
                                )),
                      ],
                    ))),
        ),
      ),
    );
  }
}
