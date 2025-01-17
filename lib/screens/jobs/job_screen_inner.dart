import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip_calicut/controllers/agencyapicontroller.dart';
import 'package:trip_calicut/screens/jobs/components/FixedBottomSwitch.dart';
import 'package:trip_calicut/screens/tours/components/AppBarWidget.dart';
import 'package:trip_calicut/widgets.dart';

import '../../controllers/jobsapicardcontroller.dart';

class JobInnerScreen extends StatelessWidget {
  final agencyController = Get.put(AgencyApiController());
  final controllerValue = Get.arguments[0];
  final index = Get.arguments[1];
  final controller = Get.arguments[2];

  JobInnerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(56),
          child: Obx(() {
            if (controller.isLoading.value) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return AppBar(
                backgroundColor: Colors.white,
                title: Text('${controllerValue.name}',
                    style: TextStyle(color: Colors.blue)),
                leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.blue,
                    ),
                    onPressed: () {
                      Get.offNamed('/jobs');
                    }),
              );
            }
          })),
      body: SafeArea(
        child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (OverscrollIndicatorNotification overscroll) {
          overscroll.disallowIndicator();
          return false;
        }, child: Obx(() {
          if (controller.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(15),
              child: Stack(
                children: <Widget>[
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(bottom: 20),
                          // height: 300.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white),
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    height: 130,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/JCB.jpg'),
                                            fit: BoxFit.cover),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20)),
                                        color: Colors.black),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Container(
                                      width: 150,
                                      height: 30,
                                      child: Center(
                                        child: Text(
                                          '₹${controllerValue.salaryPackage}',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black87),
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                          color: Colors.white60,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(30))),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 15),
                                      child: Container(
                                        width: 280,
                                        child: Text(
                                          '${controllerValue.name}',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                            // fontFamily: 'Lato'
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_pin,
                                          size: 18,
                                          color: Color(0xFF00A6F6),
                                        ),
                                        Text(
                                          '${controllerValue.place}',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.green,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      '${controllerValue.experience}',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black87),
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Text(
                                      '${controllerValue.qualification}',
                                      textAlign: TextAlign.justify,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87),
                                      maxLines: 5,
                                    ),
                                    // Text(
                                    //   'Edabroad is one of the leading study abroad\nconsultants in Cochin with immense ...',
                                    //   overflow: TextOverflow.ellipsis,
                                    //   maxLines: 2,
                                    // ),
                                    heightSizedBox(),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        heightSizedBox(),
                        Stack(
                          children: [
                            Container(
                              padding: EdgeInsets.only(bottom: 20),
                              // height: 305.h,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        height: 130,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/studyabroad.png'),
                                                fit: BoxFit.cover),
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20)),
                                            color: Colors.black),
                                      ),
                                      Positioned(
                                        top: 0,
                                        right: 0,
                                        child: Container(
                                          width: 150,
                                          height: 30,
                                          child: Center(
                                            child: Text(
                                              '40+ Countries',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black87),
                                            ),
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.white60,
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(30),
                                                topRight: Radius.circular(20)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 15),
                                      child: Column(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(left: 70),
                                            width: 180,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '${agencyController.agencyData.value[index].name}',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 2,
                                                  style: TextStyle(
                                                      color: Colors.blue,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.location_pin,
                                                      size: 18,
                                                      color: Color(0xFF00A6F6),
                                                    ),
                                                    Text(
                                                      '${agencyController.agencyData.value[index].district}',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.green,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 16,
                                          ),
                                          Text(
                                            '${agencyController.agencyData.value[index].address}',
                                            textAlign: TextAlign.justify,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black87),
                                            maxLines: 5,
                                          ),
                                          SizedBox(
                                            height: 16,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 250,
                                                child: Text(
                                                  'Other Jobs by ${agencyController.agencyData.value[index].name![0] + agencyController.agencyData.value[index].name![1]}',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 2,
                                                  style: TextStyle(
                                                      color: Colors.blue,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Icon(
                                                Icons.arrow_forward_ios,
                                                size: 20,
                                                color: Colors.blue,
                                              )
                                            ],
                                          )
                                        ],
                                      )),
                                ],
                              ),
                            ),
                            // Positioned(
                            //   top: 140.h,
                            //   left: 100.w,
                            //   child:
                            // ),
                            Positioned(
                              top: 95,
                              left: 10,
                              child: CircleAvatar(
                                radius: 38,
                                backgroundImage:
                                    AssetImage('assets/images/profile.png'),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 80,
                        ),
                      ],
                    ),
                  ),
                  FixedBottomSwitch(),
                ],
              ),
            );
          }
        })),
      ),
    );
  }
}
