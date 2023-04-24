import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timefolio/userData/userDataController.dart';

class usersData extends StatelessWidget {
  final userDataController controller = Get.put(userDataController());
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
        body:   SafeArea(
          child:  SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Container(
              padding: EdgeInsets.only(left: 7),
              child:   Column(
                children: [
                 Obx(() =>  controller.isLoading.value == true ? Text('') :   Padding(
                    padding: const EdgeInsets.only(
                        bottom: 40, left: 10, right: 10, top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Name',
                          style: TextStyle(
                            color: Color.fromARGB(255, 16, 111, 20),
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          'CheckIn',
                          style: TextStyle(
                              color: Color.fromARGB(255, 16, 111, 20),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'CheckOut',
                          style: TextStyle(
                            color: Color.fromARGB(255, 154, 21, 25),
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          'Hrs',
                          style: TextStyle(
                            color: Color.fromARGB(255, 133, 148, 0),
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),),
                  Center(
                    child: Obx(() => controller.isLoading.value == true ? Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 80),
                child: CircularProgressIndicator(
                  color: Colors.green,
                ),
              ),
            ):  ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.userdetails.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Column(
                              children: [
                                Center(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          children: [
                                            Text(
                                              controller.userdetails[index]
                                                      ['username']
                                                  .toString(),
                                              style: TextStyle(fontSize: 17),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          children: [
                                            Text(
                                              controller.userdetails[index]
                                                      ['checkin']
                                                  .toString(),
                                              style: TextStyle(
                                                fontSize: 17,
                                                color: Color.fromARGB(
                                                    255, 16, 111, 20),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          children: [
                                            Text(
                                              controller.userdetails[index]
                                                      ['checkout']
                                                  .toString(),
                                              style: TextStyle(
                                                fontSize: 17,
                                                color: Color.fromARGB(
                                                    255, 154, 21, 25),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          children: [
                                            Text(
                                              controller.userdetails[index]
                                                      ['diff']
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 147, 132, 3),
                                                  fontSize: 17),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  color: Color.fromARGB(255, 34, 75, 36),
                                  thickness: .5,
                                ),
                              ],
                            ),
                          );
                        })),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
